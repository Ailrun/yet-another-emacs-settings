;;; yaes-external-init --- initializations of external packages of yaes
;;;
;;; Commentary:
;;;
;;; Code:
(require 'f)
(require 'req-package)

(defconst yaes-external-dir
  (f-dirname (f-this-file)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;; Agda
;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if (executable-find "agda-mode")
    (progn
      (defconst yaes-agda-load-path (file-name-directory (shell-command-to-string "agda-mode locate")))

      (push yaes-agda-load-path load-path)

      (req-package agda2
        :ensure nil
        :mode
        ("\\.l?agda\\'" . agda2-mode)
        :custom
        (agda2-highlight-level 'non-interactive))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;; Proof General
;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defconst yaes-pg-load-path (f-join yaes-external-dir "ProofGeneral/generic"))

(push yaes-pg-load-path load-path)

(req-package proof-site
  :if (file-directory-p yaes-pg-load-path)
  :ensure nil
  :mode
  ("\\.v\\'" . coq-mode)
  :defines (proof-assistants)
  :custom
  (proof-assistants '(coq)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;; JDEE (Java Development Environment for Emacs)
;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defconst yaes-jdee-server-dir (f-join yaes-external-dir "JDEE/target"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;; Isar Mode
;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defconst yaes-isar-mode-load-path (f-join yaes-external-dir "isar-mode"))
(defconst yaes-lsp-isar-load-path (f-join yaes-external-dir "lsp-isar"))

(push yaes-isar-mode-load-path load-path)
(push yaes-lsp-isar-load-path load-path)

(req-package isar-mode
  :if (file-directory-p yaes-isar-mode-load-path)
  :ensure nil
  :mode
  ("\\.thy\\'" . isar-mode))

(req-package session-async
  :if (and (file-directory-p yaes-isar-mode-load-path)
           (file-directory-p yaes-lsp-isar-load-path))
  :ensure t)

(req-package lsp-isar
  :require (session-async isar-mode)
  :if (and (file-directory-p yaes-isar-mode-load-path)
           (file-directory-p yaes-lsp-isar-load-path))
  :ensure nil
  :init
  (add-hook 'isar-mode-hook #'lsp-isar-define-client-and-start)
  :custom
  (lsp-isar-path-to-isabelle (f-parent (f-parent (executable-find "isabelle")))))

(provide 'yaes-external-init)
;;; yaes-external-init.el ends here

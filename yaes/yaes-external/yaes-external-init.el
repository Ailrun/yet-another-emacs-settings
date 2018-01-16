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
  :config
  (setq proof-assistants '(coq)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;; JDEE (Java Development Environment for Emacs)
;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defconst yaes-jdee-server-dir (f-join yaes-external-dir "JDEE/target"))

(provide 'yaes-external-init)
;;; yaes-external-init.el ends here

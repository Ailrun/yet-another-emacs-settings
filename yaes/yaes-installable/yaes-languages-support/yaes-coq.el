;;; yaes-coq --- Coq related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'f)
(require 'use-package)

(defvar-local yaes-coq-coqtop-path (executable-find "coqtop"))
(defvar-local yaes-coq-emacs-lisp-path "")

(use-package proof-general
  :mode
  ("\\.v\\'" . coq-mode)
  :custom
  (proof-three-window-mode-policy 'hybrid))

(if yaes-coq-coqtop-path
    (progn
      (setq yaes-coq-emacs-lisp-path
            (f-join (f-dirname (f-dirname yaes-coq-coqtop-path)) "emacs"))
      (push yaes-coq-emacs-lisp-path load-path)
      (use-package coq-inferior
        :ensure nil
        :commands (run-coq))))

(use-package coq-commenter
  :defines coq-mode-map
  :after (proof-general)
  :diminish coq-commenter-mode
  :bind
  (:map coq-mode-map
        ("C-;" . coq-commenter-comment-proof-in-region)
        ("C-x C-;" . coq-commenter-comment-proof-to-cursor)
        ("C-'" . coq-commenter-uncomment-proof-in-region)
        ("C-x C-'" . coq-commenter-uncomment-proof-in-buffer))
  :hook
  (coq-mode . coq-commenter-mode))

(use-package company-coq
  :after (company yasnippet)
  :hook
  (coq-mode . company-coq-mode))

(provide 'yaes-coq)
;;; yaes-coq.el ends here

;;; yaes-coq --- Coq related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'f)
(require 'req-package)

(defvar-local yaes-coq-coqtop-path (executable-find "coqtop"))
(defvar-local yaes-coq-emacs-lisp-path "")

(if yaes-coq-coqtop-path
    (progn
      (setq yaes-coq-emacs-lisp-path
            (f-join (f-dirname (f-dirname yaes-coq-coqtop-path)) "emacs"))
      (push yaes-coq-emacs-lisp-path load-path)
      (req-package coq-inferior
        :ensure nil
        :commands (run-coq))))

(req-package coq-commenter
  :require (dash s cl-lib)
  :commands (coq-commenter-mode)
  :diminish coq-commenter-mode
  :bind
  (:map coq-mode-map
        ("C-;" . coq-commenter-comment-proof-in-region)
        ("C-x C-;" . coq-commenter-comment-proof-to-cursor)
        ("C-'" . coq-commenter-uncomment-proof-in-region)
        ("C-x C-'" . coq-commenter-uncomment-proof-in-buffer))
  :init
  (add-hook 'coq-mode-hook #'coq-commenter-mode))

(req-package company-coq
  :require (company-math company yasnippet dash cl-lib)
  :commands (company-coq-mode)
  :init
  (add-hook 'coq-mode-hook (lambda()
                             (company-coq-mode t))))

(provide 'yaes-coq)
;;; yaes-coq.el ends here

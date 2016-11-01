;;; yaes-parenthesis --- parenthesis-related functions of yaes
;;;
;;; Commentary:
;;;
;;; Code:
(require 'req-package)

;; Parenthesis pair completion package
(req-package smartparens
  ;; required emacs version : ???
  :require (dash cl-lib)
  :config (progn (smartparens-global-mode t)
				 (sp-with-modes '(emacs-lisp-mode lisp-mode)
				   (sp-local-pair "'" nil :actions nil)
				   (sp-local-pair "`" nil :actions nil))
				 (sp-with-modes '(LaTeX-mode latex-mode)
				   (sp-local-pair "`" "'")
				   (sp-local-pair "'" nil :actions nil))
				 (sp-with-modes '(coq-mode)
				   (sp-local-pair "'" nil :actions nil))
				 (sp-with-modes '(haskell-mode)
				   (sp-local-pair "'" nil :actions nil))))

(provide 'yaes-parenthesis)
;;; yaes-parenthesis.el ends here

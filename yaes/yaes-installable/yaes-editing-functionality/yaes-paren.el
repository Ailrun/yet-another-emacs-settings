;;; yaes-paren --- parentheses related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package smartparens
  :require (dash cl-lib)
  :config
  (smartparens-global-mode t)
  (sp-with-modes '(emacs-lisp-mode lisp-mode)
                 (sp-local-pair "'" nil :actions nil)
                 (sp-local-pair "`" nil :actions nil))
  (sp-with-modes '(LaTeX-mode latex-mode)
                 (sp-local-pair "`" "'")
                 (sp-local-pair "$" "$")
                 (sp-local-pair "'" nil :actions nil))
  (sp-with-modes '(coq-mode)
                 (sp-local-pair "'" nil :actions nil))
  (sp-with-modes '(haskell-mode)
                 (sp-local-pair "'" nil :actions nil)))

(req-package mic-paren
  :config
  (paren-activate))

(provide 'yaes-paren)
;;; yaes-paren.el ends here

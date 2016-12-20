;;; yaes-paren --- parentheses related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package smartparens
  :require (dash cl-lib)
  :diminish smartparens-mode
  :config
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
                 (sp-local-pair "'" nil :actions nil))
  (smartparens-global-mode t))

(req-package highlight-parentheses
  :diminish highlight-parentheses-mode
  :config
  (global-highlight-parentheses-mode t))

(provide 'yaes-paren)
;;; yaes-paren.el ends here

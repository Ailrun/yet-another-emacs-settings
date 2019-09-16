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
  (setq sp-escape-quotes-after-insert nil)
  (sp-with-modes '(coq-mode)
                 (sp-local-pair "'" nil :actions nil))
  (smartparens-global-mode t))

(req-package smartparens-config
  :ensure smartparens
  :require (smartparens)
  :config
  (eval-after-load 'auctex '(require 'smartparens-latex)))

(req-package highlight-parentheses
  :diminish highlight-parentheses-mode
  :config
  (global-highlight-parentheses-mode t))

(provide 'yaes-paren)
;;; yaes-paren.el ends here

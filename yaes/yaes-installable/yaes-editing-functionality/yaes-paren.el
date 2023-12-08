;;; yaes-paren --- parentheses related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package smartparens
  :require (dash cl-lib)
  :diminish smartparens-mode
  :custom
  (sp-escape-quotes-after-insert nil)
  :config
  (sp-with-modes '(coq-mode)
    (sp-local-pair "'" nil :actions nil))
  (sp-with-modes '(agda2-mode)
    (sp-local-pair "`" nil :actions nil)
    (sp-local-pair "⟨" "⟩")
    (sp-local-pair "⟦" "⟧")
    (sp-local-pair "⟪" "⟫")
    (sp-local-pair "⦇" "⦈")
    (sp-local-pair "⦅" "⦆")
    (sp-local-pair "⦃" "⦄"))
  (sp-with-modes '(lean-mode)
    (sp-local-pair "⟨" "⟩")
    (sp-local-pair "‹" "›"))
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

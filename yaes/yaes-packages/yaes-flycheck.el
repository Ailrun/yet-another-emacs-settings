(require 'req-package)

(req-package flycheck
  :require (buttercup)
  :config (progn (global-flycheck-mode 1)
		 (set-face-attribute 'flycheck-warning nil
				     :inherit 'warning
				     :underline nil)
		 (set-face-attribute 'flycheck-error nil
				     :inherite 'error
				     :underline t)))

(req-package flycheck-pos-tip
  :require (flycheck)
  :commands (flycheck-pos-tip-error-messages)
  :init (setq flycheck-dispaly-errors-function 'flycheck-poss-tip-error-messages))

(provide 'yaes-fly)

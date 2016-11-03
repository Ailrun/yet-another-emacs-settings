;;; yaes-flycheck --- on-the-fly syntax checking support of yaes
;;;
;;; Commentary:
;;;
;;; Code:
(require 'req-package)

;; On-the-fly syntax checker
(req-package flycheck
  :require (dash pkg-info let-alist seq)
  :config (global-flycheck-mode t))

;; Error display at pos-tip
(req-package flycheck-pos-tip
  :require (flycheck)
  :commands (flycheck-pos-tip-error-messages)
  :init (setq flycheck-display-errors-function
              #'flycheck-pos-tip-error-messages))

;; ;; Error display at pos-tip
;; ;; Loaded by hook
;; (req-package flycheck-pos-tip
;;   :require (flycheck)
;;   :commands (flycheck-pos-tip-mode)
;;   :init (add-hook-exec 'flycheck-mode))

(provide 'yaes-flycheck)
;;; yaes-flycheck.el ends here

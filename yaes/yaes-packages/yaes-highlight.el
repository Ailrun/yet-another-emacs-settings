(require 'req-package)

;;(req-package highlight-current-line
;;  :init
;;  (setq highlight-current-line-globally t)
;;  :config
;;  (message "highlight")
;;  (highlight-current-line-whole-line-on nil))
;;  (set-face-attribute 'highlight-current-line-face nil
;;		      :background "white smoke"))

(req-package highlight-parentheses
  :config
  (global-highlight-parentheses-mode t))

(provide 'yaes-highlight)

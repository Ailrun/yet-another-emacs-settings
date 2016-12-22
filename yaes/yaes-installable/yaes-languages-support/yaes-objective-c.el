;;; yaes-objective-c --- Objective-c related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package objc-font-lock
  :commands (objc-font-lock-mode)
  :init
  (add-hook 'objc-mode-hook #'objc-font-lock-mode))

(provide 'yaes-objective-c)
;;; yaes-objective-c.el ends here

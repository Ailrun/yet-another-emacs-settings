;;; yaes-autorevert --- autorevert related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package autorevert
  :diminish auto-revert-mode
  :config
  (global-auto-revert-mode t))

(provide 'yaes-autorevert)
;;; yaes-autorevert.el ends here

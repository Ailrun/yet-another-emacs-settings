;;; yaes-autorevert --- autorevert related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package autorevert
  :diminish auto-revert-mode
  :config
  (global-auto-revert-mode t))

(provide 'yaes-autorevert)
;;; yaes-autorevert.el ends here

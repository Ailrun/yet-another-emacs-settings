;;; yaes-autorevert --- autorevert related package setting of yaes -*- lexical-binding: t -*-
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package autorevert
  :ensure nil
  :diminish auto-revert-mode
  :custom
  (global-auto-revert-mode t))

(provide 'yaes-autorevert)
;;; yaes-autorevert.el ends here

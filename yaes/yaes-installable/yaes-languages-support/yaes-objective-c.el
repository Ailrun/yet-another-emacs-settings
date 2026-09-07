;;; yaes-objective-c --- Objective-c related package setting of yaes -*- lexical-binding: t -*-
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package objc-font-lock
  :hook
  (objc-mode . objc-font-lock-mode))

(provide 'yaes-objective-c)
;;; yaes-objective-c.el ends here

;;; yaes-theme --- theme package setting of yaes -*- lexical-binding: t -*-
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package boron-theme
  :if (version<= "24.0" emacs-version)
  :config
  (load-theme 'boron t))

(provide 'yaes-theme)
;;; yaes-theme.el ends here

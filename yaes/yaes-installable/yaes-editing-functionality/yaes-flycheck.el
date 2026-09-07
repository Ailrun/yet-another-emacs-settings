;;; yaes-flycheck --- flycheck related package setting of yaes -*- lexical-binding: t -*-
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package flycheck
  :if (version<= "24.3" emacs-version)
  :custom
  (global-flycheck-mode t)
  (flycheck-emacs-lisp-load-path 'inherit)
  (flycheck-checker-error-threshold 10000))

(use-package flycheck-pos-tip
  :if (version<= "24.1" emacs-version)
  :after (flycheck)
  :diminish flycheck-pos-tip-mode
  :hook
  (flycheck . flycheck-pos-tip-mode))

(provide 'yaes-flycheck)
;;; yaes-flycheck.el ends here

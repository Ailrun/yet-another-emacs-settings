;;; yaes-flycheck --- flycheck related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package flycheck
  :if (version<= "24.3" emacs-version)
  :after (dash let-alist seq)
  :config
  (global-flycheck-mode t)
  :custom
  (flycheck-emacs-lisp-load-path 'inherit))

(use-package flycheck-pos-tip
  :if (version<= "24.1" emacs-version)
  :after (flycheck pos-tip)
  :diminish flycheck-pos-tip-mode
  :hook
  (flycheck . flycheck-pos-tip-mode))

(provide 'yaes-flycheck)
;;; yaes-flycheck.el ends here

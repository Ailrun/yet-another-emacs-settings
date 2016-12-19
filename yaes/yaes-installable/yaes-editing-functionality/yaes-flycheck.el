;;; yaes-flycheck --- flycheck related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package flycheck
  :if (version<= "24.3" emacs-version)
  :require (dash pkg-info let-alist seq)
  :config
  (global-flycheck-mode t))

(provide 'yaes-flycheck)
;;; yaes-flycheck.el ends here

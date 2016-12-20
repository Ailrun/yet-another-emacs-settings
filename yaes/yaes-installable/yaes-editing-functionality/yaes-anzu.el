;;; yaes-anzu --- anzu related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package anzu
  :if (version<= "24.3" emacs-version)
  :demand t
  :diminish anzu-mode
  :bind
  (("M-%" . anzu-query-replace)
   ("C-M-%" . anzu-query-replace-regexp))
  :config
  (global-anzu-mode t))

(provide 'yaes-anzu)
;;; yaes-anzu.el ends here

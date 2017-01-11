;;; yaes-javascript --- JavaScript related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package js
  :mode
  ("\\.js(on)?\\'" . js-mode)
  :config
  (setq js-indent-level 2))

(provide 'yaes-javascript)
;;; yaes-javascript.el ends here

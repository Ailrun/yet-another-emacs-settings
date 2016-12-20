;;; yaes-ibuffer --- buffer listing related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package ibuffer
  :config
  (setq ibuffer-use-other-window t)
  :bind
  ("C-x C-b" . ibuffer))

(provide 'yaes-ibuffer)
;;; yaes-ibuffer.el ends here

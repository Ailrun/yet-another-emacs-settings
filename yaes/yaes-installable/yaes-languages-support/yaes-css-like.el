;;; yaes-css-like --- CSS-like language related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package css-mode
  :ensure nil
  :mode
  ("\\.css\\'" . css-mode)
  :config
  (setq css-indent-level 2))

(req-package scss-mode
  :mode
  ("\\.scss\\'" . scss-mode))

(provide 'yaes-css-like)
;;; yaes-css-like.el ends here

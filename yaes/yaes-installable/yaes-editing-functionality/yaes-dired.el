;;; yaes-dired --- dired related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package dired-x
  :ensure nil
  :demand t
  :init
  (setq dired-omit-files "^\\.?#\\|^\\.$")
  :config
  (add-hook 'dired-mode-hook #'dired-omit-mode))

(provide 'yaes-dired)
;;; yaes-dired.el ends here

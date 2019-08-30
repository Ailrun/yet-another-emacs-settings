;;; yaes-dired --- dired related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package ls-lisp
  :ensure nil
  :demand t
  :init
  (setq ls-lisp-dirs-first t)
  (setq ls-lisp-UCA-like-collation nil)
  (setq ls-lisp-use-string-collate nil))

(req-package dired-x
  :ensure nil
  :demand t
  :init
  (setq dired-omit-files "^\\.?#\\|^\\.$")
  :config
  (add-hook 'dired-mode-hook #'dired-omit-mode))

(provide 'yaes-dired)
;;; yaes-dired.el ends here

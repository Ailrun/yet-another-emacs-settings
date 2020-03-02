;;; yaes-dired --- dired related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package dired
  :ensure nil
  :demand t
  :init
  (setq dired-listing-switches "-alv --group-directories-first"))

(req-package ls-lisp
  :ensure nil
  :demand t
  :init
  (setq ls-lisp-use-insert-directory-program t))

(req-package dired-x
  :ensure nil
  :demand t
  :init
  (setq dired-omit-files "^\\.?#\\|^\\.$")
  :config
  (add-hook 'dired-mode-hook #'dired-omit-mode))

(provide 'yaes-dired)
;;; yaes-dired.el ends here

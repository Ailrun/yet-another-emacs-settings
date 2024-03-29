;;; yaes-dired --- dired related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package dired
  :ensure nil
  :demand t
  :custom
  (dired-listing-switches "-alv --group-directories-first")
  :config
  ;;;; Fix macOS issue of directory listing
  (when (eq system-type 'darwin)
   (setq insert-directory-program "gls")))

(req-package ls-lisp
  :ensure nil
  :demand t
  :custom
  (ls-lisp-use-insert-directory-program t))

(req-package dired-x
  :ensure nil
  :demand t
  :custom
  (dired-omit-files "^\\.?#\\|^\\.$|^.lia.cache$")
  :config
  (add-hook 'dired-mode-hook #'dired-omit-mode)
  (custom-set-variables
     `(dired-omit-extensions `,(append '(".glob" ".vo" ".vok" ".vos" ".vio") dired-omit-extensions))))

(provide 'yaes-dired)
;;; yaes-dired.el ends here

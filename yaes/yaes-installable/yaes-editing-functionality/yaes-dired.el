;;; yaes-dired --- dired related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package dired
  :ensure nil
  :demand t
  :custom
  (dired-listing-switches "-alv --group-directories-first")
  :config
  ;;;; Fix macOS issue of directory listing
  (when (eq system-type 'darwin)
    (customize-set-variable 'insert-directory-program "gls")))

(use-package ls-lisp
  :ensure nil
  :demand t
  :custom
  (ls-lisp-use-insert-directory-program t))

(use-package dired-x
  :after (dired)
  :ensure nil
  :demand t
  :custom
  (dired-omit-files "^\\.?#\\|^\\.$|^.lia.cache$")
  (dired-omit-extensions '(".glob" ".vo" ".vok" ".vos" ".vio"))
  :hook
  (dired-mode . dired-omit-mode))

(provide 'yaes-dired)
;;; yaes-dired.el ends here

;;; init --- init file for clare
;;;
;;; Commentary:
;;;
;;; Code:

;; Emacs 25.1 adds this automatically.
;; However, in this setting this is done by other file.
;; (package-initialize)

(load "~/.emacs.d/external/ProofGeneral/generic/proof-site")

(load-file "~/.emacs.d/yaes/yaes-init.el")
(require 'f)

(defconst init-file-path (f-this-file))

(global-set-key (kbd "C-<f1>")
        (lambda ()
          (interactive)
          (load-file init-file-path)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa"
     "8577da1641ed4bdf255341ca92e3d0e49c9f4d574458f09ce78159690442cade"
     default)))
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; ;; There is no needs for providing init
;; (provide 'init)
;;; init.el ends here

;;; init --- init file for clare
;;;
;;; Commentary:
;;;
;;; Code:

;; Emacs 25.1 adds this automatically.
;; However, in this setting this is done by other file.
;; (package-initialize)

(load "~/.emacs.d/external/ProofGeneral/generic/proof-site")

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(defconst init-file-path (expand-file-name "init.el" user-emacs-directory))
   (when (file-exists-p custom-file)
       (load custom-file))

(global-set-key (kbd "C-<f1>")
        (lambda ()
          (interactive)
          (load-file init-file-path)))

(load-file "~/.emacs.d/yaes/yaes-init.el")

;; ;; There is no needs for providing init
;; (provide 'init)
;;; init.el ends here

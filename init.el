;;; init --- init file of clare
;;;
;;; Commentary:
;;;
;;; Code:

;; Emacs 25.1 adds this automatically.
;; However, in this setting package initialization is done by other file.
;; (package-initialize)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(defconst init-file-path (expand-file-name "init.el" user-emacs-directory))

(global-set-key (kbd "C-<f1>")
        (lambda ()
          (interactive)
          (load-file init-file-path)))

(defconst yaes-init-path (expand-file-name "yaes/yaes-init.el" user-emacs-directory))
(load yaes-init-path)

;; ;; There is no needs for providing init
;; (provide 'init)
;;; init.el ends here

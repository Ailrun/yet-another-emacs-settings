;;; init --- init file of clare
;;;
;;; Commentary:
;;;
;;; Code:

;; Emacs 25.1 adds this automatically.
;; However, in this setting package initialization is done by other file.
;; (package-initialize)

(defvar os-name "")

(cond
 ((memq system-type '(windows-nt ms-dos))
  (setq os-name "windows"))
 ((memq system-type '(darwin))
  (setq os-name "mac"))
 ((memq system-type '(gnu/linux))
  (setq os-name "linux"))
 )
(setq custom-file (expand-file-name (concat "custom-" os-name ".el") user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(defconst init-file-path (expand-file-name "init.el" user-emacs-directory))

(global-set-key (kbd "C-x ! C-c")
		(lambda ()
		  (interactive)
		  (save-buffers-kill-emacs)))

(defconst yaes-init-path (expand-file-name "yaes/yaes-init.el" user-emacs-directory))
(load yaes-init-path)

;; ;; There is no needs for providing init
;; (provide 'init)
;;; init.el ends here

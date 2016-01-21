;; (defconst init-dir "~/.emacs.d/")

;; (when (>= emacs-major-version 24)
;;   (load-file "~/.emacs.d/packages.el"))

;; ;;lazy loading for jade-mode (but have some error)
;; (req-package jade-mode
;;   :mode "\\.jade\\'")
;; (req-package less-css-mode
;;   :mode "\\.less\\'")
;; (req-package skewer-less
;;   :require skewer-mode)

;; (req-package js2-mode
;;   :mode "\\.js\\'") ;;emacs-24.1

;; (req-package json-mode
;;   :mode "\\.json\\'")

;; (req-package skewer-mode
;;   :require simple-httpd js2-mode) ;;emacs-24

;; ;;(req-package 'company)
;; (req-package company-web
;;   :require company
;;   :config ((add-to-list 'company-backends 'company-web-html)
;; 	   (add-to-list 'company-backends 'company-web-jade)
;; 	   (add-to-list 'company-backends 'company-web-slim)))



;; (req-package projectile)

;; (req-package-finish)

;;
;; Custom Key settings
;;

(load-file "~/.emacs.d/yaes/yaes-init.el")

(global-set-key (kbd "C-<f1>")
		(lambda ()
		  (interactive)
		  (load-file "~/.emacs.d/init.el")))
(global-set-key (kbd "C-<f2>")
		(lambda ()
		  (interactive)
		  (load-file "~/.emacs.d/yaes/yaes-init.el")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

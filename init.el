(when (>= emacs-major-version 24)
  (load-file "~/.emacs.d/packages.el"))

;;lazy loading for jade-mode (but have some error)
(autoload 'jade-mode "jade-mode" "Jade Mode." t)
(add-to-list 'auto-mode-alist '("\\.jade\\'" . jade-mode))

(require 'less-css-mode)

(require 'company)
(require 'company-web)
(add-to-list 'company-backends 'company-web-html)
(add-to-list 'company-backends 'company-web-jade)
(add-to-list 'company-backends 'company-web-slim)


(global-set-key (kbd "C-<f1>")
		(lambda ()
		  (interactive)
		  (load-file "~/.emacs.d/init.el")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

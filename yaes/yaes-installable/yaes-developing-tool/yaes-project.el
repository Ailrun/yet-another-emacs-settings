;;; yaes-project --- project management related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package projectile
  :custom
  (projectile-mode-line-prefix " Prj")
  (projectile-cache-file (expand-file-name (concat "projectile-" os-name ".cache") user-emacs-directory))
  (projectile-known-projects-file (expand-file-name (concat "projectile-" os-name "-bookmarks.eld") user-emacs-directory))
  (projectile-indexing-method 'alien)
  (projectile-mode-line-function (lambda () " Prj"))
  (persp-mode-prefix-key (kbd "C-c M-p"))
  :config
  (define-key projectile-mode-map (kbd "C-c C-p") 'projectile-command-map)
  (projectile-global-mode t))

(req-package perspective
  :require (cl-lib)
  :config
  (persp-mode t))

(req-package persp-projectile
  :require (perspective projectile cl-lib))

(provide 'yaes-project)
;;; yaes-project.el ends here

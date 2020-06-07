;;; yaes-project --- project management related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package projectile
  :config
  (setq projectile-cache-file (expand-file-name (concat "projectile-" os-name ".cache") user-emacs-directory))
  (setq projectile-known-projects-file (expand-file-name (concat "projectile-" os-name "-bookmarks.eld") user-emacs-directory))
  (define-key projectile-mode-map (kbd "C-c C-p") 'projectile-command-map)
  (setq projectile-indexing-method 'alien)
  (setq projectile-mode-line-function (lambda ()
                                        (if (file-remote-p default-directory)
                                            " Prj"
                                          (format " [%s]"
                                                  (projectile-project-name)))))
  (projectile-global-mode t))

(req-package perspective
  :require (cl-lib)
  :config
  (persp-mode t))

(req-package persp-projectile
  :require (perspective projectile cl-lib))

(provide 'yaes-project)
;;; yaes-project.el ends here

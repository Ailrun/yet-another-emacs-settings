;;; yaes-project --- project management related package setting of yaes -*- lexical-binding: t -*-
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package projectile
  :custom
  (projectile-mode-line-prefix " Prj")
  (projectile-cache-file (expand-file-name (concat "projectile-" os-name ".cache") user-emacs-directory))
  (projectile-known-projects-file (expand-file-name (concat "projectile-" os-name "-bookmarks.eld") user-emacs-directory))
  (projectile-indexing-method 'alien)
  (projectile-mode-line-function (lambda () " Prj"))
  (projectile-keymap-prefix (kbd "C-c C-p"))
  :config
  (projectile-mode t))

(use-package perspective
  :custom
  (persp-mode-prefix-key (kbd "C-c M-p"))
  :config
  (persp-mode t))

(use-package persp-projectile
  :after (perspective projectile))

(provide 'yaes-project)
;;; yaes-project.el ends here

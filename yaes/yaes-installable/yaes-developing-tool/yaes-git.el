;;; yaes-git --- git related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package magit
  :if (version<= "24.4" emacs-version)
  :require (async dash)
  :config
  (setenv "GIT_ASKPASS" "git-gui--askpass")
  (setenv "SSH_ASKPASS" "git-gui--askpass")
  :bind
  (("C-x v S" . magit-status)))

;;;; This package is too slow
;; (req-package magithub
;;   :if (and
;;        (version<= "24.4" emacs-version)
;;        (executable-find "hub"))
;;   :require (magit)
;;   :after (magit)
;;   :config
;;   (setq magithub-api-timeout 5)
;;   (setq magithub-preferred-remote-method 'clone_url)
;;   (set-face-attribute 'magithub-label-face nil :box nil)
;;   (magithub-feature-autoinject t))

(req-package git-modes
  :mode
  ("/\\.gitattributes\\'" . gitattributes-mode)
  ("/info/attributes\\'" . gitattributes-mode)
  ("/git/attributes\\'" . gitattributes-mode)
  ("/\\.gitconfig\\'" . gitconfig-mode)
  ("/\\.git/config\\'" . gitconfig-mode)
  ("/modules/.*/config\\'" . gitconfig-mode)
  ("/git/config\\'" . gitconfig-mode)
  ("/\\.gitmodules\\'" . gitconfig-mode)
  ("/etc/gitconfig\\'" . gitconfig-mode)
  ("/\\.gitignore\\'" . gitignore-mode)
  ("/info/exclude\\'" . gitignore-mode)
  ("/git/ignore\\'" . gitignore-mode))

(provide 'yaes-git)
;;; yaes-git.el ends here

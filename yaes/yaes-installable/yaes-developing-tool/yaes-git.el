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

(provide 'yaes-git)
;;; yaes-git.el ends here

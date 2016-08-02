(require 'req-package)

;; Supporting tool for magit
(req-package magit-popup
  ;; required emacs version : ???
  :require (async dash))

;; Wonderful git client for emacs!
(req-package magit
  ;; required emacs version : 24.4
  :require (async dash with-editor git-commit magit-popup ssh-agency)
  :config (progn
			(setenv "GIT_ASKPASS" "git-gui--askpass")
			(setenv "SSH_ASKPASS" "git-gui--askpass")))

(provide 'yaes-git)

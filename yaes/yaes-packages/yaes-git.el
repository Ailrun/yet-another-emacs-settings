(require 'req-package)

(req-package browse-at-remote
  :require (f s)
  :command (browse-at-remote))

(req-package diff-git
  :require (diff))

(req-package diff-hl
  :require (diff))

(req-package magit
  :require (dash with-editor ssh-agency)
  :config
  (setenv "GIT_ASKPASS" "git-gui--askpass")
  (setenv "SSH_ASKPASS" "git-gui--askpass"))

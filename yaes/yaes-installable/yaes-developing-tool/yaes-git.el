;;; yaes-git --- git related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package magit
  :if (version<= "24.4" emacs-version)
  :config
  (setenv "GIT_ASKPASS" "git-gui--askpass")
  (setenv "SSH_ASKPASS" "git-gui--askpass")
  :bind
  ("C-x v S" . magit-status))

(use-package git-modes
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

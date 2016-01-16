;; list the packages to install
(setq install-package-list '(jade-mode))

(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))
(package-initialize)
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

(dolist (package install-package-list)
  (unless (package-installed-p package)
    (package-install package)))

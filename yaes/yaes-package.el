(require 'package)

(when (< emacs-major-version 24)
  (add-to-list 'package-archives
	       '("gnu" . "https://elpa.gnu.org/packages/")))

(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
;;(add-to-list 'package-archives '("marmalade" . "https://marmalade.ferrier.me.uk/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("sunrise" . "http://joseito.republika.pl/sunrise-commander/"))

(package-initialize)

(defun install-first-require-package (package)
  "install and require for new package, and only require for old package"
  (if (null (require package nil t))
      (progn (let* ((ARCHIVES (if (null package-archive-contents)
				  (progn (package-refresh-contents)
					 package-archive-contents)
				package-archive-contents))
		    (AVAIL (assoc package ARCHIVES)))
	       (if AVAIL
		   (package-install package)))
	     (require package))))

(install-first-require-package 'use-package)
(use-package req-package
  :ensure t)

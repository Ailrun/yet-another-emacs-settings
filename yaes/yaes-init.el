;;; yaes-init --- init file of yaes
;;;
;;; Commentary:
;;;
;;; Code:
(require 'package)

(defconst package-archives-list
  '(("marmalade" . "https://marmalade-repo.org/packages/")
    ("melpa" . "https://melpa.org/packages/")
    ("melpa-stable" . "https://stable.melpa.org/packages/")
    ("elpa" . "http://tromey.com/elpa/")
    ("org" . "http://orgmode.org/elpa/")
    ("sunrise" . "http://joseito.republika.pl/sunrise-commander/")))

;; (when (< emacs-major-version 24)
;;   (add-to-list
;;    'package-archives
;;    '("gnu" . "https://elpa.gnu.org/packages/")))

(mapc (lambda (item)
	  (add-to-list 'package-archives item)) package-archives-list)

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

(install-first-require-package 'req-package)
(require 'req-package) ;; only for removing fly error

(install-first-require-package 'f)
(require 'f) ;; only for removing fly error

(defconst yaes-dir (f-dirname (f-this-file)))
(defconst yaes-develope-dir (f-join  yaes-dir "yaes-develope"))
(defconst yaes-packages-dir (f-join  yaes-dir "yaes-packages"))

;; Setting for windows
(if (eq system-type 'windows-nt)
	(progn (setq-default default-directory
						 (concat (getenv "USERPROFILE") "\\Documents/"))
		   (setq default-directory
				 (concat (getenv "USERPROFILE") "\\Documents/"))))

(add-to-list 'load-path yaes-dir)
(set-language-environment "Korean")
(prefer-coding-system 'utf-8)
(global-set-key (kbd "S-SPC") 'toggle-korean-input-method)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq package-enable-at-startup nil)
(setq-default tab-width 4)
(windmove-default-keybindings)
;;;;Load a file for pre-package functions.
;;(load-file yaes-package-el)

;;Load all files in the packages directory
(req-package-force load-dir
  :defer t
  :init (progn
		  (setq force-load-messages nil)
		  (setq load-dir-debug t)
		  (setq load-dir-recursive t))
  :config (progn
			(load-dir-one yaes-develope-dir)
			(load-dir-one yaes-packages-dir)
			(req-package-finish)))

(require 'yasnippet)

(progn
  (yas-recompile-all)
  (yas-reload-all))

;;Function for unbound symbols
(mapatoms (lambda (symbol)
	    (if (string-prefix-p "yaes-" (symbol-name symbol))
		(unintern symbol nil))))


;;;;Obsoleted Version of unbound symbols
;; (defun makunbound-all (list)
;;   (when (> (safe-length list) 0)
;;     (makunbound (pop list))
;;     (makunbound-all list)))

;; (makunbound-all '(yaes-dir yaes-package-el yaes-packages-dir))
;; (fmakunbound makunbound-all)

(provide 'yaes-init)
;;; yaes-init.el ends here

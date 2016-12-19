;;; yaes-init --- initializations of yaes
;;;
;;; Commentary:
;;;
;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;; Helper functions
;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun yaes-os-windows-check (&rest body)
  "If os is windows, do BODY."
  (when (eq system-type 'windows-nt)
    body))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;; Package Initializations
;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)

(nconc
 package-archives
 '(("marmalade" . "https://marmalade-repo.org/packages/")
   ("melpa" . "https://melpa.org/packages/")
   ("melpa-stable" . "https://stable.melpa.org/packages/")
   ("elpa" . "http://tromey.com/elpa/")
   ("org" . "http://orgmode.org/elpa/")
   ("sunrise" . "http://joseito.republika.pl/sunrise-commander/")))

;; ;;;; Do I really need to support emacs23?
;; (yaes-max-version-do 24 -1
;; 		     (add-to-list
;; 		      'package-archives
;; 		      '("gnu" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(defun yaes-install-required-package (package)
  "Install and require for new PACKAGE, and only require for old PACKAGE."
  (when (null (require package nil t))
    (progn
      (let* ((ARCHIVES (if (null package-archive-contents)
                           (progn
                             (package-refresh-contents)
                             package-archive-contents)
                         package-archive-contents))
             (AVAIL (assoc package ARCHIVES)))
        (when AVAIL
          (package-install package)))
      (require package))))

(yaes-install-required-package 'req-package)
(require 'use-package)
(require 'req-package) ;; only for removing fly error

(setq use-package-always-ensure t)
(setq use-package-always-pin ''melpa)

(yaes-install-required-package 'f)
(require 'f) ;; only for removing fly error

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;; Vanilla Emacs settings
;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;; Language settings ( for Korean )
;;;;
(set-language-environment "Korean")
(prefer-coding-system 'utf-8)
;; For some -nix environment.
(global-set-key (kbd "S-SPC") 'toggle-korean-input-method)

;;;; Get rid of starting things
;;;;
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;;;; Default directory of windows
;;;;
(yaes-os-windows-check
 (setq-default default-directory
               (concat (getenv "USERPROFILE") "\\Documents/"))
 (when (eq (buffer-name) "*scratch*")
   (setq default-directory
         (concat (getenv "USERPROFILE") "\\Documents/"))))

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(windmove-default-keybindings)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;; YAES directory settings
;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defconst yaes-dir
  (f-dirname (f-this-file))
  "YAES base directory.")

;;;; Load all files in the packages directory
(req-package load-dir
             :loader :elpa
  :force t
  :init (progn
          (setq load-dir-debug t)
          (setq load-dir-recursive nil)
          (setq load-dir-loaded '())))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;; YAES developing package loading
;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defconst yaes-developing-dir
  (f-join yaes-dir "yaes-developing")
  "YAES developing package directory.")

(load-dir-one yaes-developing-dir)

(unintern yaes-developing-dir)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;; YAES installable package loading
;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defconst yaes-installable-dir
  (f-join yaes-dir "yaes-installable")
  "YAES installable package directory.
Those are installable via package manager.")

(load-dir-one yaes-installable-dir)

(unintern yaes-installable-dir)

(req-package-finish)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;; YAES external package loading
;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defconst yaes-external-dir
  (f-join yaes-dir "yaes-external")
  "YAES external package directory.")

(load-dir-one yaes-external-dir)

(unintern yaes-external-dir)

(require 'yasnippet)

(progn
  (yas-recompile-all)
(yas-reload-all))

;; Function for unbound symbols
(mapatoms (lambda (symbol)
	    (if (string-prefix-p "yaes-" (symbol-name symbol))
		(unintern symbol nil))))

(provide 'yaes-init)
;;; yaes-init.el ends here

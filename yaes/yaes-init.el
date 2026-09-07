;;; yaes-init --- initializations of yaes -*- lexical-binding: t -*-
;;;
;;; Commentary:
;;;
;;; Code:

(customize-set-variable
 'native-comp-async-report-warnings-errors
 'silent
 "Hide (usually) useless warnings")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;; Elpaca Installation
;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar elpaca-installer-version 0.12)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-sources-directory (expand-file-name "sources/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil :depth 1 :inherit ignore
                              :files (:defaults "elpaca-test.el" (:exclude "extensions"))
                              :build (:not elpaca-activate)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-sources-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (<= emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let* ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                  ((zerop (apply #'call-process `("git" nil ,buffer t "clone"
                                                  ,@(when-let* ((depth (plist-get order :depth)))
                                                      (list (format "--depth=%d" depth) "--no-single-branch"))
                                                  ,(plist-get order :repo) ,repo))))
                  ((zerop (call-process "git" nil buffer t "checkout"
                                        (or (plist-get order :ref) "--"))))
                  (emacs (concat invocation-directory invocation-name))
                  ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                        "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                  ((require 'elpaca))
                  ((when (fboundp 'elpaca-generate-autoloads) (elpaca-generate-autoloads "elpaca" repo))))
            (progn (message "%s" (buffer-string)) (kill-buffer buffer))
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (when (fboundp 'elpaca-generate-autoloads) (elpaca-generate-autoloads "elpaca" repo))
    (let ((load-source-file-function nil)) (load "./elpaca-autoloads"))))

(require 'elpaca)
(add-hook 'after-init-hook #'elpaca-process-queues)

(elpaca `(,@elpaca-order))
(elpaca elpaca-use-package
  ;; Enable use-package :ensure support for Elpaca.
  (elpaca-use-package-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;; Package Initializations
;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; To avoid a wrong compile result of lsp-related packages
(setenv "LSP_USE_PLISTS" "true")

(require 'use-package)

(let ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                   (not (gnutls-available-p)))))
  (if no-ssl
      (error "SSL is not available.  Please install `gnutls' package")))

(customize-set-variable 'use-package-always-ensure t
                        "Install any required packages")
(customize-set-variable 'use-package-verbose 'debug
                        "Report debug-level information if needed")

(when init-file-debug
  (customize-set-variable 'use-package-compute-statistics t
                          "Print statistics for profiling"))

(use-package f
  :ensure (:wait t)
  :functions (f-join f-dirname f-this-file))

(if (null (memq system-type '(windows-nt ms-dos)))
    (use-package exec-path-from-shell
      :ensure (:wait t)
      :config (exec-path-from-shell-initialize)))

;; To avoid a wrong compile result of lsp-related packages
;;
;; Repeated as exec-path-from-shell-initialize can change
;; the environment values.
(setenv "LSP_USE_PLISTS" "true")

(when init-file-debug
  (print (current-time-string)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;; Vanilla Emacs settings
;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;; Start Daemon
;;;; (This is required for LaTeX inverse search)
(server-start)

(global-set-key (kbd "C-x ! C-c")
		(lambda ()
		  (interactive)
		  (save-buffers-kill-emacs)))

;;;; Language settings (for Korean)
;;;;
(set-language-environment "Korean")
(prefer-coding-system 'utf-8)
;; For some -nix environment.
(global-set-key (kbd "S-SPC") 'toggle-korean-input-method)

;;;; Get rid of starting things
;;;;
(customize-set-variable 'inhibit-splash-screen t)
(customize-set-variable 'inhibit-startup-message t)
(customize-set-variable 'initial-buffer-choice #'(lambda () (get-buffer-create "*dashboard*")))

;;;; Default directory of windows
;;;;
(when (eq system-type 'windows-nt)
 (setq-default default-directory
               (concat (getenv "USERPROFILE") "\\Documents/"))
 (when (member (buffer-name) '("*scratch*" "*dashboard*"))
   (setq default-directory
         (concat (getenv "USERPROFILE") "\\Documents/"))))

;;;; tab settings
;;;;
(customize-set-variable 'tab-width 4)
(customize-set-variable 'indent-tabs-mode nil)

;;;; keybinding for windows moving
;;;;
(windmove-default-keybindings)

;;;; initial screen size
;;;;
(add-to-list 'default-frame-alist '(fullscreen . maximized))
;; (set-frame-parameter nil 'fullscreen 'maximized)

;;;; Other settings
;;;;
(customize-set-variable 'enable-remote-dir-locals t
                        "Use dir-locals for remote")

(customize-set-variable 'make-backup-files nil
                        "Disable backup files")

(customize-set-variable 'gc-cons-threshold 100000000
                        "Do GC less for better perp")

;;;; Read more bytes per chunk
(setq read-process-output-max (* 1024 1024)) ;; 1MB

(customize-set-variable 'doc-view-resolution 200
                        "Improve doc-view resolution")

(customize-set-variable 'ring-bell-function 'ignore
                        "Disable noisy rings")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;; YAES directory settings
;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defconst yaes-dir
  (f-dirname (f-this-file))
  "YAES base directory.")

;;;; Load all files in the packages directory
(use-package load-dir
  :ensure (:wait t)
  :functions (load-dir-one)
  :init (setq load-dir-loaded '()))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;; YAES external package loading
;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defconst yaes-external-dir
  (f-join yaes-dir "yaes-external")
  "YAES external package directory.")

(load-dir-one yaes-external-dir)
;;;; yaes-external-dir is already deleted

(unintern 'yaes-external-dir nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;; YAES developing package loading
;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defconst yaes-developing-dir
  (f-join yaes-dir "yaes-developing")
  "YAES developing package directory.")

(load-dir-one yaes-developing-dir)
;;;; yaes-developing-dir is already deleted

(unintern 'yaes-developing-dir nil)

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
;;;; yaes-installable-dir is already deleted

(unintern 'yaes-installable-dir nil)

(when init-file-debug
  (print (current-time-string)))

(when init-file-debug
  (print (current-time-string)))

(if (require 'yasnippet nil t)
    (progn
      (yas-recompile-all)
      (yas-reload-all)))

(when init-file-debug
  (print (current-time-string)))

;; ;; Function for unbound symbols
;; (mapatoms (lambda (symbol)
;; 	    (if (string-prefix-p "yaes-" (symbol-name symbol))
;;             (unintern symbol nil))))

(provide 'yaes-init)
;;; yaes-init.el ends here

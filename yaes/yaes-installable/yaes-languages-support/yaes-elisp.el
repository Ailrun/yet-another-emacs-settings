;;; yaes-elisp --- Elisp related package setting of yaes -*- lexical-binding: t -*-
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package eldoc
  :ensure nil
  :diminish eldoc-mode
  :hook
  (emacs-lisp-mode . eldoc-mode)
  (lisp-interaction-mode . eldoc-mode)
  (eval-expression-minibuffer-setup . eldoc-mode))

(use-package auto-compile
  :if (version<= "24.3" emacs-version)
  :diminish auto-compile-on-save-mode
  :hook
  (emacs-lisp-mode . auto-compile-on-save-mode))

(use-package elisp-refs
  :commands (elisp-refs-function
             elisp-refs-macro
             elisp-refs-variable
             elisp-refs-special
             elisp-refs-symbol))

(provide 'yaes-elisp)
;;; yaes-elisp.el ends here

;;; yaes-elisp --- Elisp related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package eldoc
  :diminish t
  :commands (eldoc-mode)
  :init
  (add-hook 'emacs-lisp-mode-hook #'eldoc-mode)
  (add-hook 'lisp-interaction-mode-hook #'eldoc-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'eldoc-mode))

(req-package auto-compile
  :if (version<= "24.3" emacs-version)
  :require (dash packed)
  :diminish t
  :commands (auto-compile-on-save-mode)
  :init
  (add-hook 'emacs-lisp-mode-hook #'auto-compile-on-save-mode))

(req-package elisp-refs
  :require (dash f list-utils loop s)
  :commands (elisp-refs-function
             elisp-refs-macro
             elisp-refs-variable
             elisp-refs-special
             elisp-refs-symbol))

(provide 'yaes-elisp)
;;; yaes-elisp.el ends here

(require 'req-package)

(req-package smartparens
  ;; required emacs version : ???
  :require (dash cl-lib)
  :config (progn (smartparens-global-mode t)
				 (sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
				 (sp-local-pair 'emacs-lisp-mode "`" nil :actions nil)
				 (sp-local-pair 'coq-mode "'" nil :actions nil)
				 (sp-local-pair 'haskell-mode "'" nil :actions nil)))

(provide 'yaes-parenthesis)

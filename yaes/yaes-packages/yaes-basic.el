(require 'req-package)

(req-package linum
  :config (progn (global-linum-mode t)
		 (setq linum-format "%4d")))

(req-package smartparens
  :require (dash)
  :config (progn (smartparens-global-mode t)
		 (sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)))

(req-package undo-tree
  :config (global-undo-tree-mode t))

(provide 'yaes-basic)

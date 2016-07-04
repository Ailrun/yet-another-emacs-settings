(require 'req-package)

(req-package linum
  :config (progn (global-linum-mode t)
				 (setq linum-format "%4d")

				 (defcustom linum-disabled-modes-list '(eshell-mode shell-mode dired-mode doc-view-mode)
				   "List of modes disabled when global linum mode is on"
				   :type '(repeat (sexp :tag "Major mode"))
				   :tag "Major modes for linum disabling."
				   :group 'linum)
				 (defun linum-on ()
				   "When linum is running globally, disable line number in modes defined in `linum-disabled-modes-list'. Changed by linum-off."
				   (unless (or
							(minibufferp)
							(member major-mode linum-disabled-modes-list)
							)
					 (linum-mode 1)))))

(req-package smartparens
  :require (dash)
  :config (progn (smartparens-global-mode t)
				 (sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
				 (sp-local-pair 'coq-mode "'" nil :actions nil)))

(req-package undo-tree
  :config (global-undo-tree-mode t))

(req-package list-processes+)

(provide 'yaes-basic)

(require 'req-package)

;; Line numbering
(req-package linum
  ;; required emacs version : any
  :require (hlinum)
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
							(member major-mode linum-disabled-modes-list))
					 (linum-mode t)))))

;; Line numbering with highlight current line
(req-package hlinum
  ;; required emacs version : ???
  :require (cl-lib)
  :config (hlinum-activate))

(provide 'yaes-buffer)

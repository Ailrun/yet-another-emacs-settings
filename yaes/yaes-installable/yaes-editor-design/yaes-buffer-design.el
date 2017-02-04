;;; yaes-buffer-design --- buffer design package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package linum
  :pin gnu
  :require (hlinum)
  :config
  (global-linum-mode t)
  (setq linum-format "%4d")
  (defcustom linum-disabled-modes-list
    '(help-mode customize-mode
      eshell-mode shell-mode
      dired-mode
      doc-view-mode
      epresent-mode)
    "List of modes disabled when global linum mode is on"
    :type '(repeat (sexp :tag "Major mode"))
    :tag "Major modes for linum disabling."
    :group 'linum)
  (defun linum-on ()
    "When linum is running globally, disable line number in modes defined in `linum-disabled-modes-list'."
    (unless (or
             (minibufferp)
             (member major-mode linum-disabled-modes-list))
      (linum-mode t))))

(req-package hlinum
  :require (cl-lib)
  :config
  (hlinum-activate))


(req-package whitespace
  ;; required emacs version : any
  :config
  (setq whitespace-style '(face empty lines-tail trailing))
  (setq whitespace-global-modes
        '(not
          LaTeX-mode
          latex-mode
          markdown-mode
          org-mode
          shell-mode)))

(provide 'yaes-buffer-design)
;;; yaes-buffer-design.el ends here

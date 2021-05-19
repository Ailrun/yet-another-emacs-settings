;;; yaes-buffer-design --- buffer design package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package display-line-numbers
  :pin gnu
  :config
  (global-display-line-numbers-mode)
  ;; (setq linum-format "%4d")
  (face-spec-set 'line-number-current-line '((t :inherit (isearch default))))
  (defcustom display-line-numbers-disabled-modes-list
    '(help-mode customize-mode
      eshell-mode shell-mode
      dired-mode
      doc-view-mode
      epresent-mode
      xwidget-webkit-mode)
    "List of modes disabled when global linum mode is on"
    :type '(repeat (sexp :tag "Major mode"))
    :tag "Major modes for linum disabling."
    :group 'display-line-numbers)
  (defun display-line-numbers--turn-on ()
    "When display-line-numbers is running globally, disable line number in modes defined in `display-line-numbers-disabled-modes-list'."
    (unless (or
             (minibufferp)
             (member major-mode display-line-numbers-disabled-modes-list))
      (display-line-numbers-mode))))


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

;;; yaes-latex --- LaTeX related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package auctex
  :mode
  ("\\.tex\\'" . LaTeX-mode)
  ("\\.sty\\'" . LaTeX-mode)
  ("\\.tikz\\'" . LaTeX-mode)
  :init
  (modify-coding-system-alist 'file "\\.tex\\'" 'utf-8))

(req-package company-auctex
  :require (yasnippet company auctex)
  :commands (company-auctex-init)
  :config
  (add-hook 'LaTeX-mode-hook #'company-auctex-init)
  (add-hook 'latex-mode-hook #'company-auctex-init))

(req-package company-math
  :require (company math-symbol-lists)
  :functions (yaes-company-math-setup)
  :commands (yaes-company-math-setup)
  :init
  (defun yaes-company-math-setup ()
    "Setup company-math."
    (setq-local company-backends
                (append
                 '(company-math-symbols-latex)
                 company-backends)))
  (add-hook 'LaTeX-mode-hook #'yaes-company-math-setup)
  (add-hook 'latex-mode-hook #'yaes-company-math-setup))

(req-package latex-extra
  :require (auctex cl-lib)
  :diminish latex-extra-mode
  :commands (latex-extra-mode)
  :init
  (add-hook 'LaTeX-mode-hook #'latex-extra-mode)
  (add-hook 'latex-mode-hook #'latex-extra-mode))

(req-package latex-pretty-symbols
  :require (auctex))

(req-package reftex
  :require (auctex)
  :diminish reftex-mode
  :commands (reftex-mode)
  :init
  (add-hook 'LaTeX-mode-hook #'reftex-mode)
  (add-hook 'latex-mode-hook #'reftex-mode))

(provide 'yaes-latex)
;;; yaes-latex.el ends here

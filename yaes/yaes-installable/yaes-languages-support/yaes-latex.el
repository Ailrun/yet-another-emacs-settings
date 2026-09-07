;;; yaes-latex --- LaTeX related package setting of yaes -*- lexical-binding: t -*-
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package auctex
  :mode
  ("\\.tex\\'" . LaTeX-mode)
  ("\\.sty\\'" . LaTeX-mode)
  ("\\.tikz\\'" . LaTeX-mode)
  :init
  (modify-coding-system-alist 'file "\\.tex\\'" 'utf-8)
  :custom
  (TeX-parse-self t)
  (TeX-view-program-selection
   '(((output-dvi has-no-display-manager) "dvi2tty")
     ((output-dvi style-pstricks) "dvips and gv") (output-dvi "xdvi")
     (output-pdf "xdg-open") (output-html "xdg-open"))))

(use-package latex-extra
  :after (auctex)
  :commands latex-extra-mode
  :diminish (latex-extra-mode)
  :hook
  (LaTeX-mode . latex-extra-mode)
  (latex-mode . latex-extra-mode)
  (latex-extra-mode . (lambda ()
                        (define-key latex-extra-mode-map "" nil)
                        (define-key latex-extra-mode-map "" nil))))

(use-package lsp-latex
  :after (auctex)
  :commands lsp
  :hook
  (LaTeX-mode . lsp)
  (latex-mode . lsp)
  (bibtex-mode . lsp)
  (bibtex-style-mode . lsp)
  :custom
  (lsp-latex-build-args '("-interaction=nonstopmode" "-synctex=1" "%f"))
  (lsp-latex-forward-search-executable "okular")
  (lsp-latex-forward-search-args '("--unique" "file:%p#src:%l%f")))

(provide 'yaes-latex)
;;; yaes-latex.el ends here

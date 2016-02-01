(require 'req-package)

;; > emacs 22
(req-package latex-math-preview
  :command (latex-math-preview-expression latex-math-preview-insert-symbol latex-math-preview-save-image-file latex-math-preview-beamer-frame))

(req-package cdlatex
  :require (auctex))

(req-package company-math)

(req-package auctex
  :mode ("\\.tex\\'" . LaTeX-mode))

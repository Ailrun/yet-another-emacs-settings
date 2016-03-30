(require 'req-package)

;; > emacs 22
(req-package latex-math-preview
  :commands (latex-math-preview-expression latex-math-preview-insert-symbol latex-math-preview-save-image-file latex-math-preview-beamer-frame))

(req-package cdlatex
  :require (auctex))

(req-package company-math)

(req-package auctex
  :mode ("\\.tex\\'" . LaTeX-mode)
  :config (modify-coding-system-alist 'file "\\.tex\\'" 'utf-8))

(req-package latex-extra
  :require (auctex)
  :config (req-package-hooks-add-execute 'LaTeX-mode-hook 'latex-extra-mode))

(req-package latex-pretty-symbols
  :require (auctex))

(req-package latex-preview-pane
  :config
  (req-package-hooks-add-execute 'LaTeX-mode-hook 'latex-preview-pane-mode)
  (req-package-hooks-add-execute 'latex-mode-hook 'latex-preview-pane-mode))

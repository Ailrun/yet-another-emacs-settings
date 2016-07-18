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
  :config (progn
			(req-package-hooks-add-execute 'latex-mode 'latex-extra-mode)
			(req-package-hooks-add-execute 'latex-mode 'latex-extra-mode)))

(req-package latex-pretty-symbols
  :require (auctex))

(req-package latex-preview-pane
  :config (progn
			(req-package-hooks-add-execute 'LaTeX-mode 'latex-preview-pane-mode)
			(req-package-hooks-add-execute 'latex-mode 'latex-preview-pane-mode)
			(setq pdf-latex-command "xelatex")))

;;; yaes-latex --- LaTeX support of yaes
;;;
;;; Commentary:
;;;
;;; Code:
(require 'req-package)

;; Reference support
(req-package reftex
  ;; required emacs version : ???
  :require (auctex)
  :commands (reftex-mode)
  :init (progn
          (add-hook-exec 'LaTeX-mode #'reftex-mode)
          (add-hook-exec 'latex-mode #'reftex-mode)))

;; LaTeX mode
(req-package auctex
  ;; required emacs version : >= 24.4
  :mode (("\\.tex\\'" . LaTeX-mode)
         ("\\.sty\\'" . LaTeX-mode)
         ("\\.misc\\'" . LaTeX-mode)
         ("\\.tikz\\'" . LaTeX-mode))
  :init (progn
          (modify-coding-system-alist 'file "\\.tex\\'" 'utf-8)))

;; Backend plugin for company of LaTeX
(req-package company-auctex
  ;; required emacs version : ???
  :require (auctex company yasnippet)
  :commands (company-auctex-init)
  :init (progn
          (add-hook-exec 'LaTeX-mode #'company-auctex-init)
          (add-hook-exec 'latex-mode #'company-auctex-init)))

;; Backend plugin for company with math symbols of latex
(req-package company-math
  ;; required emacs version : ???
  :require (company math-symbol-lists)
  :config (progn
            (add-to-list 'company-backends 'company-math-symbols-unicode)
            (add-to-list 'company-backends 'company-math-symbols-latex)))

;; Environment insertion support for LaTeX
(req-package cdlatex
  ;; required emacs version : ???
  :require (auctex)
  :commands (turn-on-cdlatex)
  :init (progn
            (add-hook-exec 'LaTeX-mode #'turn-on-cdlatex)
            (add-hook-exec 'latex-mode #'turn-on-cdlatex)))

;; Additional support for LaTeX mode
(req-package latex-extra
  ;; required emacs version : ???
  :require (auctex cl-lib)
  :commands (latex-extra-mode)
  :init (add-hook 'LaTeX-mode #'latex-extra-mode))

(req-package latex-pretty-symbols
  ;; required emacs version : ???
  :require (auctex))

;; ;; LaTeX math symbol preview
;; ;; This won't work since this package use deprecated function.
;; (req-package latex-math-preview
;;   ;; required emacs version : ???
;;   :commands (latex-math-preview-expression
;;          latex-math-preview-insert-symbol
;;          latex-math-preview-insert-mathematical-symbol
;;          latex-math-preview-insert-text-symbol
;;          latex-math-preview-save-image-file
;;          latex-math-preview-reload-usepackage))

;; Package providing LaTeX preview
(req-package latex-preview-pane
  ;; required emacs version : >= 24
  :commands (latex-preview-pane-mode latex-preview-pane-update)
  :config (progn
            (setq pdf-latex-command "xelatex")))

(provide 'yaes-latex)
;;; yaes-latex.el ends here

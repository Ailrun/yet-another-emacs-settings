;;; yaes-latex --- LaTeX support of yaes
;;;
;;; Commentary:
;;;
;;; Code:
(require 'req-package)

;; Backend plugin for company with math symbols of latex
(req-package company-math
  ;; required emacs version : ???
  :require (company math-symbol-lists)
  :config (progn
            (add-to-list 'company-backends 'company-math-symbols-unicode)
            (add-to-list 'company-backends 'company-math-symbols-latex)))

;; LaTeX mode
(req-package auxtex
  ;; required emacs version : >= 24.4
  :mode ("\\.tex\\'" . LaTeX-mode)
  :init (progn
          (modify-coding-system-alist 'file "\\.tex\\'" 'utf-8)
          (add-hook-exec 'LaTeX-mode #'prettify-symbols-mode)))

;; Environment insertion support for LaTeX
(req-package cdlatex
  ;; required emacs version : ???
  :require (auxtex)
  :commands (turn-on-cdlatex)
  :init (progn
            (add-hook-exec 'LaTeX-mode #'turn-on-cdlatex)
            (add-hook-exec 'latex-mode #'turn-on-cdlatex)))

;; Additional support for LaTeX mode
(req-package latex-extra
  ;; required emacs version : ???
  :require (auxtex cl-lib)
  :commands (latex-extra-mode)
  :init (add-hook 'LaTeX-mode #'latex-extra-mode))

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

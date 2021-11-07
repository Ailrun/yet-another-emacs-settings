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
  (modify-coding-system-alist 'file "\\.tex\\'" 'utf-8)
  :config
  (setq TeX-parse-self t))

;; (req-package company-auctex
;;   :require (yasnippet company auctex)
;;   :commands (company-auctex-init)
;;   :config
;;   (add-hook 'LaTeX-mode-hook #'company-auctex-init)
;;   (add-hook 'latex-mode-hook #'company-auctex-init))

;; (req-package company-math
;;   :require (company)
;;   ;; :functions (company-math-setup)
;;   ;; :commands (company-math-setup)
;;   :init
;;   (defun company-math-setup ()
;;     "Setup company-math."
;;     (setq-local company-backends
;;                 (append
;;                  '(company-math-symbols-latex)
;;                  company-backends)))
;;   (add-hook 'LaTeX-mode-hook #'company-math-setup)
;;   (add-hook 'latex-mode-hook #'company-math-setup))

(req-package latex-extra
  :require (auctex cl-lib)
  :diminish latex-extra-mode
  :commands (latex-extra-mode)
  :init
  (add-hook 'LaTeX-mode-hook #'latex-extra-mode)
  (add-hook 'latex-mode-hook #'latex-extra-mode))

;; (req-package tex-mode
;;   :mode
;;   ("\\.tex\\'" . latex-mode)
;;   ("\\.sty\\'" . latex-mode)
;;   ("\\.tikz\\'" . latex-mode)
;;   :init
;;   (modify-coding-system-alist 'file "\\.tex\\'" 'utf-8))

;; (req-package latex-pretty-symbols)

;; (req-package reftex
;;   :diminish reftex-mode
;;   :commands (reftex-mode)
;;   :init
;;   (add-hook 'LaTeX-mode-hook #'reftex-mode)
;;   (add-hook 'latex-mode-hook #'reftex-mode))

(req-package lsp-latex
  :require (tex-mode)
  :init
  (add-hook 'LaTeX-mode-hook #'lsp)
  (add-hook 'latex-mode-hook #'lsp)
  :config
  (setq lsp-latex-forward-search-executable "okular")
  (setq lsp-latex-forward-search-args '("--unique" "file:%p#src:%l%f")))

(provide 'yaes-latex)
;;; yaes-latex.el ends here

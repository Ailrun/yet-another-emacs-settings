;;; yaes-company --- company support of yaes
;;;
;;; Commentary:
;;;
;;; Code:
(require 'req-package)

;; Autocomplete frameworks
;; Detail settings are in each language setting files
(req-package company
  ;; required emacs version : >= 24.1
  :loader :elpa
  :require (cl-lib yasnippet)
  :config (progn
            (global-company-mode t)
            (global-set-key (kbd "C-<tab>") 'company-complete)
            (global-set-key (kbd "C-c C-y") 'company-yasnippet)))

;; Help autocomplete using pos-tip message
(req-package company-quickhelp
  ;; required emacs version : >= 24.4
  :loader :elpa
  :require (company pos-tip)
  :commands (company-quickhelp-mode)
  :config (add-hook-exec 'company-mode #'company-quickhelp-mode))

(provide 'yaes-company)
;;; yaes-company.el ends here

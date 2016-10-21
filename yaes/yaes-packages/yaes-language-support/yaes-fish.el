;;; yaes-fish --- fish script support of yaes
;;;
;;; Commentary:
;;;
;;; Code:
(require 'req-package)

;; Major mode for fish script
(req-package fish-mode
  ;; required emacs version : >= 24
  :mode ("\\.fish\\'" . fish-mode))

;; Backend plugin for company
(req-package company-shell
  ;; required emacs version : ???
  :require (company dash cl-lib)
  :config (progn
			(add-to-list 'company-backends '(company-shell company-fish-shell))))

(provide 'yaes-fish)
;;; yaes-fish.el ends here

;;; yaes-company --- company related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package company
  :demand t
  :diminish company-mode
  :bind
  (:map company-mode-map
        ("C-<tab>" . company-complete))
  :config
  (global-company-mode t))

(provide 'yaes-company)
;;; yaes-company.el ends here

;;; yaes-company --- company related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package company
  :demand t
  :config
  (global-company-mode t)
  :bind
  (:map company-mode-map
        ("C-<tab>" . company-complete)))

(provide 'yaes-company)
;;; yaes-company.el ends here

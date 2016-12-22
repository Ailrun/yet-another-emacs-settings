;;; yaes-html-like --- HTML-like language related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package sgml-mode
  :mode
  ("\\.html\\'" . html-mode))

(req-package jade-mode
  :mode
  ("\\.jade\\'" . jade-mode)
  ("\\.styl\\'" . sws-mode))

(req-package slim-mode
  :mode
  ("\\.slim\\'" . slim-mode))

(req-package company-web
  :require (company dash cl-lib web-completion-data)
  :functions (yaes-company-web-html-init
              yaes-company-web-jade-init
              yaes-company-web-slim-init)
  :init
  (defun yaes-company-html-init ()
    (setq-local company-backends
                (append
                 '(company-web-html)
                 company-backends)))
  (defun yaes-company-jade-init ()
    (setq-local company-backends
                (append
                 '(company-web-jade)
                 company-backends)))
  (defun yaes-company-slim-init ()
    (setq-local company-backends
                (append
                 '(company-web-slim)
                 company-backends)))
  (add-hook 'html-mode-hook #'yaes-company-web-html-init)
  (add-hook 'jade-mode-hook #'yaes-company-web-jade-init)
  (add-hook 'slim-mode-hook #'yaes-company-web-slim-init))

(req-package ac-html-bootstrap
  :require (web-completion-data)
  :commands (company-web-bootstrap+
             company-web-fa+)
  :init
  (defun yaes-ac-html-bootstrap-init ()
    (company-web-bootstrap+)
    (company-web-fa+))
  (add-hook 'html-mode-hook #'yaes-ac-html-bootstrap-init)
  (add-hook 'jade-mode-hook #'yaes-ac-html-bootstrap-init)
  (add-hook 'slim-mode-hook #'yaes-ac-html-bootstrap-init))

(provide 'yaes-html-like)
;;; yaes-html-like.el ends here

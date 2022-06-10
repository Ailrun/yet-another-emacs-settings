;;; yaes-html-like --- HTML-like language related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package web-mode
  :mode
  ("\\.html\\'" . web-mode))

(req-package pug-mode
  :mode
  ("\\.jade\\'" . pug-mode)
  ("\\.pug\\'" . pug-mode))

(req-package slim-mode
  :mode
  ("\\.slim\\'" . slim-mode))

(req-package emmet-mode
  :init
  (add-hook 'sgml-mode-hook #'emmet-mode)
  (add-hook 'css-mode-hook #'emmet-mode)
  :custom
  (emmet-indentation 2)
  (emmet-self-closing-tag-style " /")
  (emmet-move-cursor-between-quotes t))

(req-package company-web
  :require (company dash cl-lib)
  :functions (company-web-html-init
              company-web-jade-init
              company-web-slim-init)
  :commands (company-web-html-init
             company-web-jade-init
             company-web-slim-init)
  :init
  (defun company-web-html-init ()
    (setq-local company-backends
                (append
                 '(company-web-html)
                 company-backends)))
  (defun company-web-jade-init ()
    (setq-local company-backends
                (append
                 '(company-web-jade)
                 company-backends)))
  (defun company-web-slim-init ()
    (setq-local company-backends
                (append
                 '(company-web-slim)
                 company-backends)))
  (add-hook 'html-mode-hook #'company-web-html-init)
  (add-hook 'jade-mode-hook #'company-web-jade-init)
  (add-hook 'slim-mode-hook #'company-web-slim-init))

(provide 'yaes-html-like)
;;; yaes-html-like.el ends here

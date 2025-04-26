;;; yaes-html-like --- HTML-like language related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package web-mode
  :mode
  ("\\.html\\'" . web-mode))

(use-package pug-mode
  :mode
  ("\\.jade\\'" . pug-mode)
  ("\\.pug\\'" . pug-mode))

(use-package slim-mode
  :mode
  ("\\.slim\\'" . slim-mode))

(use-package emmet-mode
  :commands emmet-mode
  :hook
  (sgml-mode . emmet-mode)
  (css-mode . emmet-mode)
  :custom
  (emmet-indentation 2)
  (emmet-self-closing-tag-style " /")
  (emmet-move-cursor-between-quotes t))

(use-package company-web
  :after (company)
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
  :hook
  (html-mode . company-web-html-init)
  (jade-mode . company-web-jade-init)
  (slim-mode . company-web-slim-init))

(provide 'yaes-html-like)
;;; yaes-html-like.el ends here

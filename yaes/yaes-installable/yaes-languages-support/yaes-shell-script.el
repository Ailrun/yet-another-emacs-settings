;;; yaes-shell-script --- Shell Script related package setting of yaes -*- lexical-binding: t -*-
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package fish-mode
  :if (version<= "24" emacs-version)
  :mode
  ("\\.fish\\'" . fish-mode))

(use-package sh-script
  :ensure nil
  :mode
  ("\\.\\(ba\\|t?c\\)sh\\'" . sh-mode))

(use-package company-shell
  :after (company)
  :init
  (defun company-shell-fish-init ()
    "Company-shell setup."
    (setq-local company-backends
                (append
                 '(company-shell company-fish-shell)
                 company-backends)))
  (defun company-shell-sh-init ()
    "Company-shell setup."
    (setq-local company-backends
                (append
                 '(company-shell)
                 company-backends)))
  :hook
  (fish-mode . company-shell-fish-init)
  (sh-mode . company-shell-sh-init))

(provide 'yaes-shell-script)
;;; yaes-shell-script.el ends here

;;; yaes-shell-script --- Shell Script related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package fish-mode
  :if (version<= "24" emacs-version)
  :mode
  ("\\.fish\\'" . fish-mode))

(req-package sh-script
  :mode
  ("\\.\\(ba\\|t?c\\)sh\\'" . sh-mode))

(req-package company-shell
  :require (company dash cl-lib)
  :functions (yaes-company-shell-fish-init
              yaes-company-shell-sh-init)
  :commands (yaes-company-shell-fish-init
             yaes-company-shell-sh-init)
  :init
  (defun yaes-company-shell-fish-init ()
    "Company-shell setup."
    (setq-local company-backends
                (append
                 '(company-shell company-fish-shell)
                 company-backends)))
  (defun yaes-company-shell-sh-init ()
    "Company-shell setup."
    (setq-local company-backends
                (append
                 '(company-shell)
                 company-backends)))
  (add-hook 'fish-mode-hook #'yaes-company-shell-fish-init)
  (add-hook 'sh-mode-hook #'yaes-company-shell-sh-init))

(provide 'yaes-shell-script)
;;; yaes-shell-script.el ends here

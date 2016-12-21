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

(req-package company-shell
  :require (company dash cl-lib fish)
  :functions (yaes-company-shell-init)
  :commands (yaes-company-shell-init)
  :init
  (defun yaes-company-shell-init ()
    "Company-shell setup."
    (setq-local company-backends
                (append
                 '((company-shell company-fish-shell)))))
  (add-hook 'fish-mode-hook yaes-company-shell-init)
  (add-hook 'sh-mode-hook yaes-company-shell-init))

(provide 'yaes-shell-script)
;;; yaes-shell-script.el ends here

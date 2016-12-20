;;; yaes-typescript --- TypeScript related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package typescript-mode
  :mode
  ("\\.ts\\'" . typescript-mode))

(req-package tide
  :if (executable-find "node")
  :require (dash flycheck typescript-mode cl-lib)
  :commands (tide-setup)
  :init
  (defun setup-tide-mode ()
    "tide mode setup."
    (interactive)
    (tide-setup)
    (flycheck-mode t)
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (eldoc-mode t)
    (tide-hl-identifier-mode t)
    (company-mode t))
  (add-hook 'typescript-mode-hook #'setup-tide-mode))

(provide 'yaes-typescript)
;;; yaes-typescript.el ends here

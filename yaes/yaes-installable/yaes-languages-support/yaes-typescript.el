;;; yaes-typescript --- TypeScript related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package typescript-mode
  :mode
  ("\\.tsx?\\'" . typescript-mode)
  :config
  (setq typescript-indent-level 2))

(req-package tide
  :if (executable-find "node")
  :require (dash flycheck typescript-mode cl-lib)
  :commands (tide-setup)
  :diminish tide-mode
  :init
  (defun setup-tide-mode ()
    "tide mode setup."
    (interactive)
    (tide-setup)
    (if (eq system-type "windows-nt")
        (setq flycheck-typescript-tslint-executable "tslint.cmd"))
    (flycheck-mode t)
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (eldoc-mode t)
    (tide-hl-identifier-mode t)
    (company-mode t))
  (add-hook 'typescript-mode-hook #'setup-tide-mode))

(provide 'yaes-typescript)
;;; yaes-typescript.el ends here

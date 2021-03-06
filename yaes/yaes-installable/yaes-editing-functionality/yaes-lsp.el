;;; yaes-lsp --- Language Server Protocol related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package lsp-mode
  :if (version<= "25.1" emacs-version)
  :require (dash dash-functional f ht spinner markdown-mode)
  :commands (lsp)
  :config
  (setq lsp-prefer-flymake nil))

(req-package lsp-ui
  :if (version<= "25.1" emacs-version)
  :require (dash dash-functional lsp-mode markdown-mode)
  :commands (lsp-ui-mode)
  :init (add-hook 'lsp-mode-hook #'lsp-ui-mode)
  :config
  (setq lsp-ui-doc-alignment 'window)
  (setq lsp-ui-doc-position 'top))

(provide 'yaes-lsp)
;;; yaes-lsp.el ends here

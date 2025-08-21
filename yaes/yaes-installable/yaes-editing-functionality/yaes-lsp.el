;;; yaes-lsp --- Language Server Protocol related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package lsp-mode
  :if (version<= "25.1" emacs-version)
  :after (markdown-mode)
  :commands (lsp lsp-deferred)
  :diminish (lsp-mode lsp-lens-mode)
  :hook
  (dired-mode . lsp-dired-mode)
  :custom
  (lsp-prefer-flymake nil)
  (lsp-modeline-code-actions-segments '(icon)))

(use-package lsp-ui
  :if (version<= "25.1" emacs-version)
  :after (lsp-mode markdown-mode)
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-alignment 'window)
  (lsp-ui-doc-position 'top)
  (lsp-ui-doc-show-with-cursor t))

(use-package lsp-origami
  :after (lsp-mode)
  :commands (lsp-origami-mode lsp-origami-try-enable)
  :diminish (lsp-origami-mode)
  :hook
  (lsp-after-open . lsp-origami-try-enable))

(provide 'yaes-lsp)
;;; yaes-lsp.el ends here

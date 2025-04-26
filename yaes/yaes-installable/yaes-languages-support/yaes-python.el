;;; yaes-python --- Python related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package python
  :if (executable-find "python")
  :pin gnu
  :mode
  ("\\.py[3w]?" . python-mode))

(use-package lsp-python-ms
  :after (python)
  :hook
  (python-mode . lsp))

(provide 'yaes-python)
;;; yaes-python.el ends here

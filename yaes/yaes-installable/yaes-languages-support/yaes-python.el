;;; yaes-python --- Python related package setting of yaes -*- lexical-binding: t -*-
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package python
  :if (executable-find "python")
  :ensure nil
  :mode
  ("\\.py[3w]?" . python-mode))

(use-package lsp-python-ms
  :after (python)
  :hook
  (python-mode . lsp))

(provide 'yaes-python)
;;; yaes-python.el ends here

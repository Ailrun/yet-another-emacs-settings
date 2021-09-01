;;; yaes-python --- Python related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package python
  :if (executable-find "python")
  :pin gnu
  :mode
  ("\\.py[3w]?" . python-mode))

(req-package lsp-python-ms
  :require (python)
  :init
  (add-hook 'python-mode-hook #'lsp))

(provide 'yaes-python)
;;; yaes-python.el ends here

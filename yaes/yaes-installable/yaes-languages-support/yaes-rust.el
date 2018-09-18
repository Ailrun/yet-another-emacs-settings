;;; yaes-rust --- Rust related package settings of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package rust-mode
  :mode
  ("\\.rs\\'" . rust-mode))

(req-package racer
  :require (rust-mode dash s f pos-tip)
  :init
  (add-hook 'rust-mode-hook #'racer-mode))

(req-package flycheck-rust
  :require (rust-mode flycheck dash seq let-alist)
  :init
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(provide 'yaes-rust)
;;; yaes-rust.el ends here

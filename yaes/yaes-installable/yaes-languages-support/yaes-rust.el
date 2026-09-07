;;; yaes-rust --- Rust related package settings of yaes -*- lexical-binding: t -*-
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package rust-mode
  :mode
  ("\\.rs\\'" . rust-mode)
  :init
  (add-hook 'rust-mode-hook #'lsp))

;; (use-package racer
;;   :require (rust-mode dash s f pos-tip)
;;   :init
;;   (add-hook 'rust-mode-hook #'racer-mode))

(use-package flycheck-rust
  :after (rust-mode flycheck)
  :hook
  (flycheck-mode . flycheck-rust-setup))

(provide 'yaes-rust)
;;; yaes-rust.el ends here

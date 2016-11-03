;;; yaes-rust --- rust support of yaes
;;;
;;; Commentary:
;;;
;;; Code:
(require 'req-package)

;; Major mode of rust
(req-package rust-mode
  ;; required emacs version : >= 24
  :mode ("\\.rs\\'" . rust-mode))

;; Package manager of rust
(req-package cargo
  ;; required emacs version : >= 24.3
  :require (rust-mode)
  :commands (cargo-process-bench
             cargo-process-build
             cargo-process-clean
             cargo-process-doc
             cargo-process-new
             cargo-process-init
             cargo-process-run
             cargo-process-run-example
             cargo-process-search
             cargo-process-test
             cargo-process-update
             cargo-process-repeat
             cargo-process-current-test
             cargo-process-current-file-tests
             cargo-process-fmt))

;; Plugin for flycheck with rust
(req-package flycheck-rust
  ;; required emacs version : >= 24.1
  :require (flycheck dash seq let-alist)
  :commands (flycheck-rust-setup)
  :init (add-hook-exec 'flycheck-mode #'flycheck-rust-setup))

(provide 'yaes-rust)
;;; yaes-rust.el ends here

;;; yaes-ocaml --- ocaml support of yaes
;;;
;;; Commentary:
;;;
;;; Code:
(require 'req-package)

;; Ocaml major mode
(req-package tuareg
  ;; required emacs version : >= 24.3
  :mode ("\\.ml\\'" . tuareg-mode))

;; ;; Completion support with ocaml
;; ;; Needs merlin program
;; (req-package merlin
;;   :commands (merlin-mode)
;;   :init (add-hook-exec 'tuareg-mode #'merlin-mode))

;; ;; Plugin for flycheck with ocaml
;; ;; Needs merlin
;; (req-package flycheck-ocaml
;;   ;; required emacs version :
;;   :require (flycheck merlin let-alist)
;;   :commands (flycheck-ocaml-setup)
;;   :init (add-hook-exec 'merlin #'flycheck-ocaml-setup)
;;   :config (setq merlin-error-after-save nil))

(provide 'yaes-ocaml)
;;; yaes-ocaml.el ends here

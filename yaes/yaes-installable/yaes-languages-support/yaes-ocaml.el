;;; yaes-ocaml --- OCaml related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package tuareg
  :require (caml)
  :mode ("\\.ml[iylp]?\\'" . tuareg-mode))

(req-package merline
  :if (executable-find "ocamlmerlin")
  :require (tuareg)
  :commands (merlin-mode)
  :init
  (defun yaes-merline-setup ()
    "Merlin setup."
    (setq-local company-backends
                (append
                 '((merline-company-backend))
                 company-backends)))
  (add-hook 'tuareg-mode-hook #'merlin-mode)
  (add-hook 'caml-mode-hook #'merlin-mode))

(provide 'yaes-ocaml)
;;; yaes-ocaml.el ends here

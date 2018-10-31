;;; yaes-ocaml --- OCaml related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package caml
  :defer t)

(req-package tuareg
  :require (caml)
  :mode ("\\.ml[iylp]?\\'" . tuareg-mode))

(req-package merlin
  :if (executable-find "ocamlmerlin")
  :require (iedit tuareg)
  :functions (yaes-merlin-setup)
  :commands (merlin-mode)
  :init
  (defun yaes-merlin-setup ()
    "Merlin setup."
    (setq-local company-backends
                (append
                 '(merlin-company-backend)
                 company-backends)))
  (add-hook 'tuareg-mode-hook #'merlin-mode)
  (add-hook 'caml-mode-hook #'merlin-mode))

(provide 'yaes-ocaml)
;;; yaes-ocaml.el ends here

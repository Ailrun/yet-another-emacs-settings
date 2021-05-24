;;; yaes-ocaml --- OCaml related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package caml)

(req-package tuareg
  :require (caml)
  :mode ("\\.ml[iylp]?\\'" . tuareg-mode)
  :init
  (when (executable-find "ocamllsp")
    (add-hook 'tuareg-mode-hook #'lsp)))

(req-package dune
  :if (executable-find "dune")
  :mode (("dune" . dune-mode)
         ("dune-project" . dune-mode)))

(req-package merlin
  :if (executable-find "ocamlmerlin")
  :require (iedit tuareg)
  :commands (merlin-mode)
  :diminish (merlin-mode)
  :init
  (add-hook 'tuareg-mode-hook #'merlin-mode)
  (add-hook 'caml-mode-hook #'merlin-mode)
  :config
  (setq merlin-error-after-save nil))

(req-package flycheck-ocaml
  :require (flycheck merlin)
  :functions (flycheck-ocaml-setup)
  :init
  (add-hook 'tuareg-mode-hook #'flycheck-ocaml-setup)
  (add-hook 'caml-mode-hook #'flycheck-ocaml-setup))

(provide 'yaes-ocaml)
;;; yaes-ocaml.el ends here

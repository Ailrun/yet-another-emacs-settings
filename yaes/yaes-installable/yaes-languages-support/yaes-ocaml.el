;;; yaes-ocaml --- OCaml related package setting of yaes -*- lexical-binding: t -*-
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package caml
  :defer t)

(use-package tuareg
  :after (caml)
  :mode ("\\.ml[iylp]?\\'" . tuareg-mode)
  :init
  (when (executable-find "ocamllsp")
    (add-hook 'tuareg-mode-hook #'lsp)))

(use-package dune
  :if (executable-find "dune")
  :mode
  ("dune" . dune-mode)
  ("dune-project" . dune-mode))

(use-package merlin
  :if (executable-find "ocamlmerlin")
  :after (tuareg)
  :commands (merlin-mode)
  :diminish (merlin-mode)
  :hook
  (tuareg-mode-hook . merlin-mode)
  (caml-mode-hook . merlin-mode)
  :custom
  (merlin-error-after-save nil))

(use-package flycheck-ocaml
  :after (flycheck merlin)
  :functions (flycheck-ocaml-setup)
  :hook
  (tuareg-mode-hook . flycheck-ocaml-setup)
  (caml-mode-hook . flycheck-ocaml-setup))

(provide 'yaes-ocaml)
;;; yaes-ocaml.el ends here

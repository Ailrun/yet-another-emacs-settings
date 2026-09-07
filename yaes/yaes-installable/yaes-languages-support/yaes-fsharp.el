;;; yaes-fsharp --- F# related package setting of yaes -*- lexical-binding: t -*-
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package fsharp-mode
  :if (and
       (version<= "24" emacs-version)
       (executable-find "dotnet"))
  :after (lsp flycheck)
  :mode
  ("\\.fs[iylx]?\\'" . fsharp-mode)
  :interpreter
  ("dotnet fsi" . fsharp-mode)
  :init
  (add-hook 'fsharp-mode-hook #'lsp))

(provide 'yaes-fsharp)
;;; yaes-fsharp.el ends here

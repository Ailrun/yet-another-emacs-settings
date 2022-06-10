;;; yaes-fsharp --- F# related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package fsharp-mode
  :if (and
       (version<= "24" emacs-version)
       (executable-find yaes-fsharp-interpreter)
       (executable-find yaes-fsharp-compiler))
  :require (company company-quickhelp popup pos-tip s dash flycheck)
  :mode
  ("\\.fs[iylx]?\\'" . fsharp-mode)
  :interpreter
  ("dotnet fsi" . fsharp-mode)
  :init
  (add-hook 'fsharp-mode-hook #'lsp))

(provide 'yaes-fsharp)
;;; yaes-fsharp.el ends here

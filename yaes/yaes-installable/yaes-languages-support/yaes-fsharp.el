;;; yaes-fsharp --- F# related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(defconst yaes-fsharp-interpreter
  (if (eq system-type 'windows-nt)
      "fsi.exe"
    "fsharpi.exe"))
(defconst yaes-fsharp-compiler
  (if (eq system-type 'windows-nt)
      "fsc"
    "fsharpc"))

(req-package fsharp-mode
  :if (and
       (version<= "24" emacs-version)
       (executable-find yaes-fsharp-interpreter)
       (executable-find yaes-fsharp-compiler))
  :require (company company-quickhelp popup pos-tip s dash flycheck)
  :mode
  ("\\.fs[iylx]?\\'" . fsharp-mode)
  :config
  (setq inferior-fsharp-program
        (locate-file yaes-fsharp-interpereter exec-path))
  (setq fsharp-compiler
        (locate-file yaes-fsharp-compiler exec-path)))

(provide 'yaes-fsharp)
;;; yaes-fsharp.el ends here

;;; yaes-fsharp --- F# support of yaes
;;;
;;; Commentary:
;;;
;;; Code:
(require 'req-package)

;; Major mode and other supports for F#
(req-package fsharp-mode
  ;; required emacs version : ???
  :require (company company-quickhelp popup pos-tip s dash flycheck)
  :mode ("\\.fs[iylx]?\\'" . fsharp-mode)
  :config (if (eq system-type 'windows-nt)
              (progn
                (setq inferior-fsharp-program "\"C:\\Program Files (x86)\\Microsoft SDKs\\F#\\4.0\\Framework\\v4.0\\Fsi.exe\"")
                (setq fsharp-compiler "\"C:\\Program Files (x86)\\Microsoft SDKs\\F#\\4.0\\Framework\\v4.0\\Fsc.exe\""))
            (progn
              (setq inferior-fsharp-program "/usr/bin/fsharpi --readline-")
              (setq fsharp-compiler "/usr/bin/fsharpc"))))

;; Add omnisharp if possible.
;; Reference: https://github.com/OmniSharp/omnisharp-emacs

(provide 'yaes-fsharp)
;;; yaes-fsharp.el ends here

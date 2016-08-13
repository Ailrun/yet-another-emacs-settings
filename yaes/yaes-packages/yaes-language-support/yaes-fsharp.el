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
  :mode ("\\.fs[iylx]\\'" . fsharp-mode))

(provide 'yaes-fsharp)
;;; yaes-fsharp.el ends here

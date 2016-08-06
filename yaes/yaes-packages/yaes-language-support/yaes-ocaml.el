(require 'req-package)

;; Ocaml major mode
(req-package tuareg
  ;; required emacs version : >= 24.3
  :mode ("\\.ml\\'" . tuareg-mode))

(provide 'yaes-ocaml)

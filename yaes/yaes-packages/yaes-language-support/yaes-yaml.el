(require 'req-package)

;; Major mode for yaml
(req-package yaml-mode
  ;; required emacs version : >= 24.1
  :mode ("\\.yaml\\'" . yaml-mode))

(provide 'yaes-yaml)

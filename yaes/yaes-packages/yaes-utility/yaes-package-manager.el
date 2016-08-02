(require 'req-package)

;; Github integrated package manager
(req-package paradox
  ;; required emacs version : >= 24.4
  :require (seq let-alist spinner hydra)
  :config (paradox-github-token t))

(provide 'yaes-package-manager)

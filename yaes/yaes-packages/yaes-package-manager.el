(require 'req-package)

(req-package paradox
  :require (req let-alist spinner hydra)
  :conifg (paradox-github-token t))

(provide 'yaes-package-manager)

(require 'req-package)

(req-package paradox
  :require (seq let-alist spinner hydra)
  :config (paradox-github-token t))

(req-package el-get)

(provide 'yaes-package-manager)

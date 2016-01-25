(require 'req-package)

(req-package smartparens
  :require (dash)
  :config (smartparens-global-mode t))

(req-package rainbow-delimiters
  :config (rainbow-delimiters-mode t))

(req-package undo-tree
  :config ((global-undo-tree-mode t)))

(provide 'yaes-basic)

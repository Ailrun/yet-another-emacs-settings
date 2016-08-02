(require 'req-package)

;; Tree like undo map supporter
(req-package undo-tree
  ;; required emacs version : ???
  :config (progn
			(global-undo-tree-mode t)))

(provide 'yaes-undo)

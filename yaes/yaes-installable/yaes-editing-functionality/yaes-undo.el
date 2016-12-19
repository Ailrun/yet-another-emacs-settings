;;; yaes-undo --- undo related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package undo-tree
  :config
  (global-undo-tree-mode t))

(provide 'yaes-undo)
;;; yaes-undo.el ends here

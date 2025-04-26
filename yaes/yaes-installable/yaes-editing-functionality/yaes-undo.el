;;; yaes-undo --- undo related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package undo-tree
  :diminish undo-tree-mode
  :custom
  (global-undo-tree-mode t)
  (undo-tree-history-directory-alist '((".*" . "~/.emacs.d/.undo"))))

(provide 'yaes-undo)
;;; yaes-undo.el ends here

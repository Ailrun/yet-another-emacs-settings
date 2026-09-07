;;; yaes-multiple-cursor --- multiple-cursor related package setting of yaes -*- lexical-binding: t -*-
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package phi-search
  :demand t
  :bind
  ("C-s" . phi-search)
  ("C-r" . phi-search-backward))

(use-package multiple-cursors
  :after (phi-search)
  :init
  (eval-after-load "multiple-cursors-core"
    '(progn
       (define-key mc/keymap (kbd "<return>") nil)
       (define-key mc/keymap (kbd "C-j") 'multiple-cursors-mode)))
  :bind
  ("C-S-c C-S-c" . mc/edit-lines)
  ("C->" . mc/mark-next-like-this)
  ("C-<" . mc/mark-previous-like-this)
  ("C-*" . mc/mark-all-like-this))

(provide 'yaes-multiple-cursor)
;;; yaes-multiple-cursor.el ends here

;;; yaes-frame-design --- frame design package setting of yaes -*- lexical-binding: t -*-
;;;
;;; Commentary:
;;;
;;; Code:

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Fix mac issue of non-maximizing
(set-frame-parameter nil 'fullscreen 'maximized)

(provide 'yaes-frame-design)
;;; yaes-frame-design.el ends here

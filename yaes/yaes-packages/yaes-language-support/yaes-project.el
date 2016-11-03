;;; yaes-project --- project configuration support of yaes
;;;
;;; Commentary:
;;;
;;; Code:
(require 'req-package)

;; Using Gnu Global for tagging about 50 languages
;; Needs to install Gnu Global and exuberant-ctags and pytment
(req-package ggtags
  ;; required emacs version : >= 24
  :require (cl-lib)
  :commands (ggtags-mode)
  :init (progn
          (add-hook-exec 'c-mode #'ggtags-mode)
          (add-hook-exec 'c++-mode #'ggtags-mode)
          (add-hook-exec 'java-mode #'ggtags-mode)))

;; Project managing
(req-package projectile
  ;; required emacs version : ???
  :require (dash pkg-info)
  :config (projectile-global-mode t))

;; Buffer set (perspective) changer
(req-package perspective
  ;; required emacs version : ???
  :require (cl-lib cl)
  :config (persp-mode t))

;; Integration of projectile & perspective
(req-package persp-projectile
  ;; required emacs version : ???
  :require (cl-lib projectile perspective))

(provide 'yaes-project)
;;; yaes-project.el ends here

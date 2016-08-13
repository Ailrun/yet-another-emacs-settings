;;; yaes-frame --- Frame related packages of yaes
;;;
;;; Commentary:
;;;
;;; Code:
(require 'req-package)

;; Package for tool-bar
(req-package tool-bar
  ;; required emacs version : any
  :config (tool-bar-mode nil))

;; speedbar in this frame
(req-package sr-speedbar
  ;; required emacs version : ???
  :commands (sr-speedbar-open sr-speedbar-toggle)
  :config (global-set-key (kbd "M-s C-s") #'sr-speedbar-toggle))

(provide 'yaes-frame)
;;; yaes-frame.el ends here

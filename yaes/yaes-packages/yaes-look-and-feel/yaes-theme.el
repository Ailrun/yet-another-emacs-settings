(require 'req-package)

;; ;; Dracula theme
;; (req-package dracula-theme
;;   ;; required emacs version : ???
;;   :require (smart-mode-line highlight-current-line))

;; Boron theme
(req-package boron-theme
  ;; required emacs version : ???
  ;; :require (smart-mode-line)
  :config
  (load-theme boron t))


(provide 'yaes-theme)

;;; yaes-theme --- theme package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package boron-theme
  :if (version<= "24.0" emacs-version)
  :config
  (load-theme 'boron t))

(provide 'yaes-theme)
;;; yaes-theme.el ends here

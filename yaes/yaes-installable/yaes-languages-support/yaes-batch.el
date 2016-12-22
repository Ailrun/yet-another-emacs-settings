;;; yaes-batch --- Windows batch script related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package bat-mode
  :if (version<= "24.4" emacs-version)
  :mode ("\\.bat\\'" . bat-mode))

(provide 'yaes-batch)
;;; yaes-batch.el ends here

;;; yaes-package --- package manage related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package epkg
  :if (version<= "28.1" emacs-version))

(provide 'yaes-package)
;;; yaes-package.el ends here

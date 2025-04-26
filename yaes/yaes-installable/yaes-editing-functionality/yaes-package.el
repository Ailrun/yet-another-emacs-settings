;;; yaes-package --- package manage related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package paradox
  :if (version<= "24.4" emacs-version))

(provide 'yaes-package)
;;; yaes-package.el ends here

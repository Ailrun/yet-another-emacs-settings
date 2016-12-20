;;; yaes-package --- package manage related packages of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package paradox
  :if (version<= "24.4" emacs-version)
  :require (seq let-alist spinner hydra))

(provide 'yaes-package)
;;; yaes-package.el ends here

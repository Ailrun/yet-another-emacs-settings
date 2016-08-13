;;; yaes-package-manager --- package manager of yaes
;;;
;;; Commentary:

;; maybe this file needs integration with yaes-git

;;;
;;; Code:
(require 'req-package)

;; Github integrated package manager
(req-package paradox
  ;; required emacs version : >= 24.4
  :require (seq let-alist spinner hydra)
  :config (paradox-github-token t))

(provide 'yaes-package-manager)
;;; yaes-package-manager.el ends here

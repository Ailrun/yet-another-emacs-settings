;;; yaes-lean --- Leanprover related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package lean4-mode
  :if (version<= "24.3" emacs-version)
  :vc (:url "https://github.com/leanprover-community/lean4-mode.git"
            :rev :last-release)
  :mode
  ("\\.lean\\'" . lean4-mode)
  :interpreter
  ("lean" . lean4-mode)
  :custom
  (lean-message-boxes-enabledp t))

(provide 'yaes-lean)
;;; yaes-lean.el ends here

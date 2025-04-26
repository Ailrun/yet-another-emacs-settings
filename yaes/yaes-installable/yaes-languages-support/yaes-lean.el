;;; yaes-lean --- Leanprover related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package lean-mode
  :if (version<= "24.3" emacs-version)
  :after (flycheck)
  :mode
  ("\\.lean\\'" . lean-mode)
  :interpreter
  ("lean" . lean-mode)
  :custom
  (lean-message-boxes-enabledp t))

(use-package company-lean
  :if (version<= "24.3" emacs-version)
  :after (company lean-mode)
  :hook
  (lean-mode . company-lean-hook))

(provide 'yaes-lean)
;;; yaes-lean.el ends here

;;; yaes-lean --- Leanprover related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package lean-mode
  :if (version<= "24.3" emacs-version)
  :require (flycheck)
  :mode
  ("\\.lean\\'" . lean-mode)
  :interpreter
  ("lean" . lean-mode)
  :init
  (setq-default lean-message-boxes-enabledp t))

(req-package company-lean
  :if (version<= "24.3" emacs-version)
  :require (company lean-mode)
  :functions (company-lean-hook)
  :init
  (add-hook 'lean-mode-hook #'company-lean-hook))

(provide 'yaes-lean)
;;; yaes-lean.el ends here

;;; yaes-ido --- ido related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package ido
  :config
  (ido-mode t)
  (ido-everywhere))

(req-package ido-completing-read+
  :if (version<= "24.1" emacs-version)
  :require (cl-lib)
  :config
  (setcar ido-cr+-nil-def-alternate-behavior-list
          "\\`describe-\\(function\\|variable\\|package\\)\\'")
  (ido-ubiquitous-mode t))

(req-package ido-yes-or-no
  :require (ido-completing-read+)
  :config
  (add-to-list 'ido-cr+-nil-def-alternate-behavior-list
               'ido-yes-or-no-mode-p)
  (ido-yes-or-no-mode t))

(req-package smex
  :if (version<= "24" emacs-version)
  :commands (smex smex-major-mode-commands)
  :bind
  (("M-x" . smex)
   ("M-X" . smex-major-mode-commands)
   ("C-c C-c M-x" . execute-extended-command)))

(provide 'yaes-ido)
;;; yaes-ido.el ends here

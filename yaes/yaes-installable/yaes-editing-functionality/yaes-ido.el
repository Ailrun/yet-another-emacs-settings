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
  :require (cl-lib))

(req-package ido-yes-or-no
  :require (ido-completing-read+)
  :config
  (ido-yes-or-no-mode t))

(req-package ido-ubiquitous
  :if (version<= "24.1" emacs-version)
  :require (ido-completing-read+ cl-lib)
  :config
  (ido-ubiquitous-mode t))

(req-package smex
  :if (version<= "24" emacs-version)
  :commands (smex smex-major-mode-commands)
  :bind
  (("M-x" . smex)
   ("M-X" . smex-major-mode-commands)
   ("C-c C-c M-x" . execute-extended-command)))

(provide 'yaes-ido)
;;; yaes-ido.el ends here

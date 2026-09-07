;;; yaes-ido --- ido related package setting of yaes -*- lexical-binding: t -*-
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package ido
  :ensure nil
  :functions ido-everywhere
  :custom
  (ido-mode 'both)
  (ido-everywhere t))

(use-package ido-completing-read+
  :if (version<= "24.1" emacs-version)
  :custom
  (ido-ubiquitous-mode t)
  :config
  (setcar ido-cr+-nil-def-alternate-behavior-list
          "\\`describe-\\(function\\|variable\\|package\\)\\'"))

(use-package ido-yes-or-no
  :after (ido-completing-read+)
  :custom
  (ido-yes-or-no-mode t)
  :config
  (add-to-list 'ido-cr+-nil-def-alternate-behavior-list
               'ido-yes-or-no-mode-p))

(use-package smex
  :if (version<= "24" emacs-version)
  :commands (smex smex-major-mode-commands)
  :bind
  ("M-x" . smex)
  ("M-X" . smex-major-mode-commands)
  ("C-c C-c M-x" . execute-extended-command))

(provide 'yaes-ido)
;;; yaes-ido.el ends here

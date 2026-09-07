;;; yaes-discord --- discord related package setting of yaes -*- lexical-binding: t -*-
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package elcord
  :if (version<= "25.1" emacs-version)
  :demand t
  :diminish elcord-mode
  :custom
  (elcord-display-buffer-details nil)
  (elcord-mode t))

(provide 'yaes-discord)
;;; yaes-discord.el ends here

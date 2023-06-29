;;; yaes-discord --- discord related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package elcord
  :if (version<= "25.1" emacs-version)
  :demand t
  :diminish elcord-mode
  :config
  (setq elcord-display-buffer-details nil)
  (elcord-mode))

(provide 'yaes-discord)
;;; yaes-discord.el ends here

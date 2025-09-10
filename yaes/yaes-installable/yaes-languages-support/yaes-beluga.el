;;; yaes-beluga --- Beluga related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package beluga-mode
  :if (version<= "24.4" emacs-version)
  :mode
  ("\\.elf\\'" . beluga-mode)
  ("\\.bel\\'" . beluga-mode)
  :custom
  (beluga-mode-prefix-key . "\C-c \C-b"))

(provide 'yaes-beluga)
;;; yaes-beluga.el ends here

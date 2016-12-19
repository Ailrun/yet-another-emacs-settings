;;; yaes-ido --- ido related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package ido
  :config
  (ido-mode t))

(req-package ido-completing-read+
  :if (version<= "24.1" emacs-version)
  :require (cl-lib))

(req-package ido-ubiquitous
  :if (version<= "24.1" emacs-version)
  :require (ido-completing-read+ cl-lib)
  :config
  (ido-everywhere))

(provide 'yaes-ido)
;;; yaes-ido.el ends here

;;; yaes-batch --- Windows batch script related package setting of yaes -*- lexical-binding: t -*-
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package bat-mode
  :if (version<= "24.4" emacs-version)
  :ensure nil
  :mode ("\\.bat\\'" . bat-mode))

(provide 'yaes-batch)
;;; yaes-batch.el ends here

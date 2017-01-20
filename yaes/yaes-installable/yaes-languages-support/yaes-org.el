;;; yaes-org --- org mode related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package org
  :require (outline)
  :mode
  ("\\.org\\'" . org-mode)
  :init
  (setq org-replace-disputed-keys t))

(provide 'yaes-org)
;;; yaes-org.el ends here

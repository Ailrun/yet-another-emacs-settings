;;; yaes-abbrev --- abbrev related package setting of yaes -*- lexical-binding: t -*-
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package abbrev
  :ensure nil
  :demand t
  :diminish abbrev-mode)

(provide 'yaes-abbrev)
;;; yaes-abbrev.el ends here

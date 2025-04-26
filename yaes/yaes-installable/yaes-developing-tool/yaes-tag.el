;;; yaes-tag --- tagging related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package ggtags
  :if (and
       (version<= "24" emacs-version)
       (executable-find "gtags")
       (executable-find "ctags"))
  :hook
  (c-mode . ggtags-mode)
  (c++-mode . ggtags-mode)
  (java-mode . ggtags-mode))

(provide 'yaes-tag)
;;; yaes-tag.el ends here

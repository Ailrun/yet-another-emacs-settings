;;; yaes-tag --- tagging related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package ggtags
  :if (and
       (version<= "24" emacs-version)
       (executable-find "gtags")
       (executable-find "ctags"))
  :require (cl-lib)
  :commands (ggtags-mode)
  :init
  (add-hook 'c-mode-hook #'ggtags-mode)
  (add-hook 'c++-mode-hook #'ggtags-mode)
  (add-hook 'java-mode-hook #'ggtags-mode))

(provide 'yaes-tag)
;;; yaes-tag.el ends here

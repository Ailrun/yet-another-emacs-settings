;;; yaes-yasnippet --- yasnippet related package setting of yaes -*- lexical-binding: t -*-
;;;
;;; Commentary:
;;;
;;; Code:

(require 'f)
(require 'use-package)

(defconst yaes-yasnippet-dir
  (f-join user-emacs-directory "snippets"))

(use-package yasnippet
  :diminish yas-minor-mode
  :custom
  (yas-prompt-functions
   '(yas-ido-prompt
     yas-dropdown-prompt
     yas-completing-prompt))
  (yas-global-mode t)
  :config
  (when (null (f-dir? yaes-yasnippet-dir))
    (f-mkdir yaes-yasnippet-dir)))

(provide 'yaes-yasnippet)
;;; yaes-yasnippet.el ends here

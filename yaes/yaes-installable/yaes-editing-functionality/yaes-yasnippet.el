;;; yaes-yasnippet --- yasnippet related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'f)
(require 'req-package)

(defconst yaes-yasnippet-dir
  (f-join user-emacs-directory "snippets"))

(req-package yasnippet
  :diminish yas-minor-mode
  :custom
  (yas-prompt-functions
   '(yas-ido-prompt
     yas-dropdown-prompt
     yas-completing-prompt))
  :config
  (when (null (f-dir? yaes-yasnippet-dir))
    (f-mkdir yaes-yasnippet-dir))
  (yas-global-mode t))

(provide 'yaes-yasnippet)
;;; yaes-yasnippet.el ends here

;;; yaes-yasnippet --- yasnippet related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(defconst yaes-yasnippet-dir
  (f-join user-emacs-directory "snippets"))

(req-package yasnippet
  :config
  (yas-global-mode t)
  (setq-default yas-prompt-functions
                '(yas-ido-prompt
                  yas-dropdown-prompt
                  yas-completing-prompt))
  (when (null (f-dir? yaes-yasnippet-dir))
    (f-mkdir yaes-yasnippet-dir)))

(provide 'yaes-yasnippet)
;;; yaes-yasnippet.el ends here

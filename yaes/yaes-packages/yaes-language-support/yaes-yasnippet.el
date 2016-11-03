;;; yaes-yasnippet --- yasnippet support of yaes
;;;
;;; Commentary:
;;;
;;; Code:
(require 'req-package)

;; Snippet providing package
(req-package yasnippet
  ;; required emacs version : ???
  :require (cl-lib ido)
  :config (progn
            (yas-global-mode t)
            (setq-default yas-prompt-functions '(yas-ido-prompt
                                                 yas-dropdown-prompt
                                                 yas-completing-prompt))))

(provide 'yaes-yasnippet)
;;; yaes-yasnippet.el ends here

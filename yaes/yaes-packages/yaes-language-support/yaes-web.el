;;; yaes-web --- web-related modes in yaes
;;;
;;; Commentary:
;;;
;;; Code:
(require 'req-package)

;; General web editing mode
;; Not only for .html, but also for .asp, .php, ...
(req-package web-mode
  ;; required emacs version : ???
  :mode ("\\.html?\\'" . web-mode)
  :config (progn (setq web-mode-css-indent-offset 2)))

;; For auto complete
(req-package company-web
  ;; required emacs version : ???
  :require (company dash web-completion-data)
  :config (progn (add-to-list 'company-backends 'company-web-html)
                 (add-to-list 'company-backends 'company-web-jade)
                 (add-to-list 'company-backends 'company-web-slim)))

(provide 'yaes-web)
;;; yaes-web.el ends here

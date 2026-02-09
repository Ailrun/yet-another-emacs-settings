;;; yaes-javascript --- JavaScript related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package json-mode
  :mode
  ("\\.json\\'" . json-mode))

(use-package js2-mode
  :if (and (version<= "24.1" emacs-version))
  :mode
  ("\\.js\\'" . js2-mode)
  ("\\.mjs\\'" . js2-mode)
  ("\\.jsx\\'" . js2-jsx-mode)
  :interpreter
  ("node" . js2-mode)
  ("node" . js2-jsx-mode)
  :custom
  (js-indent-level 2)
  (js2-bounce-indent-p t))

;; ;; These 3 packages are too slow

;; (use-package flow-minor-mode
;;   :if (and (version<= "25.1" emacs-version)
;;            (executable-find "flow"))
;;   :require (web-mode)
;;   :commands (flow-minor-mode flow-enable-automatically)
;;   :init
;;   (add-hook 'js2-mode-hook #'flow-minor-mode)
;;   (add-hook 'js2-jsx-mode-hook #'flow-minor-mode))

;; (use-package company-flow
;;   :if (and (version<= "25.1" emacs-version)
;;            (executable-find "flow"))
;;   :require (company)
;;   :commands (company-flow)
;;   :init
;;   (add-hook 'js2-mode-hook
;;             (lambda ()
;;               (setq-local company-backends
;;                           (append
;;                            '(company-flow)
;;                            company-backends))))
;;   (add-hook 'js2-jsx-mode-hook
;;             (lambda ()
;;               (setq-local company-backends
;;                           (append
;;                            '(company-flow)
;;                            company-backends)))))

;; (use-package flycheck-flow
;;   :if (and (version<= "25.1" emacs-version)
;;            (executable-find "flow"))
;;   :require (flycheck))

(use-package tern
  :if (and
       (version<= "24" emacs-version)
       (executable-find "tern"))
  :after (json)
  :hook
  (js2-mode . tern-mode)
  (js2-jsx-mode . tern-mode))

(provide 'yaes-javascript)
;;; yaes-javascript.el ends here

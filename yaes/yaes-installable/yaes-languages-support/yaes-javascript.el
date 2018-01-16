;;; yaes-javascript --- JavaScript related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package json-mode
  :mode
  ("\\.json\\'" . json-mode))

(req-package js2-mode
  :if (and (version<= "24.1" emacs-version))
  :mode
  ("\\.js\\'" . js2-mode)
  ("\\.jsx\\'" . js2-jsx-mode)
  :interpreter
  ("node" . js2-mode)
  ("node" . js2-jsx-mode)
  :config
  (setq-default js-indent-level 2)
  (setq-default js2-bounce-indent-p t))

;; ;; These 3 packages are too slow

;; (req-package flow-minor-mode
;;   :if (and (version<= "25.1" emacs-version)
;;            (executable-find "flow"))
;;   :require (web-mode)
;;   :commands (flow-minor-mode flow-enable-automatically)
;;   :init
;;   (add-hook 'js2-mode-hook #'flow-minor-mode)
;;   (add-hook 'js2-jsx-mode-hook #'flow-minor-mode))

;; (req-package company-flow
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

;; (req-package flycheck-flow
;;   :if (and (version<= "25.1" emacs-version)
;;            (executable-find "flow"))
;;   :require (flycheck))

(req-package tern
  :if (version<= "24" emacs-version)
  :require (json)
  :commands (tern-mode)
  :init
  (add-hook 'js2-mode-hook
            (lambda ()
              (tern-mode t)))
  (add-hook 'js2-jsx-mode-hook
            (lambda ()
              (tern-mode t))))

(req-package company-tern
  :require (company)
  :commands (company-tern)
  :init
  (add-hook 'js2-mode-hook
            (lambda ()
              (setq-local company-backends
                          (append
                           '(company-tern)
                           company-backends))))
  (add-hook 'js2-jsx-mode-hook
            (lambda ()
              (setq-local company-backends
                          (append
                           '(company-tern)
                           company-backends))))
  :config
  (setq company-tern-property-marker " !!"))

(provide 'yaes-javascript)
;;; yaes-javascript.el ends here

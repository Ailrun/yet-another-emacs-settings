;;; yaes-python --- Python related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package python
  :if (executable-find "python")
  :mode
  ("\\.py[3w]?" . python-mode))

(req-package python-environment
  :if (executable-find "virtualenv")
  :require (python deferred))

(req-package jedi-core
  :if (and
       (version<= "24" emacs-version)
       (executable-find "python")
       (executable-find "virtualenv"))
  :require (epc python-environment cl-lib)
  :commands (jedi:install-server)
  :config
  (setq jedi:complete-on-dot t)
  (jedi:install-server))

;; (req-package jedi
;;   :if (and
;;        (version<= "24" emacs-version)
;;        (executable-find "python")
;;        (executable-find "virtualenv"))
;;   :require (python auto-complete)
;;   :commands (jedi:install-server jedi:setup)
;;   :init
;;   (add-hook 'python-mode-hook #'jedi:setup)
;;   :config
;;   (setq jedi:complete-on-dot t)
;;   (jedi:install-server))

(req-package company-jedi
  :if (and
       (version<= "24" emacs-version)
       (executable-find "python")
       (executable-find "virtualenv"))
  :require (cl-lib company)
  :functions (comapny-jedi-setup)
  :commands (company-jedi-setup)
  :init
  (defun company-jedi-setup ()
    "Setup company-jedi."
    (setq-local company-backends
                (append
                 '(company-jedi company-files)
                 company-backends)))
  (add-hook 'python-mode-hook #'company-jedi-setup))

;;;; TODO: consider elpy

(provide 'yaes-python)
;;; yaes-python.el ends here

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
  :require (python deferred))

(req-package jedi-core
  :if (version<= "24" emacs-version)
  :require (epc python-environment cl-lib))

(req-package jedi
  :if (version<= "24" emacs-version)
  :require (python jedi-core auto-complete)
  :commands (jedi:setup)
  :init
  (add-hook 'python-mode-hook #'jedi:setup)
  :config
  (setq jedi:complete-on-dot t)
  (jedi:install-server))

(req-package company-jedi
  :if (version<= "24" emacs-version)
  :require (cl-lib company jedi-core)
  :functions (yaes-comapny-jedi-setup)
  :commands (yaes-company-jedi-setup)
  :init
  (defun yaes-company-jedi-setup ()
    "Setup company-jedi."
    (setq-local company-backends
                (append
                 '(company-jedi company-files)
                 company-backends)))
  (add-hook 'python-mode-hook #'yaes-company-jedi-setup))

;;;; TODO: consider elpy

(provide 'yaes-python)
;;; yaes-python.el ends here

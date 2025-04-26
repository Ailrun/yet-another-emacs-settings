;;; yaes-csharp --- C# related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package csharp-mode
  :mode
  ("\\.cs\\'" . csharp-mode))

(use-package omnisharp
  :if (and
       (version<= "24.3" emacs-version)
       (executable-find "curl"))
  :after (flycheck csharp-mode)
  :hook
  (csharp-mode . omnisharp-mode)
  (csharp-mode . (lambda ()
                   (setq-local company-backends
                               (append '(company-omnisharp) company-backends)))))

(provide 'yaes-csharp)
;;; yaes-csharp.el ends here

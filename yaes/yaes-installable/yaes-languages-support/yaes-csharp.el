;;; yaes-csharp --- C# related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package csharp-mode
  :mode
  ("\\.cs\\'" . csharp-mode))

(req-package omnisharp
  :if (and
       (version<= "24.3" emacs-version)
       (executable-find "curl"))
  :require (json flycheck dash csharp-mode cl-lib s)
  :commands (omnisharp-mode)
  :init
  (add-hook 'csharp-mode-hook #'omnisharp-mode)
  (add-hook 'csharp-mode-hook
            (lambda ()
              (setq-local company-backends
                          (append
                           '(company-omnisharp)
                           company-backends)))))

(provide 'yaes-csharp)
;;; yaes-csharp.el ends here

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
       (executable-find "curl")
       (executable-find "OmniSharp"))
  :require (json flycheck dash auto-complete popup csharp-mode cl-lib s)
  :commands (omnisharp-mode)
  :init
  (add-hook 'csharp-mode-hook #'omnisharp-mode))

(provide 'yaes-csharp)
;;; yaes-csharp.el ends here

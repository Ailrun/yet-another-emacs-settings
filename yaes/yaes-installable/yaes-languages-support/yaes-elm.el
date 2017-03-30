;;; yaes-elm --- Elm related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package elm-mode
  :if (and
       (version<= "24" emacs-version))
  :require (f let-alist s company flycheck)
  :mode
  ("\\.elm\\'" . elm-mode)
  :init
  (add-hook 'elm-mode-hook
            (lambda ()
              (setq-local company-backends
                          (append
                           '(company-elm)
                           company-backends)))))

(req-package flycheck-elm
  :if (version<= "24.4" emacs-version)
  :require (flycheck)
  :commands (flycheck-elm-setup)
  :init
  (add-hook 'elm-mode-hook #'flycheck-elm-setup))

(req-package elm-yasnippets
  :require (yasnippet))

(provide 'yaes-elm)
;;; yaes-elm.el ends here

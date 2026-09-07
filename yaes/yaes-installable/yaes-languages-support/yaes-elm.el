;;; yaes-elm --- Elm related package setting of yaes -*- lexical-binding: t -*-
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package elm-mode
  :if (and
       (version<= "24" emacs-version))
  :after (company flycheck)
  :mode
  ("\\.elm\\'" . elm-mode)
  :hook
  (elm-mode . (lambda ()
                (setq-local company-backends
                            (append
                             '(company-elm)
                             company-backends)))))

(use-package flycheck-elm
  :if (version<= "24.4" emacs-version)
  :after (elm-mode flycheck)
  :hook
  (elm-mode . flycheck-elm-setup))

(use-package elm-yasnippets
  :after (elm-mode yasnippet)
  :demand t)

(provide 'yaes-elm)
;;; yaes-elm.el ends here

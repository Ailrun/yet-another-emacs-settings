;;; yaes-purescript --- Purescript related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package purescript-mode
  :if (version<= "24" emacs-version)
  :mode
  ("\\.purs\\'" . purescript-mode)
  :init
  (add-hook 'purescript-mode-hook #'turn-on-purescript-indentation)
  :custom
  (purescript-indentation-delete-indentation nil)
  (purescript-indentation-delete-backward-indentation nil)
  (purescript-indent-spaces 2))

(use-package psc-ide
  :if (version<= "25" emacs-version)
  :after (purescript-mode company flycheck)
  :hook
  (purescript-mode . psc-ide-mode))

(provide 'yaes-purescript)
;;; yaes-purescript.el ends here

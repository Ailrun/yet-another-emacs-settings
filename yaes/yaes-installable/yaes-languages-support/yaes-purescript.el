;;; yaes-purescript --- Purescript related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package purescript-mode
  :if (version<= "24" emacs-version)
  :mode
  ("\\.purs\\'" . purescript-mode)
  :init
  (add-hook 'purescript-mode-hook #'turn-on-purescript-indentation)
  :config
  (setq purescript-indentation-delete-indentation nil)
  (setq purescript-indentation-delete-backward-indentation nil)
  (setq purescript-indent-spaces 2))

(req-package psc-ide
  :if (version<= "25" emacs-version)
  :require (purescript-mode company flycheck)
  :commands (psc-ide-mode)
  :init
  (add-hook 'purescript-mode-hook #'psc-ide-mode))

(provide 'yaes-purescript)
;;; yaes-purescript.el ends here

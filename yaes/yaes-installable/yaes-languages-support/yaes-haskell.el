;;; yaes-haskell --- Haskell related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(req-package haskell-mode
  :if (version<= "24.3" emacs-version)
  :mode
  ("\\.l?hs\\'" . haskell-mode)
  :interpreter
  ("ghci" . haskell-mode)
  ("stack ghci" . haskell-mode)
  :init
  (add-hook 'haskell-mode-hook #'haskell-indentation-mode)
  :config
  (setq-default haskell-indent-offset 2))

(req-package lsp-haskell
  :require (haskell-mode)
  :init
  (add-hook 'haskell-mode-hook #'lsp)
  :config
  (setq lsp-haskell-process-path-hie "haskell-language-server-wrapper"))

(req-package haskell-snippets
  :require (yasnippet cl-lib))

(provide 'yaes-haskell)
;;; yaes-haskell.el ends here

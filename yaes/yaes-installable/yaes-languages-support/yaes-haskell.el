;;; yaes-haskell --- Haskell related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package haskell-mode
  :if (version<= "24.3" emacs-version)
  :interpreter
  ("ghci" . haskell-mode)
  ("stack ghci" . haskell-mode)
  :hook
  (haskell-mode . haskell-indentation-mode)
  :custom
  (haskell-indent-offset 2))

(use-package haskell-cabal
  :if (version<= "24.3" emacs-version)
  :ensure haskell-mode
  :defer t
  :config
  (require 'haskell-mode))

(use-package lsp-haskell
  :functions lsp--set-configuration
  :after (:any haskell-mode haskell-cabal)
  :hook
  (haskell-mode . lsp)
  (haskell-literate-mode . lsp)
  (haskell-cabal-mode . lsp)
  :init
  (add-hook 'lsp-after-initialize-hook
            #'(lambda ()
                (add-to-list 'lsp--formatting-indent-alist '(haskell-mode . haskell-indentation-layout-offset))
                (add-to-list 'lsp--formatting-indent-alist '(haskell-literate-mode . haskell-indentation-layout-offset))
                (add-to-list 'lsp--formatting-indent-alist '(haskell-cabal-mode . haskell-indentation-layout-offset))
                (lsp--set-configuration
                 '(:haskell (:cabalFormattingProvider "cabal-fmt"))
                 )))
  :custom
  (lsp-haskell-process-path-hie "haskell-language-server-wrapper"))

(use-package haskell-snippets
  :after (:all yasnippet (:any haskell-mode haskell-cabal)))

(provide 'yaes-haskell)
;;; yaes-haskell.el ends here

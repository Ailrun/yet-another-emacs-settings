;;; yaes-haskell --- Haskell related package setting of yaes -*- lexical-binding: t -*-
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
  (haskell-indent-offset 2)
  :config
  (require 'haskell-cabal-mode))

(use-package haskell-cabal
  :if (version<= "24.3" emacs-version)
  :ensure nil
  :after (haskell-mode)
  :commands (haskell-cabal-mode)
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
  (lsp-haskell-process-path-hie "haskell-language-server-wrapper")
  (lsp-haskell-formatting-provider "stylish-haskell")
  (lsp-haskell-plugin-semantic-tokens-global-on t)
  (lsp-haskell-plugin-stan-global-on nil))

(use-package haskell-snippets
  :after (:all yasnippet (:any haskell-mode haskell-cabal)))

(provide 'yaes-haskell)
;;; yaes-haskell.el ends here

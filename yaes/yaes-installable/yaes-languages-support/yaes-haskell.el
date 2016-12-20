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
  ("stack ghci" . haskell-mode))

(req-package intero
  :if (and
       (version<= "24.3" emacs-version)
       (executable-find "stack"))
  :require (flycheck company haskell-mode)
  :commands (intero-mode)
  :init
  (add-hook 'haskell-mode-hook #'intero-mode)
  :config
  (setq-default intero-repl-no-load nil)
  (setq-default setq-default intero-repl-no-load nil))

(req-package haskell-snippets
  :require (yasnippet cl-lib))

(provide 'yaes-haskell)
;;; yaes-haskell.el ends here

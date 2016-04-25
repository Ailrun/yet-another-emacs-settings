(require 'req-package)

(req-package haskell-mode
  :require cl-lib
  :mode ("\\.hs\\'" . haskell-mode))

(req-package ghc
  :require haskell-mode)

(req-package hi2
  :require haskell-mode)
;; hi2 need to hook to haskell mode.

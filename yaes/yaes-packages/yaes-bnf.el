(require 'req-package)

(req-package ebnf2ps
  :config (progn (setq ebnf-syntax 'iso-ebnf)))

(req-package "./ebnf-mode"
  :mode ("\\.ebnf\\'" . ebnf-mode))

(provide 'yaes-bnf)

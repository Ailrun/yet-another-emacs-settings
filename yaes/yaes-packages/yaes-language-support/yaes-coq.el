(require 'req-package)

;; Extension mode for company with coq mode
(req-package company-coq
  ;; required emacs version : ???
  :require (company-math company yasnippet dash cl-lib)
  :config (progn
			(add-to-list 'company-coq-disabled-features 'prettify-symbols)
			(add-hook-exec 'coq-mode #'company-coq-mode)))

(provide 'yaes-coq)

(require 'req-package)

(req-package company-coq
  :require company company-math yasnippet dash
  :config (progn (add-to-list 'company-coq-disabled-features 'prettify-symbols)
				 (req-package-hooks-add-execute 'coq-mode 'company-coq-mode)))

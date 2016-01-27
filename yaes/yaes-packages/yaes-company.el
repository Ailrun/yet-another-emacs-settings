(require 'req-package)

(req-package company
  :require (yasnippet)
  :config (progn (global-company-mode 1)
;;		 (global-set-key (kbd "C-<tab>") 'company-dabbrev)
		 (global-set-key (kbd "C-<tab>") 'company-complete)
		 (global-set-key (kbd "C-c C-y") 'company-yasnippet)))

(req-package company-quickhelp
  :require (company)
  :config (company-quickhelp-mode 1))

(provide 'yaes-company)

(require 'req-package)

(req-package ctags
  :config (progn (setq tags-revert-without-query t)
				 (global-set-key (kbd "<f5>") 'ctags-create-or-update-tags-table)
				 (global-set-key (kbd "M-.")  'ctags-search)))

(req-package ggtags
  :require cl-lib-0.5)

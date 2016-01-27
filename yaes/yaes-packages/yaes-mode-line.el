(require 'req-package)

(req-package smart-mode-line
  :config
  (progn
    (line-number-mode t)
    (column-number-mode t)
    (setq sml/shorten-modes t)
    (setq sml/shorten-directory t)
    (setq sml/name-width 20)
    (setq sml/hidden-modes nil)
    (setq sml/theme nil)
    (add-to-list 'sml/hidden-modes " Anzu")
    (add-to-list 'sml/hidden-modes " SliNav")
    (add-to-list 'sml/hidden-modes " :")
    (add-to-list 'sml/hidden-modes " yas")
    (add-to-list 'sml/hidden-modes " Undo-Tree")
    (add-to-list 'sml/hidden-modes " hl-p")
    (add-to-list 'sml/hidden-modes " company-dabbrev")
    (add-to-list 'sml/hidden-modes " company-capf")
    (add-to-list 'sml/hidden-modes " company-<dabbrev-code>")
    (add-to-list 'sml/hidden-modes " SP")
    (add-to-list 'sml/hidden-modes " ElDoc")
    (add-to-list 'sml/hidden-modes " overseer")
    (add-to-list 'sml/hidden-modes " company")
    (sml/setup)))

(req-package anzu
  :require (smart-mode-line)
  :config
  (global-anzu-mode t)
  (global-set-key (kbd "M-%") 'anzu-query-replace)
  (global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp))

(req-package tool-bar
  :config
  (tool-bar-mode -1))

(provide 'yaes-mode-line) 

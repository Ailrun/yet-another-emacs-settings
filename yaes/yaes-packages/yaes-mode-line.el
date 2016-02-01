(require 'req-package)

(req-package smart-mode-line
  :config
  (progn
    (line-number-mode t)
    (column-number-mode t)
    (setq sml/shorten-modes t)
    (setq sml/shorten-directory t)
    (setq sml/name-width 20)
    (setq sml/theme nil)
    (sml/setup)))

(req-package rich-minority
  :config
  (rich-minority-mode 1)
  (setq rm-blacklist (mapconcat 'identity '(" :"
					    " Anzu"
					    " company.*"
					    " ElDoc"
					    " hl-p"
					    " js2r"
					    " overseer"
					    " SliNav"
					    " SP"
					    " Undo-Tree"
					    " vars"
					    " yas") "\\|")))

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

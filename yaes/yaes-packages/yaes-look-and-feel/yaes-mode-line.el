;;; yaes-mode-line --- mode-line look-and-feel of yaes
;;;
;;; Commentary:
;;;
;;; Code:
(require 'req-package)

;; More delicate mode line
(req-package smart-mode-line
  ;; required emacs version : >= 24.3
  :require (rich-minority-mode)
  :config (progn
			(line-number-mode t)
			(column-number-mode t)
			(setq sml/shorten-modes t)
			(setq sml/shorten-directory t)
			(setq sml/name-width 20)
			(setq sml/theme nil)
			(sml/setup)))

;; Submode for smart-mode-line
;; Is there any simple way to get rid of this?
(req-package rich-minority
  ;; required emacs version : ???
  :require (cl-lib)
  :config (progn
			(rich-minority-mode t)
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
													  " yas") "\\|"))))

(provide 'yaes-mode-line)
;;; yaes-mode-line.el ends here

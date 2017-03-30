(require 'req-package)

(req-package js2-mode
  :mode (("\\.js\\'" . js2-mode)
		 ("\\.json\\'" . js2-mode))
  :config  (progn
			 (js2-include-node-externs t)
			 (js2-basic-offset 2)))

;;;; Conflict with company package
;; (req-package js2-highlight-vars
;;   :require (js2-mode)
;;   :config (req-package-hooks-add-execute 'js2-mode 'js2-highlight-vars-mode))

(req-package js2-refactor
  :require (js2-mode s multiple-cursors dash s yasnippet)
  :config (req-package-hooks-add-execute 'js2-mode 'js2-refactor-mode))

(req-package js-doc)

(provide 'yaes-javascript)

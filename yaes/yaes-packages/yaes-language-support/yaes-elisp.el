(require 'req-package)

;; Convert elisp commentary section to markdown
(req-package el2markdown
  ;; required emacs version : ???
  :commands (el2markdown-view-buffer
			 el2markdown-write-file
			 el2markdown-write-readme))

;; ;; Is this required?
;; ;; Concurrency in emacs package
;; (req-package concurrent
;;   ;; required emacs version : ???
;;   :require (cl deferred))

;; Additional tools for elisp developement
;; M-.     : Find definition
;; C-c C-l : List the callers of this function
;; C-c C-? : Help
;; ...
(req-package el-spice
  ;; required emacs version : ???
  :require (eldoc etags thingatpt+)
  :commands (el-spice-mode)
  :init (progn
		  (add-hook-exec 'emacs-lisp-mode 'el-spice-mode)
		  (add-hook-exec 'lisp-interaction-mode 'el-spice-mode)))

;; Elisp macro expanding package
(req-package macrostep
  ;; required emacs version : ???
  :require (pp ring cmacexp cl-lib)
  :commands (macrostep-expand)
  :init (progn
		  (define-key emacs-lisp-mode-map (kbd "C-c e") 'macrostep-expand)))


;; Elisp Package Repositories

;; ;; Marmalade repository api
;; ;; There is no documents for this package
;; (req-package marmalade
;;   :require (furl))

;; Marmalade repository api
;; Use command "marmalade-upload"
(req-package marmalade-client
  ;; required emacs version : ???
  :require (web kv time-stamp gh gh-issues))

;; Make namespaces and skip it
(req-package names
  ;; required emacs version : >= 24.1
  :require (cl-lib)
  :defer t)

(req-package eldoc
  ;; required emacs version : any
  :init (progn
		  (add-hook-exec 'emacs-lisp-mode #'eldoc-mode)
		  (add-hook-exec 'lisp-interaction-mode #'eldoc-mode)))

(provide 'yaes-elisp)

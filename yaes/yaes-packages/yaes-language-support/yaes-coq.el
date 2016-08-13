;;; yaes-coq --- coq support of yaes
;;;
;;; Commentary:
;;;
;;; Code:
(require 'req-package)

;; Extension mode for company with coq mode
(req-package company-coq
  ;; required emacs version : ???
  :require (company-math company yasnippet dash cl-lib)
  :config (progn
			(add-to-list 'company-coq-disabled-features 'prettify-symbols)
			(add-hook-exec 'coq-mode #'company-coq-mode)))

;; Commenting support with coq
(req-package coq-commenter
  ;; required emacs version : ???
  :require (dash s cl-lib)
  :commands (coq-commenter-mode)
  :init (add-hook-exec 'coq-mode #'coq-commenter-mode)
  :config (progn
			(define-key coq-commenter-mode-map
			  (kbd "C-x C-;")
			  #'coq-commenter-comment-proof-in-region)
			(define-key coq-commenter-mode-map
			  (kbd "C-x C-'")
			  #'coq-commenter-uncomment-proof-in-buffer)))

(provide 'yaes-coq)
;;; yaes-coq.el ends here

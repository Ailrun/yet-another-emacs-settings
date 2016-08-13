;;; yaes-c-like --- c-like language support of yaes
;;;
;;; Commentary:
;;;
;;; Code:
(require 'req-package)

;; Find header from source, source from header
(req-package cff
  ;; required emacs version : >= 24
  :require (cl-lib)
  :commands (cff-find-other-file)
  :init (progn
		  (add-hook-exec 'c++-mode
						 (lambda ()
						   (define-key c-mode-base-map (kbd "M-o") 'cff-find-other-file)))
		  (add-hook-exec 'c-mode
						 (lambda ()
						   (define-key c-mode-base-map (kbd "M-o") 'cff-find-other-file)))))

;; Backend plugin for company with C/C++
(req-package company-c-headers
  ;; required emacs version : >= 24.1
  :require (company)
  :config (add-to-list 'company-backends 'company-c-headers))

;; C/C++ Completion
(req-package function-args
  ;; required emacs version : >= 24
  :require (swiper)
  :config (fa-config-default))

(req-package cedet)

(req-package semantic
  :config (progn
			(global-semanticdb-minor-mode t)
			(global-semantic-idle-scheduler-mode t)
			(semantic-mode t)))

(provide 'yaes-c-like)
;;; yaes-c-like.el ends here

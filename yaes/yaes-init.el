(defconst yaes-dir "~/.emacs.d/yaes/")
(defconst yaes-package-el (expand-file-name "yaes-package.el" yaes-dir))
(defconst yaes-packages-dir (file-name-as-directory (expand-file-name "yaes-packages" yaes-dir)))

(load-file yaes-package-el)

(req-package-force load-dir
  :defer 1
  :init
  (setq force-load-messages nil)
  (setq load-dir-debug nil)
  (setq load-dir-recursive t)
  :config
  (load-dir-one yaes-packages-dir)
  (req-package-finish))


;;Function for unbound symbols
(mapatoms (lambda (symbol)
	    (if (string-prefix-p "yaes-" (symbol-name symbol))
		(unintern symbol))))


;;;;Obsoleted Version of unbound symbols
;; (defun makunbound-all (list)
;;   (when (> (safe-length list) 0)
;;     (makunbound (pop list))
;;     (makunbound-all list)))

;; (makunbound-all '(yaes-dir yaes-package-el yaes-packages-dir))
;; (fmakunbound makunbound-all)

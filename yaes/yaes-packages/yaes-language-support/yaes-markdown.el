;;; yaes-markdown --- markdown support of yaes
;;;
;;; Commentary:
;;;
;;; Code:
(require 'req-package)

;; Major mode for markdown
(req-package markdown-mode
  ;; required emacs version : >= 24
  :require (cl-lib)
  :mode ("\\.md\\'" . markdown-mode))

;; ;; Make web preview for markdown
;; ;; Do I really use this?
;; (req-package markdown-preview-mode
;;   :require (websocket markdown-mode)
;;   :config (progn (req-package-hooks-add-execute 'markdown-mode 'markdown-preview-mode)
;; 				 (setq markdown-preview-style "http://thomasf.github.io/solarized-css/solarized-light.min.css")))

(req-package flymd
  ;; required emacs version : ???
  :require (cl-lib)
  :commands (flymd-flyit))

;; ;; Rendering markdown file with github api
;; ;; Too little supports
;; (req-package gh-md
;;   ;; required emacs version : >= 24
;;   :commands (gh-md-render-region gh-md-render-buffer))

;; Make table of contents for markdown file
(req-package markdown-toc
  ;; required emacs version : ???
  :require (s dash markdown-mode)
  :commands (markdown-toc-generate-toc)
  :init (defun markdown-imenu-create-index ()
	  "Create and return an imenu index alist for the current buffer.
See `imenu-create-index-function' and `imenu--index-alist' for details."
	  (let* ((root '(nil . nil))
		 cur-alist
		 (cur-level 0)
		 (empty-heading "-")
		 (self-heading ".")
		 hashes pos level heading)
	    (save-excursion
	      (goto-char (point-min))
	      (while (re-search-forward markdown-regex-header (point-max) t)
		(unless (markdown-code-block-at-point)
		  (cond
		   ((setq heading (match-string-no-properties 1))
		    (setq pos (match-beginning 1)
			  level 1))
		   ((setq heading (match-string-no-properties 3))
		    (setq pos (match-beginning 3)
			  level 2))
		   ((setq hashes (match-string-no-properties 5))
		    (setq heading (match-string-no-properties 6)
			  pos (match-beginning 5)
			  level (length hashes))))
		  (let ((alist (list (cons heading pos))))
		    (cond
		     ((= cur-level level)       ; new sibling
		      (setcdr cur-alist alist)
		      (setq cur-alist alist))
		     ((< cur-level level)       ; first child
		      (dotimes (i (- level cur-level 1))
			(setq alist (list (cons empty-heading alist))))
		      (if cur-alist
			  (let* ((parent (car cur-alist))
				 (self-pos (cdr parent)))
			    (setcdr parent (cons (cons self-heading self-pos) alist)))
			(setcdr root alist))    ; primogenitor
		      (setq cur-alist alist)
		      (setq cur-level level))
		     (t                         ; new sibling of an ancestor
		      (let ((sibling-alist (last (cdr root))))
			(dotimes (i (1- level))
			  (setq sibling-alist (last (cdar sibling-alist))))
			(setcdr sibling-alist alist)
			(setq cur-alist alist))
		      (setq cur-level level))))))
	      (cdr root)))))

(provide 'yaes-markdown)
;;; yaes-markdown.el ends here

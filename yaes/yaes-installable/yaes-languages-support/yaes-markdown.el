;;; yaes-markdown --- MarkDown related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'req-package)

(defconst yaes-markdown-command "markdown")

(req-package markdown-mode
  :if (and
       (version<= "24" emacs-version)
       (executable-find yaes-markdown-command))
  :mode
  ("\\.md\\'" . gfm-mode)
  ("\\.markdown\\'" . markdown-mode)
  :init
  (setq markdown-command yaes-markdown-command))

(req-package flymd
  :require (markdown-mode cl-lib)
  :commands (flymd-flyit))

(req-package markdown-toc
  :require (s dash markdown-mode)
  :commands (markdown-toc-generate-toc)
  :init
  (defun markdown-imenu-create-index ()
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
        (cdr root))))
  :config
  (setq 'markdown-toc-header-toc-title "## Table of Contents ##"))

(provide 'yaes-markdown)
;;; yaes-markdown.el ends here

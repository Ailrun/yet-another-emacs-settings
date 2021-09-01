;;; tutch-mode --- Major mode for Tutch proof assistant
;;;
;;; Commentary:
;;;
;;; Code:

(require 'comint)

(defgroup tutch nil
  "Major mode for editing Tutch programs."
  :group 'languages
  :prefix "tutch-")

(defcustom tutch-compile-command "tutch"
  "Command to compile tutch program"
  :group 'tutch
  :type '(string))

(define-abbrev-table 'tutch-mode-abbrev-table ()
  "Abbrev table for Tutch mode.")

(defun tutch-compile-current ()
  (interactive)
  (if (buffer-modified-p (current-buffer))
      (message "The current buffer has not been modified since saved. Please save the buffer.")
    (save-buffer)
    (let ((filename (buffer-file-name)))
      (call-process "tutch" nil "*tutch-compile*" t filename)
      (display-buffer "*tutch-compile*"))))

(defun tutch-check-current-against (reqname)
  (interactive "fRequirement file: ")
  (if (buffer-modified-p (current-buffer))
      (message "The current buffer has not been modified since saved. Please save the buffer.")
    (save-buffer)
    (let ((filename (buffer-file-name)))
      (call-process "tutch" nil "*tutch-compile*" t filename "-r" reqname)
      (display-buffer "*tutch-compile*"))))

(defun tutch-indent-line ()
  "Indent current line as tutch code"
  (interactive)
  (beginning-of-line)
  (let ((indent 0)
        (close (looking-at "^[[:space:]]*[])]")))
	(save-excursion 
	  (ignore-errors
		(backward-up-list)
		(if close
            (setq indent (current-column))
		  (forward-char)
		  (re-search-forward "[^[:space:]]")
		  (backward-char)
		  (setq indent (current-column)))))
	(indent-line-to indent)))

(defvar tutch-mode-syntax-table
  (let ((table (make-syntax-table prog-mode-syntax-table)))
    (modify-syntax-entry ?\s " " table)
    (modify-syntax-entry ?\% "< 14" table)
    (modify-syntax-entry ?\n ">" table)
    (modify-syntax-entry ?\{ ". 2b" table)
    (modify-syntax-entry ?\} ". 3b" table)
    (modify-syntax-entry ?\[ "(" table)
    (modify-syntax-entry ?\] ")" table)
    (modify-syntax-entry ?\; "." table)
    table)
  "Syntax table used in `tutch-mode'")

(defconst tutch-font-lock-keywords
  (list
   "case"
   "of"
   "end"
   "fn"
   "rec"
   "if"
   "then"
   "else"
   "proof"
   "begin"
   "annotated"
   "term"
   "val"
   "classical"
   "let"
   "in"

   "nat"
   "bool"
   "list"
   "T"
   "F"
   ))

(defconst tutch-font-lock-constants
  (list
   "fst"
   "snd"
   "inl"
   "inr"
   "s"
   "true"
   "false"
   "nil"
   ;; "::" is not here as it is a symbol
   "eq0"
   "eqS"
   "eqE0S"
   "eqES0"
   "eqESS"
   "less0"
   "lessS"
   "lessE0"
   "lessES"
   "eqN"
   "eqC"
   "eqENC"
   "eqECN"
   "eqECC"
   ))

(defconst tutch-font-lock-binding-forms
  (list
   "fn"
   "proof"
   "term"
   "val"

   ;; "[" is not here as it is a symbol

   ;; "case" and "rec" are not here as its syntax is
   ;; a bit complex to parse with regex
   ))

(defconst tutch-font-lock-keywords
  (list
   ;; Keywords
   `( ,(rx-to-string `(and
                       symbol-start
                       (eval `(or ,@tutch-font-lock-keywords))
                       symbol-end)
                     t)
      .
      font-lock-keyword-face)

   `( ,(rx symbol-start
           "abort"
           symbol-end)
      .
      font-lock-warning-face)

   ;; Constants definition 
   `( ,(rx-to-string `(and
                       symbol-start
                       (eval `(or ,@tutch-font-lock-constants))
                       symbol-end)
                     t)
      .
      font-lock-constant-face)

   `( ,(rx "::")
      .
      font-lock-constant-face)

   ;; Bound variables
   `( ,(rx-to-string `(and
                       symbol-start
                       (eval `(or ,@tutch-font-lock-binding-forms))
                       (+ space)
                       (group (+ (or alnum ?_)))
                       symbol-end)
                     nil)
      (1 font-lock-variable-name-face))

   ;; Hypothetical definition 
   `( ,(rx "["
           (* space)
           (group (+ (or alnum ?_)))
           (* space)
           ":")
      (1 font-lock-variable-name-face))
   ))

(defvar tutch-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-c C-c") #'tutch-compile-current)
    (define-key map (kbd "C-c C-l") #'tutch-check-current-against)
    map)
  "Keymap for Tutch mode.")

(define-derived-mode tutch-mode prog-mode "Tutch"
  "Major mode for editing Tutch code"
  :syntax-table tutch-mode-syntax-table
  (setq-local font-lock-defaults '(tutch-font-lock-keywords))
  (setq-local indent-line-function #'tutch-indent-line)
  (setq-local comment-start "%")
  (setq-local comment-start-skip "% +"))

(add-to-list 'auto-mode-alist '("\\.tut\\'" . tutch-mode))
(add-to-list 'auto-mode-alist '("\\.req\\'" . tutch-mode))
(add-to-list 'interpreter-mode-alist '("tutch" . tutch-mode))

(provide 'tutch-mode)

;;; tutch-mode.el ends here

;;; yaes-installable-init --- initializations of installable packages of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'f)
(require 'load-dir)

(defconst yaes-installable-dir
  (f-dirname (f-this-file))
  "YAES installable package directory.
Those are installable via package manager.")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;; Editor Design
;;;;
;;;; 1. Theme
;;;; 2. Frame Design
;;;; 3. Buffer Design
;;;; 4. Font Setting
;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defconst yaes-editor-design-dir
  (f-join yaes-installable-dir "yaes-editor-design")
  "YAES editor design package directory.")

(load-dir-one yaes-editor-design-dir)

(unintern 'yaes-editor-design-dir nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;; Editing functionality extensions
;;;;
;;;; 1. Autocompletion
;;;; 2. Syntax Checker
;;;; 3. Snippets
;;;; 4. Misc (undo, parentheses, ...)
;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defconst yaes-editing-functionality-dir
  (f-join yaes-installable-dir "yaes-editing-functionality")
  "YAES editing functionality package directory.")

(load-dir-one yaes-editing-functionality-dir)

(unintern 'yaes-editing-functionality-dir nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;; Developing Tools
;;;;
;;;; 1. Version Control
;;;; 2. Project Management
;;;; 3. Tagging
;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defconst yaes-developing-tool-dir
  (f-join yaes-installable-dir "yaes-developing-tool")
  "YAES developing tools package directory.")

(load-dir-one yaes-developing-tool-dir)

(unintern 'yaes-developing-tool-dir nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;; Languages Support
;;;;
;;;; 1. Programming Languages
;;;; 2. Script Languages
;;;; 3. Markup Languages
;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defconst yaes-languages-support-dir
  (f-join yaes-installable-dir "yaes-languages-support")
  "YAES languages support package directory.")

(load-dir-one yaes-languages-support-dir)

(unintern 'yaes-languages-support-dir nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;; Cleanup
;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(unintern 'yaes-installable-dir nil)

(provide 'yaes-installable-init)
;;; yaes-installable-init.el ends here

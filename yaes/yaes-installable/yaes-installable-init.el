;;; yaes-installable-init --- initializations of installable packages of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'f)
(require 'load-dir)

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;; Editing functionality extensions
;;;;
;;;; 1. Autocompletion
;;;; 2. Syntax Checker
;;;; 3. Snippets
;;;; 4. Misc (undo, parenthesis, ...)
;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defconst yaes-editing-functionality-dir
  (f-join yaes-installable-dir "yaes-editing-functionality")
  "YAES editing functionality package directory.")

(load-dir-one yaes-editing-functionality-dir)

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

(provide 'yaes-installable-init)
;;; yaes-installable-init.el ends here

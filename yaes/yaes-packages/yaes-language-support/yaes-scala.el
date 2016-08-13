;;; yaes-scala --- scala support of yaes
;;;
;;; Commentary:
;;;
;;; Code:
(require 'req-package)

;; Major mode of scala
(req-package scala-mode
  ;; required emacs version : ???
  :mode ("\\.scala\\'" . scala-mode))

;; Maybe there are some other modes like ensime and sbt-mode...

(provide 'yaes-scala)
;;; yaes-scala.el ends here

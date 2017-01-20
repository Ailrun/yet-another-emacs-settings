;;; yaes-external-init --- initializations of external packages of yaes
;;;
;;; Commentary:
;;;
;;; Code:
(require 'f)

(defconst yaes-external-dir
  (f-dirname (f-this-file)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;; Proof General
;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defconst yaes-pg-load-path (f-join yaes-external-dir "ProofGeneral/generic"))

(if (file-directory-p yaes-pg-load-path)
    (add-to-list 'load-path yaes-pg-load-path))
(if (require 'proof-site nil t)
    (setq proof-assistants '(coq))
  (message "No Installed Proof General!"))

(provide 'yaes-external-init)
;;; yaes-external-init.el ends here

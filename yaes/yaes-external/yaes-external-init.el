;;; yaes-external-init --- initializations of external packages of yaes
;;;
;;; Commentary:
;;;
;;; Code:
(require 'f)

(defvar-local pg-clone-path (f-join (f-dirname (f-this-file)) "ProofGeneral"))
(defvar-local pg-load-path (f-join pg-clone-path "generic/proof-site"))

(if (file-directory-p pg-clone-path)
    (load pg-load-path))

(provide 'yaes-external-init)
;;; yaes-external-init.el ends here

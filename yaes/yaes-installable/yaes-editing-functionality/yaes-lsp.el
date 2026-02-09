;;; yaes-lsp --- Language Server Protocol related package setting of yaes
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package lsp-mode
  :if (version<= "25.1" emacs-version)
  :after (markdown-mode)
  :functions (lsp-booster--advice-json-parse lsp-booster--advice-final-command)
  :commands (lsp lsp-deferred)
  :diminish (lsp-mode lsp-lens-mode)
  :hook
  (dired-mode . lsp-dired-mode)
  :custom
  (lsp-prefer-flymake nil)
  (lsp-lens-enable t)
  (lsp-modeline-code-actions-segments '(icon))
  (lsp-semantic-tokens-enable t)
  (lsp-semantic-tokens-honor-refresh-requests t)
  :init
  (defun lsp-booster--advice-json-parse (old-fn &rest args)
    "Try to parse bytecode instead of json."
    (or
     (when (equal (following-char) ?#)
       (let ((bytecode (read (current-buffer))))
         (when (byte-code-function-p bytecode)
           (funcall bytecode))))
     (apply old-fn args)))
  (defun lsp-booster--advice-final-command (old-fn cmd &optional test?)
    "Prepend emacs-lsp-booster command to lsp CMD."
    (let ((orig-result (funcall old-fn cmd test?)))
      (if (and (not test?)                             ;; for check lsp-server-present?
               (not (file-remote-p default-directory)) ;; see lsp-resolve-final-command, it would add extra shell wrapper
               lsp-use-plists
               (not (functionp 'json-rpc-connection))  ;; native json-rpc
               (executable-find "emacs-lsp-booster"))
          (progn
            (when-let ((command-from-exec-path (executable-find (car orig-result))))  ;; resolve command from exec-path (in case not found in $PATH)
              (setcar orig-result command-from-exec-path))
            (message "Using emacs-lsp-booster for %s!" orig-result)
            (cons "emacs-lsp-booster" orig-result))
        orig-result)))
  :config
  (advice-add (if (progn (require 'json)
                         (fboundp 'json-parse-buffer))
                  'json-parse-buffer
                'json-read)
              :around
              #'lsp-booster--advice-json-parse)
  (advice-add 'lsp-resolve-final-command :around #'lsp-booster--advice-final-command))

(use-package lsp-ui
  :if (version<= "25.1" emacs-version)
  :after (lsp-mode markdown-mode)
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-alignment 'window)
  (lsp-ui-doc-position 'top)
  (lsp-ui-doc-show-with-cursor t)
  (lsp-ui-sideline-enable nil))

(use-package lsp-origami
  :after (lsp-mode)
  :commands (lsp-origami-mode lsp-origami-try-enable)
  :diminish (lsp-origami-mode)
  :hook
  (lsp-after-open . lsp-origami-try-enable))

(provide 'yaes-lsp)
;;; yaes-lsp.el ends here

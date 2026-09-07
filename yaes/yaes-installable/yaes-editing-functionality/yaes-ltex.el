;;; yaes-ltex --- LanguageTool related package setting of yaes -*- lexical-binding: t -*-
;;;
;;; Commentary:
;;;
;;; Code:

(require 'use-package)

(use-package lsp-ltex
  :after (lsp)
  :custom
  (lsp-ltex-plus-check-frequency "save")
  (lsp-ltex-plus-language "en-CA"))

(provide 'yaes-ltex)
;;; yaes-ltex.el ends here

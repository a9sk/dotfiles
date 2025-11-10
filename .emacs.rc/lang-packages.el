;; lang-packages

(rc/require 'lsp-mode)      ;; language server support
(rc/require 'company)       ;; autocompletion
(rc/require 'flycheck)      ;; syntax checking

;; golang packages
(rc/require 'go-mode)       ;; major mode for go
(rc/require 'go-eldoc)      ;; inline documentation

;; c/c++ packages
(rc/require 'cc-mode)
(rc/require 'clang-format)

;; js packages
;; javascript / web packages
(rc/require 'js2-mode)        ;; better js major mode
(rc/require 'rjsx-mode)       ;; react + jsx support
(rc/require 'web-mode)        ;; html, css, js embedded
;; (rc/require 'tide)            ;; typescript / js LSP / completion
(rc/require 'prettier-js)     ;; code formatting

;; v packages
(rc/require 'v-mode)       ;;  major mode for vlang

;; docker packages
(rc/require 'dockerfile-mode)     ;; dockerfile major mode
(rc/require 'yaml-mode)           ;; yaml major mode (for docker-compose)

;; json packages
(rc/require 'json-mode)           ;; json major mode

;; Language package declarations (kept minimal to avoid duplication)

;; Core language tooling (LSP is used across languages)
(use-package lsp-mode)

;; Go
(use-package go-mode)
(use-package go-eldoc)

;; C/C++
(use-package cc-mode)
(use-package clang-format)

;; Note:
;; - JS/TS use tree-sitter modes configured in lang-js-new.el
;; - Docker/YAML/JSON/Rust/TOML packages are configured in lang-others.el
;; - Company and Flycheck are configured globally in packages.el and via rc/prog-base-setup

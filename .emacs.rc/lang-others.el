;; Docker and Docker Compose setup
(use-package dockerfile-mode
  :ensure t
  :mode ("Dockerfile\\'" . dockerfile-mode))

(use-package yaml-ts-mode
  :mode ("\\.ya?ml\\'" . yaml-ts-mode)
  :hook (yaml-ts-mode . lsp)
  :init (setq treesit-font-lock-level 4))

;; Rust language config
(use-package rust-mode
  :ensure t
  :mode ("\\.rs\\'" . rust-mode)
  :hook (rust-mode . lsp-deferred)
  :config
  (setq rust-format-on-save t))

(use-package cargo)

;; TOML language config
(use-package toml-mode)

;; JSON language config
(use-package json-mode)

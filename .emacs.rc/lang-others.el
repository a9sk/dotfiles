;; Docker and Docker Compose setup
(use-package dockerfile-mode
  :ensure t
  :mode ("Dockerfile\\'" . dockerfile-mode))

(use-package yaml-mode
  :ensure t
  :mode ("docker-compose[^/]*\\.ya?ml\\'" . yaml-mode))

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

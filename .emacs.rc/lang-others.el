;; Docker and Docker Compose setup
(use-package dockerfile-mode
  :ensure t
  :mode ("Dockerfile\\'" . dockerfile-mode))

(use-package yaml-mode
  :ensure t
  :mode ("docker-compose[^/]*\\.ya?ml\\'" . yaml-mode))

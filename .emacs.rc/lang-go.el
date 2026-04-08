;; go language config

;; enable generic tools for go
;; golang setup
(defun rc/go-module-root ()
  "Return nearest Go workspace root (go.work/go.mod), or nil."
  (or (locate-dominating-file default-directory "go.work")
      (locate-dominating-file default-directory "go.mod")))

(add-hook 'go-mode-hook
          (lambda ()
            (let ((root (rc/go-module-root)))
              ;; Force buffer-local root before LSP starts.
              (when root
                (setq-local default-directory root))
              ;; Start LSP only when inside a go.mod/go.work project.
              (when (fboundp 'rc/prog-base-setup)
                (rc/prog-base-setup (not root)))
              (unless root
                (message "Go: no go.mod/go.work found; skipping gopls.")))
            (rc/add-before-save #'gofmt-before-save)))

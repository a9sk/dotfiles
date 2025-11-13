;; helper to require a package or install if missing
(defun rc/require (pkg)
  "Ensure PKG is installed and required."
  (unless (package-installed-p pkg)
    (package-refresh-contents)
    (package-install pkg))
  (require pkg))

;; helper for themes
(defun rc/require-theme (theme)
  (load-theme theme t))

;; reload theme from M-x
(defun rc/reload-theme ()
  "Reload current theme (defaults to gruber-darker)."
  (interactive)
  (when (custom-theme-enabled-p 'gruber-darker)
    (disable-theme 'gruber-darker))
  (load-theme 'gruber-darker t))

;; replace selected text when typing
(delete-selection-mode 1)

;; enable clipboard and primary
(setq select-enable-clipboard t)
(setq select-enable-primary t)

;; Common programming setup used by language hooks
(defun rc/prog-base-setup ()
  "Enable common minor modes for programming buffers."
  (when (fboundp 'lsp-deferred) (lsp-deferred))
  (when (fboundp 'company-mode) (company-mode 1))
  (when (fboundp 'flycheck-mode) (flycheck-mode 1))
  (when (fboundp 'yas-minor-mode) (yas-minor-mode 1)))

;; Helper to add buffer-local before-save hook
(defun rc/add-before-save (fn)
  "Add FN to `before-save-hook' locally in current buffer."
  (add-hook 'before-save-hook fn nil t))

;; Pick a sensible shell across OSes
(defun rc/system-shell ()
  "Return a sensible shell path/command depending on `system-type'."
  (cond
   ((eq system-type 'windows-nt)
    (or (executable-find "pwsh")
        (executable-find "powershell.exe")
        (executable-find "bash.exe")
        (getenv "COMSPEC")
        "powershell.exe"))
   (t (or (executable-find "bash")
          (executable-find "zsh")
          (getenv "SHELL")
          "/bin/bash"))))

(provide 'rc)

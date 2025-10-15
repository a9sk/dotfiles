;; helper to require a package or install if missing
(defun rc/require (pkg)
  (unless (package-installed-p pkg)
    (package-refresh-contents)
    (package-install pkg))
  (require pkg))

;; helper for themes
(defun rc/require-theme (theme)
  (load-theme theme t))

;; reload theme from M-x
(defun rc/reload-theme ()
  "reload current theme"
  (interactive)
  (disable-theme 'gruber-darker)
  (load-theme 'gruber-darker t))


(defvar my/vterm-buffer-name "*vterm*"
  "Name of the vterm buffer used for toggle.")

(defvar my/vterm-window nil
  "Window object used to display the vterm buffer.")

(defun my/toggle-vterm-bottom ()
  "Toggle vterm in a bottom split window with fixed height, starting at $HOME.
Safely handles missing vterm (e.g., on unsupported platforms)."
  (interactive)
  (if (not (featurep 'vterm))
      (if (require 'vterm nil t)
          (message "Loaded vterm")
        (user-error "vterm is not available on this Emacs/platform")))
  (let* ((bufname my/vterm-buffer-name)
         (buf (get-buffer bufname)))
    (if (and buf my/vterm-window (window-live-p my/vterm-window))
        (progn
          (delete-window my/vterm-window)
          (setq my/vterm-window nil))
      (let ((bottom-window (split-window (frame-root-window) -15 'below))
            (default-directory (expand-file-name "~/")))
        (setq my/vterm-window bottom-window)
        (select-window bottom-window)
        (if (buffer-live-p buf)
            (switch-to-buffer buf)
          (vterm bufname))
        (set-window-dedicated-p bottom-window t)
        (select-window bottom-window)))))

(global-set-key (kbd "C-c t") #'my/toggle-vterm-bottom)

(defun my/yaml-colors ()
  "Custom colors for YAML only."
  (face-remap-add-relative 'treesit-face-keyword   '(:foreground "#ffb964")) ;; keys: orange
  (face-remap-add-relative 'treesit-face-field     '(:foreground "#ffb964")) ;; ts field == key
  (face-remap-add-relative 'treesit-face-property  '(:foreground "#ffb964"))
  (face-remap-add-relative 'treesit-face-string    '(:foreground "#85c54c")) ;; values: green
  (face-remap-add-relative 'treesit-face-number    '(:foreground "#e4a0f2")) ;; numbers: magenta
  (face-remap-add-relative 'treesit-face-constant  '(:foreground "#6fcbdc"))) ;; true/false/null

(add-hook 'yaml-ts-mode-hook #'my/yaml-colors)

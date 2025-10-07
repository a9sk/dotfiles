;; contains eshell toggling and aliases

;; load paths from paths.el
(require 'paths)

;; define my-toggle-eshell function for eshell toggle (i had it in vscode)
(defun my-toggle-eshell-bottom ()
  "Toggle eshell in a bottom split window with fixed height, starting at Desktop."
  (interactive)
  (let* ((bufname "*eshell*")
         (buf (get-buffer bufname))
         (dir my-desktop))
    (if buf
        (let ((win (get-buffer-window buf)))
          (if win
              (delete-window win)
            (let ((bottom-window (split-window (frame-root-window) -15 'below)))
              (set-window-buffer bottom-window buf)
              (select-window bottom-window)
              (with-current-buffer buf
                (eshell/cd dir)))))
      ;; create buffer
      (let ((bottom-window (split-window (frame-root-window) -15 'below)))
        (eshell bufname)
        (set-window-buffer bottom-window bufname)
        (select-window bottom-window)
        (with-current-buffer bufname
          (eshell/cd dir))))))


;; bind C+ò -> my-toggle-eshell-bottom
(global-set-key (kbd "C-ò") 'my-toggle-eshell-bottom)

;; alias `clear` in eshell to eshell/clear (built in) to avoid line duplication
(defun my-eshell-clear-alias ()
  "Alias 'clear' to 'eshell/clear' in eshell."
  (eshell/alias "clear" "eshell/clear"))
(add-hook 'eshell-mode-hook 'my-eshell-clear-alias)

;;;;;;;;;;;;;;;
(provide 'eshell-config)

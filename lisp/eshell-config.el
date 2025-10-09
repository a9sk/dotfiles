;; contains eshell toggling and aliases

;; load paths from paths.el
(require 'paths)

;; this code defines a function to toggle eshell at the bottom of the screen, conflicts with shell-config.el
;; (so i commented it out for now, but might want to reenable it later)
;;
;; ;; define my-toggle-eshell function for eshell toggle (i had it in vscode)
;; (defun my-toggle-eshell-bottom ()
;;   "Toggle Eshell at bottom, reuse existing window."
;;   (interactive)
;;   (let* ((buf (get-buffer-create "*eshell*"))
;;          (win (get-buffer-window buf)))
;;     (if win
;;         (delete-window win)
;;       (let ((bottom (split-window (frame-root-window) -15 'below)))
;;         (select-window bottom)
;;         (switch-to-buffer buf)
;;         (unless (eq major-mode 'eshell-mode)
;;           (eshell-mode))
;;         (eshell/cd my-desktop)
;;         (eshell-send-input))))) ;;

;; ;; bind C+ò -> my-toggle-eshell-bottom
;; (global-set-key (kbd "C-ò") 'my-toggle-eshell-bottom)

;; enable ANSI colors in eshell
(add-hook 'eshell-mode-hook 'ansi-color-for-comint-mode-on)

;; alias `clear` in eshell to eshell/clear (built in) to avoid line duplication
(defun my-eshell-clear-alias ()
  "Alias 'clear' to 'eshell/clear' in eshell."
  (eshell/alias "clear" "eshell/clear"))
  
(add-hook 'eshell-mode-hook 'my-eshell-clear-alias)

;;;;;;;;;;;;;;;
(provide 'eshell-config)

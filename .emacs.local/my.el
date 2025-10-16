
(defvar my/vterm-buffer-name "*vterm*"
  "name of the vterm buffer used for toggle.")

(defvar my/vterm-window nil
  "window object used to display the vterm buffer.")

(defun my/toggle-vterm-bottom ()
  "Toggle vterm in a bottom split window with fixed height, starting at `~`."
  (interactive)
  (let* ((bufname my/vterm-buffer-name)
         (buf (get-buffer bufname))
         ;;(dir "~/")
	 )
    (if (and buf my/vterm-window (window-live-p my/vterm-window))
        ;; delete if exists
        (progn
          (delete-window my/vterm-window)
          (setq my/vterm-window nil))
      ;; create bottom split
      (let ((bottom-window (split-window (frame-root-window) -15 'below)))
        (setq my/vterm-window bottom-window)
        (select-window bottom-window)
        (if buf
            (switch-to-buffer buf)
          (vterm bufname))
        ;; cd to dir
        (vterm-send-string (concat "cd " dir))
        (vterm-send-return)
        (set-window-dedicated-p bottom-window t)
        (select-window (bottom-window))))))

(global-set-key (kbd "C-c t") 'my/toggle-vterm-bottom)

;; helper to open same terminal buffer everytime
(defun my/open-terminal ()
  "Open or switch to vterm in a bottom split."
  (interactive)
  (let ((vterm-buffer (get-buffer "*vterm*")))
    (unless (window-live-p (get-buffer-window vterm-buffer))
      (split-window-below)
      (other-window 1))
    (if vterm-buffer
        (switch-to-buffer vterm-buffer)
      (vterm)))) 

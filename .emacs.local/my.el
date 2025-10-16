;; helper to open same terminal buffer everytime
(defun my/open-terminal ()
  (interactive)
  (if (get-buffer "*vterm*")
      (switch-to-buffer "*vterm*")
    (vterm)))


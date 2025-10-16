;; misc settings

;; set the default shell to /bin/bash
(setq shell-file-name "/bin/bash")
(setq vterm-shell shell-file-name)

;; BINDS

;; bind C-c ' to `
;; (yes, they are different)
;; note: this is only useful on my italian keyboard which does not have the
;;       character built in.
(define-key global-map (kbd "C-c '")
	    (lambda () (interactive) (insert "`")))

;; bind C-arrowleft and C-arrowright to move of a full word
;; this was overwritten by paredit in paredit-mode
(with-eval-after-load 'paredit
  (define-key paredit-mode-map (kbd "C-<left>") 'backward-word)
  (define-key paredit-mode-map (kbd "C-<right>") 'forward-word))

;; bind the backtab to undent 4 spaces (one tab in my config)
;; note: backtab is shift-tab on my pc
(global-set-key (kbd "<backtab>")
		(lambda () (interactive)
		  (if (use-region-p)
		      (indent-rigidly (region-beginning) (region-end) -4)
		    (indent-for-tab-command))))

;; bind C-c t to open vterm terminal
;; (global-set-key (kbd "C-c t") 'term-toggle)



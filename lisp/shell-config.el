;; contains shell/WSL/eshell configs

;; load paths from paths.el
(require 'paths)

;; reenable if path conversion issues come up
;; (setq wsl-path-convert t)

;; msys2 bash instead of wsl/powershell
(setq explicit-shell-file-name my-msys2-bash)
(setq shell-file-name "bash")
(setq explicit-bash.exe-args '("--login" "-i"))

;; set PATH so emacs can find msys2 binaries
(setenv "PATH"
        (concat
         my-msys2-usr-bin ";"
         my-msys2-ucrt-bin ";"
         (getenv "PATH")))

(add-to-list 'exec-path my-msys2-usr-bin)
(add-to-list 'exec-path my-msys2-ucrt-bin)

;; trick msys2 into thinking it is a real terminal
(add-hook 'shell-mode-hook
          (lambda ()
            (setenv "TERM" "xterm-256color")
            (ansi-color-for-comint-mode-on)))

;; try to use WSL as shell
;; (when (not (file-exists-p my-wsl-exe))
;;  (message "Warning: WSL not found, falling back to cmd"))
;; (setq explicit-shell-file-name my-wsl-exe)
;; (setq shell-file-name "bash")
;; (setq explicit-bash.exe-args '("--login" "-i"))

;; enable ANSI colors in shell, prevent ugly wrapping and scroll stuff
(add-hook 'shell-mode-hook
          (lambda ()
            (ansi-color-for-comint-mode-on)
            (setq truncate-lines t) ;; prevents ugly wrapping
            (setq comint-output-filter-functions
                  (remove 'ansi-color-process-output comint-output-filter-functions))
            ;; force prompt regexp to avoid issues with line duplication
            ;; (setq comint-prompt-regexp "^[^#$\n]*[#$] ")))
            (setq comint-scroll-to-bottom-on-input t)
            (setq comint-scroll-show-maximum-output t)))


;; add hook to make wsl shell look better (to fix (it sucks))
(add-hook 'shell-mode-hook
          (lambda ()
            (visual-line-mode -1)
            (setq truncate-lines nil)))

;; use arrow keys to navigate shell history
(add-hook 'shell-mode-hook
          (lambda ()
            (define-key shell-mode-map (kbd "<up>") 'comint-previous-input)
            (define-key shell-mode-map (kbd "<down>") 'comint-next-input)))

;; define my-toggle-shell-bottom function for shell toggle (i had it in vscode)
(defun my-toggle-shell-bottom ()
  "Toggle Shell at bottom, reuse existing window."
  (interactive)
  (let* ((buf (get-buffer-create "*shell*"))
         (win (get-buffer-window buf)))
    (if win
        (delete-window win)
      (let ((bottom (split-window (frame-root-window) -15 'below)))
        (select-window bottom)
        (switch-to-buffer buf)
        (unless (eq major-mode 'shell-mode)
          (shell-mode))
        (shell/cd my-desktop)
        (shell-send-input))))) ;;

;; bind C+ò -> my-toggle-shell-bottom
(global-set-key (kbd "C-ò") 'my-toggle-shell-bottom)


;; make clear actually work with C-l
(defun my-comint-clear-buffer ()
  "Clear the current shell buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)
    (comint-send-input)))

(add-hook 'shell-mode-hook
          (lambda ()
            (local-set-key (kbd "C-l") 'my-comint-clear-buffer)))

;;;;;;;;;;;;;
(provide 'shell-config)

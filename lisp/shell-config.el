;; contains shell/WSL/eshell configs

;; load paths from paths.el
(require 'paths)

;; try to use WSL as shell
(setq explicit-shell-file-name my-wsl-exe)
(setq shell-file-name "bash")
(setq explicit-bash.exe-args '("--login" "-i"))

;; enable ANSI colors in shell
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; add hook to make wsl shell look better (to fix (it sucks))
(add-hook 'shell-mode-hook
          (lambda ()
            (visual-line-mode -1)
            (setq truncate-lines nil)))

;;;;;;;;;;;;;
(provide 'shell-config)

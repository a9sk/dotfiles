;; vlang language config

;; enable generic stuff for v
(add-hook 'v-mode-hook
    (lambda ()
      (when (fboundp 'rc/prog-base-setup) (rc/prog-base-setup))
      ;; format via `v fmt -w` then reload buffer
      (rc/add-before-save
       (lambda ()
         (when (and buffer-file-name (eq major-mode 'v-mode))
           (shell-command (format "v fmt -w %s" (shell-quote-argument buffer-file-name)))
           (revert-buffer t t t))))))

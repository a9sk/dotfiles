;; contains ui (theme, font, modeline, etc...)

;; load paths from paths.el
(require 'paths)

;; add gruber-darker theme path and load it
(add-to-list 'custom-theme-load-path
             (expand-file-name "themes/gruber-darker-theme" user-emacs-directory))

(load-theme 'gruber-darker t)

;; set the default font
;; (set-face-attribute 'default nil
;;                     :font "Fira Code Retina"
;;                     :height 110)


;; all-the-icons (doom-modeline uses it)
;; (use-package all-the-icons
;;   :ensure t)

;; doom-modeline (modern bottom bar)
;; (use-package doom-modeline
;;  :init (doom-modeline-mode 1)
;;  :custom ((doom-modeline-height 15)))

;; set fringe background to #whatever
;; (set-face-background 'fringe "#ffffff")

;; on windows, this sets frame border color to #whatever
;; (set-face-attribute 'internal-border nil :background "#444444")

;;;;;;;;;;;;;
(provide 'ui)

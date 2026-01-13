;; simple ui tweaks
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(column-number-mode 1)
(show-paren-mode 1)
(global-display-line-numbers-mode t)

;; remove os bell
(setq ring-bell-function 'ignore)

;; font depending on os (single place)
(defun rc/default-font ()
  (cond
   ((eq system-type 'windows-nt) "Consolas-13")
   ((eq system-type 'gnu/linux) "Iosevka Nerd Font-20")
   (t "Monospace-20")))

(setf (alist-get 'font default-frame-alist)
      (rc/default-font))

;; load theme
;; "~/dotfiles/themes/amaranth-dark-theme"
(add-to-list 'custom-theme-load-path "~/dotfiles/themes/amaranth-dark-theme")
(load-theme 'amaranth-dark t)
;; (add-to-list 'custom-theme-load-path "~/dotfiles/themes/gruber-darker-theme")
;; (load-theme 'gruber-darker t)


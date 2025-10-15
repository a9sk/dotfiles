;; simple ui tweaks
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(column-number-mode 1)
(show-paren-mode 1)

;; remove os bell
(setq ring-bell-function 'ignore)

;; font depending on os
(defun rc/default-font ()
  (cond
   ((eq system-type 'windows-nt) "consolas-13")
   ((eq system-type 'gnu/linux) "iosevka-20")))

(add-to-list 'default-frame-alist `(font . ,(rc/default-font)))

;; load theme
(add-to-list 'custom-theme-load-path
             "~/dotfiles/themes/gruber-darker-theme")
(load-theme 'gruber-darker t)


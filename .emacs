;; Set Color Theme
(load-theme 'wombat)
;; Set Memory Constraints
(setq gc-cons-threshold 50000000)
(setq large-file-warning-threshold 100000000)
;; Use UTF-8 by Default
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; Visual Options
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)
(global-hl-line-mode +1)
(line-number-mode +1)
(if (version<= "26.0.50" emacs-version)
    ;; On Newer emacs (>= 26.0.50), Use line-numbers-mode
    (global-display-line-numbers-mode 1)
  ;; Otherwise, Use linum-mode
  (global-linum-mode 1))
(column-number-mode t)
(size-indication-mode t)
;; Modify Temporary File Directory
(setq backup-directory-alist
        `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
        `((".*" ,temporary-file-directory t)))
;; Accept y and n
(fset 'yes-or-no-p 'y-or-n-p)
;; Automatically reload files
(global-auto-revert-mode t)

;; Default global configuration
;; (set-frame-font "Source Code Pro for Powerline-14") ;; Default font and font size
(set-frame-font "PT Mono-15") ;; Default font and font size
(setq-default line-spacing 8) ;; Set line spacing
(setq scroll-margin 5) ;; Margin when scrolling should occur

;; Start in fullscreen
;; (set-frame-parameter nil 'fullscreen 'fullboth)


;; Unicode settings
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq buffer-file-coding-system 'utf-8)
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
(setq system-uses-terminfo nil)
;; Split horizontaly by default
(setq split-height-threshold 0)
(setq split-width-threshold nil)

(hl-line-mode -1)
(global-hl-line-mode -1)
(setq require-final-newline t) ;; Require new line at the end of file
(global-visual-line-mode t) ;; Nicely wrap text
(setq-default truncate-lines t) ;; Turn off word-wrap
(setq truncate-partial-width-windows t)
(delete-selection-mode t) ;; Delete selection on write
(show-paren-mode t) ;; Higlight matching brackets
(setq-default show-trailing-whitespace t)
(global-auto-revert-mode t) ;; Automatically refresh buffers
(setq auto-save-default nil) ;; Autosave files
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )

;; Setup winner-mode
(winner-mode 1)

(display-time)
(setq inhibit-startup-message t) ;; Get rid of the default startup message
(setq-default indent-tabs-mode nil) ;; No tabs, just spaces
(global-linum-mode -1) ;; Turn on line numbers in the gutter
(column-number-mode 1) ;; Show column number
(defalias 'list-buffers 'ibuffer) ;; Set ibuffer as a default buffer list
(fringe-mode 16) ;;fringe
(setq ring-bell-function (lambda () ())) ;; Disable ringtone
(defalias 'yes-or-no-p 'y-or-n-p)
(xterm-mouse-mode t)

;; Better scrolling
(setq scroll-conservatively 9999
      scroll-preserve-screen-position t)

;; Enable multi major mode
;; (require 'mmm-auto)
;; (setq mmm-global-mode 'auto)
;; (mmm-add-mode-ext-class 'html-erb-mode nil 'html-js)
;; (mmm-add-mode-ext-class 'html-erb-mode nil 'html-css)
;; (mmm-add-mode-ext-class 'html-erb-mode "\\.html\\.erb\\'" 'erb)
;; (mmm-add-mode-ext-class 'html-erb-mode "\\.jst\\.ejs\\'" 'ejs)
;; (mmm-add-mode-ext-class 'html-erb-mode "\\.jst\\.eco\\'" 'erb)

(provide 'setup-defaults)

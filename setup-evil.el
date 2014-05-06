(require 'evil)
(evil-mode 1)

(setq evil-emacs-state-cursor  '("red" box))
(setq evil-normal-state-cursor '("yellow" box))
(setq evil-visual-state-cursor '("green" box))
(setq evil-insert-state-cursor '("yellow" bar))
(setq evil-motion-state-cursor '("gray" box))

(setq evil-default-cursor t)

(require 'evil-numbers)

;; To not miss surround mode
(require 'surround)
(global-surround-mode t)
(global-auto-revert-mode t)

(require 'evil-matchit)
(global-evil-matchit-mode 1)

;; Set evil indentation behaviour
(setq evil-shift-width 2)
(add-hook 'ruby-mode-hook
  (function (lambda ()
          (setq evil-shift-width ruby-indent-level))))
(add-hook 'haml-mode-hook
  (function (lambda ()
          (setq evil-shift-width ruby-indent-level))))
(add-hook 'web-mode-hook
  (function (lambda ()
          (setq evil-shift-width ruby-indent-level))))

(add-hook 'js2-mode-hook
  (function (lambda ()
          (setq evil-shift-width ruby-indent-level))))

;; Custom commands
(evil-ex-define-cmd "gs" 'magit-status)
(evil-ex-define-cmd "glf" 'magit-file-log)
(evil-ex-define-cmd "gl" 'magit-log)
(evil-ex-define-cmd "gb" 'magit-blame-mod)
(evil-ex-define-cmd "jbc" 'jabber-connect-all)
(evil-ex-define-cmd "chat" 'jabber-chat-with)

;; Disable evil for certain major-modes
(dolist (mode '(eshell-mode shell-mode term-mode terminal-mode comint-mode skewer-repl-mode
                profiler-report-mode
                erc-mode weechat-mode
                direx:direx-mode
                makey-key-mode
                jabber-roster-mode
                magit-blame-mode
                project-explorer-mode))
  (evil-set-initial-state mode 'emacs))

;; Set initial mode to insert
(evil-set-initial-state 'git-commit-mode 'insert)
(evil-set-initial-state 'jabber-chat-mode 'insert)

;; Centre screen around a search
(defadvice
    evil-search-forward
    (after evil-search-forward-recenter activate)
    (recenter))
(ad-activate 'evil-search-forward)

(defadvice
    evil-search-next
    (after evil-search-next-recenter activate)
    (recenter))
(ad-activate 'evil-search-next)

(defadvice
    evil-search-previous
    (after evil-search-previous-recenter activate)
    (recenter))
(ad-activate 'evil-search-previous)

(defadvice
    evil-goto-line
    (after evil-goto-line-recenter activate)
    (recenter))
(ad-activate 'evil-goto-line)

(defadvice
  evil-paste-after
  (after evil-paste-after-indent activate)
  (indent-region (point-min) (point-max))
  (message (point-min)))

(provide 'setup-evil)

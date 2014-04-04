(require 'evil)
(evil-mode 1)

(setq evil-default-cursor t)

(require 'evil-numbers)

;; To not miss surround mode
(require 'surround)
(global-surround-mode t)
(global-auto-revert-mode t)

(require 'evil-matchit)
(global-evil-matchit-mode 1)

;; Disable evil for certain major-modes
(dolist (mode '(eshell-mode shell-mode term-mode terminal-mode comint-mode skewer-repl-mode
                profiler-report-mode
                erc-mode weechat-mode
                direx:direx-mode
                makey-key-mode
                project-explorer-mode))
  (evil-set-initial-state mode 'emacs))
(evil-set-initial-state 'git-commit-mode 'insert)

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

(provide 'setup-evil)

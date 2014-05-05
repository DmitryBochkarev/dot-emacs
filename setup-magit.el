;; Magit
(require 'magit)
(require 'git-commit-mode)

(setq git-rebase-auto-advance t)
(setq magit-stage-all-confirm nil)
(setq magit-commit-squash-commit 'marked-or-current)
(setq magit-status-buffer-switch-function 'switch-to-buffer)

(if (file-executable-p "/usr/local/Cellar/emacs/24.1/bin/emacsclient")
    (setq magit-emacsclient-executable "/usr/local/Cellar/emacs/24.1/bin/emacsclient"))

(evil-declare-key 'normal git-commit-mode-map ",w" 'git-commit-commit)
(define-key magit-mode-map "q" (lambda ()
                 (interactive)
                 (if (get-buffer "*magit-process*")
                   (kill-buffer "*magit-process*"))
                 (if (get-buffer "*magit-edit-log*")
                   (kill-buffer "*magit-edit-log*"))
                 (kill-this-buffer)
                 (delete-window)
                 ))

;; Remap "k" to be magit-goto-previous-section everywhere
(define-key magit-status-mode-map "k" 'magit-goto-previous-section)
(define-key magit-branch-manager-mode-map "k" 'magit-goto-previous-section)
(define-key magit-mode-map "k" 'magit-goto-previous-section)
;; Remap "K" to do what "k" used to do, wherever "k" used to be defined
(define-key magit-status-mode-map "K" 'magit-discard-item)
(define-key magit-branch-manager-mode-map "K" 'magit-discard-item)

;; Remap "j" to be magit-goto-previous-section everywhere
(define-key magit-status-mode-map "j" 'magit-goto-next-section)
(define-key magit-branch-manager-mode-map "j" 'magit-goto-next-section)
(define-key magit-mode-map "j" 'magit-goto-next-section)


;; Preview changes without leaving the buffer
(define-key magit-mode-map (kbd "<S-return>") (lambda()
                        (interactive)
                        (let ((current-prefix-arg t))
                        (magit-visit-item))))

(define-key magit-mode-map (kbd "<return>") (lambda()
                        (interactive)
                        (universal-argument)
                        (let ((current-prefix-arg t))
                        (magit-visit-item))
                        (other-window 1)
                        ))

(define-key magit-mode-map (kbd "C-p") (lambda ()
                                         (interactive)
                                         (keychain-refresh-environment)
                                         (magit-push)))

(provide 'setup-magit)

;; Global bindings
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "C-S-w") 'close-all-buffers)
(global-set-key (kbd "C-J") 'switch-to-prev-buffer)
(global-set-key (kbd "C-K") 'switch-to-next-buffer)
(global-set-key (kbd "M-u") 'evil-scroll-up)
(global-set-key (kbd "M-d") 'evil-scroll-down)
(global-set-key (kbd "C-S-b") 'pop-tag-mark)
(global-set-key (kbd "C-s") 'save-buffer)

;; Plugin bindings

;; Evil overwrites
(define-key evil-normal-state-map "s" nil)
(define-key evil-motion-state-map (kbd "C-d") nil)
(define-key evil-motion-state-map (kbd "C-b") nil)
(define-key evil-normal-state-map (kbd "C-n") nil)
(define-key evil-normal-state-map (kbd "C-S-n") nil)
(define-key evil-normal-state-map (kbd "C-p") nil)
(define-key evil-normal-state-map (kbd "C-t") nil)
(define-key evil-motion-state-map (kbd "C-f") nil)
(define-key evil-motion-state-map (kbd "SPC") 'evil-ex)

(define-key evil-normal-state-map (kbd "ga") 'beginning-of-visual-line)
(define-key evil-normal-state-map (kbd "ge") 'end-of-visual-line)
(global-set-key (kbd "C-d") 'helm-for-files)

;; Expand region
(define-key evil-normal-state-map (kbd "ss") 'er/expand-region)
(define-key evil-visual-state-map (kbd "s") 'er/expand-region)
(define-key evil-visual-state-map (kbd "S") 'er/contract-region)

;; Projectile
(global-set-key (kbd "C-p") 'projectile-switch-project)
(global-set-key (kbd "C-t") 'projectile-find-file)
(global-set-key (kbd "C-f") 'projectile-ag)
(global-set-key (kbd "C-r") 'projectile-replace)

;; Rinari
(define-key evil-insert-state-map (kbd "C-S-i") 'rinari-insert-erb-skeleton)

;; Robe
(global-set-key (kbd "C-b") 'robe-jump)

;; Multiplecursors
(global-set-key (kbd "C-n") 'mc/mark-next-like-this)
(global-set-key (kbd "C-S-n") 'mc/mark-previous-like-this)

;; Magit
(define-key evil-normal-state-map (kbd "gs") 'magit-status)

;; Project explorer
(define-key evil-normal-state-map (kbd "st") 'project-explorer-open)

(provide 'setup-keybindings)

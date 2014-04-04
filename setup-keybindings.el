;; Global bindings
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "C-S-w") 'close-all-buffers)
(global-set-key (kbd "C-{") 'switch-to-prev-buffer)
(global-set-key (kbd "C-}") 'switch-to-next-buffer)
(global-set-key (kbd "M-u") 'evil-scroll-up)
(global-set-key (kbd "M-d") 'evil-scroll-down)
(global-set-key (kbd "C-S-b") 'pop-tag-mark)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-a") 'recentf-ido-find-file)
(global-set-key (kbd "C-o") 'find-file)
(global-set-key (kbd "C-h") 'helm-dash)
(global-set-key (kbd "C-d") 'switch-to-buffer)
(global-set-key (kbd "C-0") 'delete-other-windows)
(global-set-key (kbd "C-S-w") 'delete-other-windows)
(global-set-key (kbd "C-S-k") 'kill-buffer-and-window)

;; Plugin bindings

;; Evil overwrites
(define-key evil-normal-state-map "s" nil)
(define-key evil-motion-state-map (kbd "C-d") nil)
(define-key evil-motion-state-map (kbd "C-b") nil)
(define-key evil-motion-state-map (kbd "C-o") nil)
(define-key evil-normal-state-map (kbd "C-n") nil)
(define-key evil-normal-state-map (kbd "C-S-n") nil)
(define-key evil-normal-state-map (kbd "C-p") nil)
(define-key evil-normal-state-map (kbd "C-t") nil)
(define-key evil-normal-state-map (kbd "DEL") 'switch-to-previous-buffer)
(define-key evil-motion-state-map (kbd "C-f") nil)
(define-key evil-motion-state-map (kbd "SPC") 'evil-ex)

(define-key evil-normal-state-map (kbd "ga") 'beginning-of-visual-line)
(define-key evil-normal-state-map (kbd "ge") 'end-of-visual-line)
(define-key evil-insert-state-map [remap evil-delete-backward-char-and-join] 'hungry-delete-backward)

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

(define-key evil-normal-state-map (kbd "C-S-g s") 'magit-status)
(define-key evil-normal-state-map (kbd "C-S-g l") 'magit-file-log)
(define-key evil-normal-state-map (kbd "C-S-g b") 'magit-blame-mode)

;; Project explorer
(define-key evil-normal-state-map (kbd "gt") 'project-explorer-open)

;; Rspec
(define-key evil-normal-state-map (kbd "C-S-r s") 'rspec-verify-single)
(define-key evil-normal-state-map (kbd "C-S-r f") 'rspec-verify)
(define-key evil-normal-state-map (kbd "C-S-r a") 'rspec-verify-all)
(define-key evil-normal-state-map (kbd "C-S-r r") 'rspec-rerun)

;; Cucumber
(define-key evil-normal-state-map (kbd "C-S-c s") 'feature-verify-scenario-at-pos)
(define-key evil-normal-state-map (kbd "C-S-c f") 'feature-verify-all-scenarios-in-buffer)
(define-key evil-normal-state-map (kbd "C-S-c a") 'feature-verify-all-scenarios-in-project)
(define-key evil-normal-state-map (kbd "C-S-c r") 'rspec-rerun)

(provide 'setup-keybindings)

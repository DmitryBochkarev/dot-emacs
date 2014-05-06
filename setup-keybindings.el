;; Global bindings
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "C-S-w") 'close-all-buffers)
(global-set-key (kbd "C-{") 'switch-to-prev-buffer)
(global-set-key (kbd "C-}") 'switch-to-next-buffer)
(global-set-key (kbd "C-(") 'winner-undo)
(global-set-key (kbd "C-)") 'winner-redo)
(global-set-key (kbd "M-u") 'evil-scroll-up)
(global-set-key (kbd "M-d") 'evil-scroll-down)
(global-set-key (kbd "C-S-b") 'pop-tag-mark)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-t") 'recentf-ido-find-file)
(global-set-key (kbd "C-o") 'find-file)
(global-set-key (kbd "C-a") 'switch-to-buffer)
(global-set-key (kbd "C-S-w") 'delete-other-windows)
(global-set-key (kbd "C-S-w") 'delete-window)
(global-set-key (kbd "C-S-k") 'kill-this-buffer)
(global-set-key (kbd "C-3") 'shell-pop)
(global-set-key (kbd "<C-up>") 'shrink-window)
(global-set-key (kbd "<C-down>") 'enlarge-window)
(global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-0") 'balance-windows)

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
(define-key evil-motion-state-map (kbd "C-f") 'evil-search-forward)
(define-key evil-motion-state-map (kbd "SPC") 'evil-ex)
(define-key evil-insert-state-map (kbd "C-RET") 'emmet-expand-line)
(define-key evil-normal-state-map (kbd "M-v") 'evil-visual-block)
(define-key evil-insert-state-map (kbd "C-u") 'undo-tree-undo)
(define-key evil-insert-state-map (kbd "C-z") 'undo-tree-undo)
(define-key evil-normal-state-map (kbd "C-S-v") 'mark-whole-buffer)

;; Haml mode overwrites
(eval-after-load "haml-mode"
  '(define-key haml-mode-map (kbd "<backspace>") nil))
(eval-after-load "yaml-mode"
  '(define-key yaml-mode-map (kbd "<backspace>") nil))


;; Ido mode keymap
(add-hook 'ido-setup-hook 'ido-my-keys)

(defun ido-my-keys ()
  "Add my keybindings for ido."
  (define-key ido-completion-map (kbd "TAB") 'ido-next-match)
  (define-key ido-completion-map (kbd "<backtab>") 'ido-prev-match)
  )


(define-key evil-normal-state-map (kbd "ga") 'evil-first-non-blank)
(define-key evil-motion-state-map (kbd "ge") 'evil-last-non-blank)
(define-key evil-insert-state-map [remap evil-delete-backward-char-and-join] 'hungry-delete-backward)

;; Expand region
(define-key evil-normal-state-map (kbd "ss") 'er/expand-region)
(define-key evil-visual-state-map (kbd "s") 'er/expand-region)
(define-key evil-visual-state-map (kbd "S") 'er/contract-region)

;; Projectile
(global-set-key (kbd "C-p") 'projectile-persp-switch-project)
(global-set-key (kbd "C-S-p") 'persp-switch)
(global-set-key (kbd "C-d") 'projectile-find-file)
(global-set-key (kbd "C-S-f") 'ag-project-files)
(global-set-key (kbd "C-r") 'projectile-replace)

;; Rinari
(define-key evil-insert-state-map (kbd "C-S-i") 'rinari-insert-erb-skeleton)

;; Robe
(global-set-key (kbd "C-b") 'robe-jump)

;; Multiplecursors
(global-set-key (kbd "C-n") 'mc/mark-next-like-this)
(global-set-key (kbd "C-S-n") 'mc/mark-previous-like-this)

;; Helm
;; (define-key helm-map (kbd "TAB") 'helm-next-line)
;; (define-key helm-map (kbd "<backtab>") 'helm-previous-line))
;; (global-set-key (kbd "C-h") 'helm-dash)

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

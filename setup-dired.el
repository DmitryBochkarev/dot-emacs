;; Dired mode
(require 'dired)
(require 'dired+)

(evil-declare-key 'normal dired-mode-map ",e" (lambda ()
                        (interactive)
                        (dired-toggle-read-only)
                        (evil-normal-state)
                        (evil-forward-char)
                        ))
(evil-declare-key 'normal dired-mode-map "\\" 'dired-up-directory)
(evil-declare-key 'normal dired-mode-map "q" 'evil-record-macro)
(evil-declare-key 'normal wdired-mode-map ",e" 'wdired-finish-edit)
(evil-declare-key 'normal wdired-mode-map ",a" 'wdired-abort-changes)

(toggle-diredp-find-file-reuse-dir 1)

(define-key dired-mode-map (kbd "C-h") 'evil-window-left)
(define-key dired-mode-map (kbd "M-b") 'ido-switch-buffer)

(provide 'setup-dired)

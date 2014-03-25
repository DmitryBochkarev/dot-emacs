;; Load the package manager
(require 'package)
(add-to-list 'package-archives '("melp" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/"))
(package-initialize)

(defvar required-packages
  '(
    ack-and-a-half
    auto-complete
    autopair
    color-theme-sanityinc-tomorrow
    dired+
    evil
    evil-numbers
    surround
    expand-region
    ido-vertical-mode
    flx-ido
    flycheck
    flyspell
    rinari
    magit
    multiple-cursors
    indent-guide
    ruby-block
    ruby-end
    git-gutter-fringe+
    indent-guide
    projectile
    saveplace
    yasnippet
    )
  "Packages required for this configuration.")

(dolist (p required-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(require 'saveplace)
(setq save-place-file (concat user-emacs-directory ".cache/places"))
(setq-default save-place t)

;; Set path to .emacs.d
(setq emacs-dir (file-name-directory
                (or (buffer-file-name) load-file-name)))

;; Set path to manually installed plugins
(setq plugins-dir (expand-file-name "plugins" emacs-dir))

;; Set up load path
(let ((default-directory plugins-dir))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))
(add-to-list 'load-path emacs-dir)

(require 'setup-defaults)
(require 'setup-uniquify)
(require 'setup-saveplace)
(require 'setup-savehist)
(require 'setup-recentf)
(require 'setup-indentation)
(require 'setup-evil)
(require 'setup-dired)
(require 'setup-ido-flex)
(require 'setup-ruby)
(require 'setup-magit)
(require 'setup-flyspell)
(require 'setup-git-gutter)

;; Enable rinari
(require 'rinari)

;; Enable Rspec
(eval-after-load 'rspec-mode
 '(rspec-install-snippets))

;; Enable Robe
(add-hook 'ruby-mode-hook 'robe-mode)

;; Enable indentation guides
(require 'indent-guide)
(indent-guide-global-mode)

;; Enable Evil Nerd Commenter
(evilnc-default-hotkeys)

;; Enable Autocomplete package
(require 'auto-complete-config)
(ac-config-default)
(add-hook 'robe-mode-hook 'robe-ac-setup)

;; Enable Company mode
(add-hook 'after-init-hook 'global-company-mode)
;; (push 'company-robe company-backends)

;; Enable autoindent
(electric-indent-mode t)

;; Enable yasnippets
(yas-global-mode t)

;; Enable projectile
(projectile-global-mode)
(setq projectile-remember-window-configs t)

;; Mac specific configuration
(setq is-mac (equal system-type 'darwin))
(when is-mac (require 'setup-mac))

(require 'setup-keybindings)

;; Custom functions
(defun close-all-buffers ()
  "Kill other buffers"
  (interactive)
  (mapc 'kill-buffer 
    (delq (current-buffer) 
      (remove-if-not 'buffer-file-name (buffer-list)))))

(defun create-snippet (filename)
  (interactive "s")
  (let ((mode (symbol-name major-mode)))
    (find-file (format "~/.emacs.d/snippets/%s/%s" mode filename))
    (snippet-mode)
    (yas-reload-all)))

;; Remove any trailing whitespace on buffer write
(define-minor-mode remove-trailing-whitespace-mode
  "Toggle remove trailing whitespace on save.
When enabled trailing whitespace is removed before saving."
  :init-value nil
  :global t
  :lighter " W"

  (if remove-trailing-whitespace-mode
      (add-hook 'before-save-hook 'delete-trailing-whitespace)
    (remove-hook 'before-save-hook 'delete-trailing-whitespace)))

(remove-trailing-whitespace-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector (vector "#4d4d4c" "#c82829" "#718c00" "#eab700" "#4271ae" "#8959a8" "#3e999f" "#ffffff"))
 '(custom-enabled-themes (quote (sanityinc-tomorrow-day)))
 '(custom-safe-themes (quote ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" default)))
 '(fci-rule-color "#efefef")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map (quote ((20 . "#c82829") (40 . "#f5871f") (60 . "#eab700") (80 . "#718c00") (100 . "#3e999f") (120 . "#4271ae") (140 . "#8959a8") (160 . "#c82829") (180 . "#f5871f") (200 . "#eab700") (220 . "#718c00") (240 . "#3e999f") (260 . "#4271ae") (280 . "#8959a8") (300 . "#c82829") (320 . "#f5871f") (340 . "#eab700") (360 . "#718c00"))))
 '(vc-annotate-very-old-color nil))
 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

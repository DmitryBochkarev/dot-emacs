;; Load the package manager
(require 'package)
(add-to-list 'package-archives '("melp" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/"))
(package-initialize)

(defvar required-packages
  '(
    ag
    auto-complete
    autopair
    browse-kill-ring
    coffee-mode
    color-theme-sanityinc-tomorrow
    ctags
    ctags-update
    dash
    dired+
    evil
    evil-numbers
    evil-nerd-commenter
    evil-matchit
    expand-region
    emmet-mode
    flx-ido
    flycheck
    flyspell
    feature-mode
    git-commit-mode
    git-rebase-mode
    git-gutter-fringe+
    grizzl
    helm
    helm-projectile
    haml-mode
    hungry-delete
    ido-vertical-mode
    indent-guide
    js2-mode
    magit
    multiple-cursors
    projectile
    sass-mode
    saveplace
    shell-pop
    surround
    smartparens
    smart-mode-line
    rinari
    ruby-block
    ruby-electric
    ruby-hash-syntax
    rspec-mode
    tango-plus-theme
    yasnippet
    yaml-mode
    yard-mode
    web-mode
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
(require 'setup-smart-mode-line)
(require 'setup-uniquify)
(require 'setup-saveplace)
(require 'setup-savehist)
(require 'setup-recentf)
(require 'setup-indentation)
(require 'setup-ag)
(require 'setup-evil)
(require 'setup-dired)
(require 'setup-ido-flex)
(require 'setup-helm)
(require 'setup-ruby)
(require 'setup-magit)
(require 'setup-flyspell)
(require 'setup-git-gutter)
(require 'setup-autocomplete)
(require 'setup-projectile)

;; Enable Evil Nerd Commenter
(evilnc-default-hotkeys)

;; Enable Sass mode
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

;; Setup webmode
(require 'web-mode)
(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-css-colorization t)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

;; Setup emmet
(when (require 'emmet-mode nil t)
  (add-hook 'html-mode-hook 'emmet-mode)
  (add-hook 'web-mode-hook 'emmet-mode))
  (add-hook 'sgml-mode-hook 'emmet-mode)
  (add-hook 'css-mode-hook  'emmet-mode)

;; Setup smartparens
(require 'smartparens-config)
(smartparens-global-mode t)
(show-smartparens-global-mode +1)

;; Enable yasnippets
(yas-global-mode t)

;; Setup hungry delete
(require 'hungry-delete)
(global-hungry-delete-mode)

;; Setup shell pop
(require 'shell-pop)

;; Mac specific configuration
(setq is-mac (equal system-type 'darwin))
(when is-mac (require 'setup-mac))

(require 'setup-keybindings)

;; Custom functions
(defun gstatus ()
  "Run git status"
  (interactive)
  (magit-status))

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

(defun copy-path ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))

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

(defun untabify-hook ()
  (let ((tab-sensitive-modes '(makefile-mode
                              makefile-automake-mode
                              makefile-gmake-mode
                              makefile-imake-mode
                              makefile-makepp-mode
                              makefile-bsdmake-mode)))
    (if (not (member major-mode tab-sensitive-modes))
        (untabify (point-min) (point-max)))))

(add-hook 'before-save-hook 'untabify-hook)

(defun switch-to-previous-buffer ()
  "Switch to previously open buffer.
Repeated invocations toggle between the two most recently open buffers."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(defadvice find-file (before make-directory-maybe (filename &optional wildcards) activate)
  "Create parent directory if not exists while visiting file."
  (unless (file-exists-p filename)
    (let ((dir (file-name-directory filename)))
      (unless (file-exists-p dir)
        (make-directory dir)))))

(defadvice split-window (after move-point-to-new-window activate)
  "Moves the point to the newly created window after splitting."
  (other-window 1))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector (vector "#4d4d4c" "#c82829" "#718c00" "#eab700" "#4271ae" "#8959a8" "#3e999f" "#ffffff"))
 '(custom-enabled-themes (quote (dichromacy)))
 '(custom-safe-themes (quote ("7c043c631cfe141e6cb08936ae92396619266d67a1ccae59a7aa63064b24aa8f" "a30d5f217d1a697f6d355817ac344d906bb0aae3e888d7abaa7595d5a4b7e2e3" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" default)))
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

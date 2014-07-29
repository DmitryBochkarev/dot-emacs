;; Load the package manager
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/"))
(package-refresh-contents)

(defvar required-packages
  '(
    ac-js2
    ac-inf-ruby
    ac-etags
    ac-emmet
    ag
    auto-complete
    autopair
    browse-kill-ring
    coffee-mode
    color-theme-sanityinc-tomorrow
    color-identifiers-mode
    ctags
    ctags-update
    company
    company-inf-ruby
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
    gh
    gist
    git-commit-mode
    git-rebase-mode
    git-gutter-fringe+
    grizzl
    google-this
    helm
    helm-projectile
    helm-ag
    haml-mode
    hungry-delete
    ido-vertical-mode
    ido-ubiquitous
    indent-guide
    js2-mode
    jabber
    magit
    markdown-mode
    multiple-cursors
    org-repo-todo
    projectile
    persp-projectile
    project-explorer
    popup
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

;; Set ctags path
(setq tags-file-name "TAGS")
(setq path-to-ctags "/usr/local/bin/ctags")

;; Set up load path
(let ((default-directory plugins-dir))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))
(add-to-list 'load-path emacs-dir)

(require 'setup-defaults)

;; Enable Evil Nerd Commenter
(evilnc-default-hotkeys)

;; Setup js2-mode
(setq js2-basic-offset 2)
(setq js2-bounce-indent-p nil)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.js.erb\\'" . js2-mode))

;; Enable yasnippets
(yas-global-mode t)

;; Setup hungry delete
(require 'hungry-delete)
(global-hungry-delete-mode)

;; Setup shell pop
(require 'shell-pop)

;; Setup google-this
(require 'google-this)
(google-this-mode 1)

;; Setup color identifers mode
;; (add-hook 'after-init-hook 'global-color-identifiers-mode)

(require 'setup-webmode)
(require 'setup-emmet)
(require 'setup-smart-mode-line)
(require 'setup-uniquify)
(require 'setup-saveplace)
(require 'setup-savehist)
(require 'setup-recentf)
(require 'setup-sass)
(require 'setup-indentation)
(require 'setup-ag)
(require 'setup-dired)
(require 'setup-ido-flex)
(require 'setup-helm)
(require 'setup-ruby)
(require 'setup-magit)
(require 'setup-flyspell)
(require 'setup-flycheck)
(require 'setup-git-gutter)
(require 'setup-markdown)
(require 'setup-autocomplete)
(require 'setup-projectile)
(require 'setup-smartparens)
(require 'setup-jabber)
(require 'setup-project-explorer)
(require 'setup-evil)

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

(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "ctags -f %s -e -R %s" path-to-ctags (directory-file-name dir-name)))
  )

(defadvice find-file (before make-directory-maybe (filename &optional wildcards) activate)
  "Create parent directory if not exists while visiting file."
  (unless (file-exists-p filename)
    (let ((dir (file-name-directory filename)))
      (unless (file-exists-p dir)
        (make-directory dir)))))

(defadvice split-window (after move-point-to-new-window activate)
  "Moves the point to the newly created window after splitting."
  (other-window 1))

(defadvice
  goto-line
  (after goto-line-recenter activate)
  (recenter))
(ad-activate 'goto-line)

;; (defadvice evil-paste-after (after invent-after-paste activate)
;;   "Calls the indent function after pasting from register."
;;   (evil-indent))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-etags-requires 1)
 '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector (vector "#4d4d4c" "#c82829" "#718c00" "#eab700" "#4271ae" "#8959a8" "#3e999f" "#ffffff"))
 '(coffee-tab-width 2)
 '(custom-enabled-themes (quote (misterioso)))
 '(custom-safe-themes (quote ("6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "28be714e94b2ddbfd1addf8afba2d083c49748a6afbdc11d918893859f9d69c6" "f5e9f66da69f504cb61aacedeb8284d8f38f2e6f835fd658cac5f0ad5d924549" "13a1eb29d92819940b95f541a4bf763e0c28e3910e754ee24b6a52ee6624e019" "be279a6f829400fad88463a423beca38a9fe7ff1bb8ab3b165eae0690a988888" "60f04e478dedc16397353fb9f33f0d895ea3dab4f581307fbf0aa2f07e658a40" "c3fb7a13857e799bba450bb81b9101ef4960281c4d5908e05ecac9204c526c8a" "cd70962b469931807533f5ab78293e901253f5eeb133a46c2965359f23bfb2ea" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "bad832ac33fcbce342b4d69431e7393701f0823a3820f6030ccc361edd2a4be4" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "7c043c631cfe141e6cb08936ae92396619266d67a1ccae59a7aa63064b24aa8f" "a30d5f217d1a697f6d355817ac344d906bb0aae3e888d7abaa7595d5a4b7e2e3" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" default)))
 '(fci-rule-color "#000000")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map (quote ((20 . "#c82829") (40 . "#f5871f") (60 . "#eab700") (80 . "#718c00") (100 . "#3e999f") (120 . "#4271ae") (140 . "#8959a8") (160 . "#c82829") (180 . "#f5871f") (200 . "#eab700") (220 . "#718c00") (240 . "#3e999f") (260 . "#4271ae") (280 . "#8959a8") (300 . "#c82829") (320 . "#f5871f") (340 . "#eab700") (360 . "#718c00"))))
 '(vc-annotate-very-old-color nil))
;; (set-face-background 'hl-line "#444444")
(set-face-foreground 'highlight nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ido-first-match ((t (:background "dark orange" :foreground "white" :weight bold)))))

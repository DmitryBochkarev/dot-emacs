;; Minibuffer history
(require 'savehist)
(setq savehist-file (concat user-emacs-directory ".cache/savehist")
      savehist-additional-variables '(search ring regexp-search-ring)
      savehist-autosave-interval 60)
(setq-default history-length 1000)
(savehist-mode +1)

(provide 'setup-savehist)

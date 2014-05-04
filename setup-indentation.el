;; Indentation
(require 'evil)
(setq-default tab-width 2) ;; Set default tab width to 2
(setq js-indent-level 2)
(custom-set-variables '(coffee-tab-width 2))
(setq feature-indent-level 2)

;; Enable autoindent
(electric-indent-mode t)

(add-hook 'python-mode-hook
  (function (lambda ()
          (setq evil-shift-width python-indent))))
(add-hook 'ruby-mode-hook
  (function (lambda ()
          (setq evil-shift-width ruby-indent-level))))

;; Enable indentation guides
(require 'indent-guide)
(indent-guide-global-mode)

(provide 'setup-indentation)

;; Indentation
(require 'evil)
(setq-default tab-width 2) ;; Set default tab width to 2
(setq js-indent-level 2)

(add-hook 'python-mode-hook
  (function (lambda ()
          (setq evil-shift-width python-indent))))
(add-hook 'ruby-mode-hook
  (function (lambda ()
          (setq evil-shift-width ruby-indent-level))))

(provide 'setup-indentation)

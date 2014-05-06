;; Enable Autocomplete package
(require 'auto-complete-config)
(ac-config-default)
(setq ac-auto-start 1)
(setq ac-delay 0)
(setq ac-auto-show-menu 0)
(setq ac-use-fuzzy 1)
(setq ac-disable-inline 0)
(setq ac-disable-faces nil) ;; Autocomplete in strings
(setq ac-ignore-case nil)
(ac-flyspell-workaround)

(add-to-list 'ac-modes 'web-mode)
(add-to-list 'ac-modes 'yaml-mode)
(add-to-list 'ac-modes 'sass-mode)
(add-to-list 'ac-modes 'coffee-mode)

(add-hook 'js2-mode-hook 'ac-js2-mode)

;; Enable Robe
;;(add-hook 'robe-mode-hook 'ac-robe-setup)
;;(add-hook 'after-init-hook 'global-company-mode)

(provide 'setup-autocomplete)

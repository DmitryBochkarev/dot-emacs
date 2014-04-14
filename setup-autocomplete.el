;; Enable Autocomplete package
(require 'auto-complete-config)
(ac-config-default)
(setq ac-auto-start 1)
(setq ac-delay 0)
(setq ac-auto-show-menu .8)
(setq ac-use-fuzzy 1)
(setq ac-disable-faces nil) ;; Autocomplete in strings
(ac-flyspell-workaround)
(add-hook 'robe-mode-hook 'ac-robe-setup)
(add-to-list 'ac-modes 'web-mode)

;; Enable company-mode
;;(add-hook 'after-init-hook 'global-company-mode)

(provide 'setup-autocomplete)

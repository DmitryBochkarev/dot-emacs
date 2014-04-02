;; Enable Autocomplete package
(require 'auto-complete-config)
(ac-config-default)
(setq ac-auto-start 1)
(setq ac-delay 0)
(setq ac-auto-show-menu .8)
(ac-flyspell-workaround)
(add-hook 'robe-mode-hook 'robe-ac-setup)

;; Enable company-mode
;;(add-hook 'after-init-hook 'global-company-mode)

(provide 'setup-autocomplete)

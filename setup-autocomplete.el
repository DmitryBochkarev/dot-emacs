;; Enable Autocomplete package
(require 'auto-complete-config)
(ac-config-default)
(setq ac-auto-start 1)
(setq ac-delay 0)
(setq ac-auto-show-menu 0)
(setq ac-use-fuzzy 1)
;; (setq ac-disable-inline 0)
(setq ac-disable-faces nil) ;; Autocomplete in strings
(setq ac-ignore-case nil)
(ac-flyspell-workaround)

(add-to-list 'ac-modes 'web-mode)
(add-to-list 'ac-modes 'yaml-mode)
(add-to-list 'ac-modes 'sass-mode)
(add-to-list 'ac-modes 'coffee-mode)
(add-to-list 'ac-modes 'inf-ruby-mode)
(add-to-list 'ac-modes 'feature-mode)

(add-hook 'inf-ruby-mode-hook 'ac-inf-ruby-enable)
(add-hook 'js2-mode-hook 'ac-js2-mode)

(add-hook 'sgml-mode-hook 'ac-emmet-html-setup)
(add-hook 'css-mode-hook 'ac-emmet-css-setup)

(custom-set-variables
 '(ac-etags-requires 1))

(eval-after-load "etags"
  '(progn
     (ac-etags-setup)))

(defun dabbrev-allow-symbols ()
  (setq-local dabbrev-abbrev-skip-leading-regexp ":"))

(add-hook 'ruby-mode-hook 'dabbrev-allow-symbols)
(add-hook 'clojure-mode-hook 'dabbrev-allow-symbols)

;;Enable Robe
(add-hook 'robe-mode-hook 'ac-robe-setup)
;;(add-hook 'after-init-hook 'global-company-mode)

;; Setup for company-mode
;; (add-hook 'after-init-hook 'global-company-mode)
;; (require 'company)
;; (global-company-mode)
;; (add-hook 'after-init-hook '(lambda () (push 'company-robe company-backends)))
;; (setq company-selection-wrap-around t)
;; (setq company-auto-complete-chars (quote (32 95 41 46)))
;; (setq company-idle-delay 0)
;; (setq company-echo-delay 0)
;; (setq company-auto-complete t)

;; (setq evil-complete-next-func 'company-complete)
;; (setq evil-complete-previous-func 'company-complete)

(provide 'setup-autocomplete)

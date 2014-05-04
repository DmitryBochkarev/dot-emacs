(require 'smartparens-config)
(smartparens-global-mode t)
(show-smartparens-global-mode t)

(setq sp-autoescape-string-quote nil)
(setq sp-highlight-wrap-overlay nil)
(setq sp-highlight-pair-overlay nil)
(setq sp-highlight-current-sexp nil)

(sp-local-pair 'ruby-mode "{" nil :post-handlers '(:add my-add-space-after-sexp-insertion))
(sp-local-pair 'web-mode "{" nil :post-handlers '(:add my-add-space-after-sexp-insertion))

(defun my-add-space-after-sexp-insertion (id action _context)
  (when (eq action 'insert)
    (save-excursion
      (forward-char (length (plist-get (sp-get-pair id) :close)))
      (when (or (eq (char-syntax (following-char)) ?w)
                (looking-at (sp--get-opening-regexp)))
        (insert " ")))))

(provide 'setup-smartparens)

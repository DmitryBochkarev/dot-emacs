;; Enable Ruby Block
(require 'ruby-block)
(ruby-block-mode t)

;; Enhanced Ruby mode
(inf-ruby-minor-mode +1)
(ruby-tools-mode +1)

;; Camel Case aware operations
(subword-mode +1)

;; Rake files are ruby, too, as are gemspecs, rackup files, and gemfiles.
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.thor\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Thorfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.jbuilder\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Podfile\\'" . ruby-mode))

(add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . html-erb-mode))
(add-to-list 'auto-mode-alist '("\\.jst\\.ejs\\'"  . html-erb-mode))
(add-to-list 'auto-mode-alist '("\\.jst\\.eco\\'"  . html-erb-mode))

;; Enable Rspec
(eval-after-load 'rspec-mode
 '(rspec-install-snippets))

;; Enable Robe
(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'ruby-mode-hook 'yard-mode)
;; (add-hook 'enh-ruby-mode-hook 'robe-mode)
;; (add-hook 'enh-ruby-mode-hook 'yard-mode)

;; Enable Feature mode (Cucumber)
(setq feature-default-language "fi")
(setq feature-default-i18n-file "/path/to/gherkin/gem/i18n.yml")
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

(provide 'setup-ruby)

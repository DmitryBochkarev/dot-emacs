;; Enable Ruby Block
(require 'ruby-block)
(ruby-block-mode t)

(require 'inf-ruby)
(require 'rinari)
(require 'rspec-mode)

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

;; Update Ruby syntax definition
(add-hook 'ruby-mode-hook
          (lambda ()
            (modify-syntax-entry ?$ "w")
            (modify-syntax-entry ?: ".")
            (modify-syntax-entry ?@ "w")))

;; Disable ruby deep indent
(setq ruby-deep-indent-paren nil)

;; Enable Rspec
(eval-after-load 'rspec-mode
 '(rspec-install-snippets))

;; Enable Robe
(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'ruby-mode-hook 'yard-mode)
(add-hook 'enh-ruby-mode-hook 'robe-mode)
(add-hook 'enh-ruby-mode-hook 'yard-mode)

;; Enable Feature mode (Cucumber)
(require 'feature-mode)
(setq feature-default-language "fi")
;; (setq feature-default-i18n-file "/path/to/gherkin/gem/i18n.yml")
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;; Treat underscore word as a whole
(add-hook 'ruby-mode-hook
          (lambda () (modify-syntax-entry ?_ "w")))
(add-hook 'js-mode-hook
          (lambda () (modify-syntax-entry ?_ "w")))
(add-hook 'js2-mode-hook
          (lambda () (modify-syntax-entry ?_ "w")))
(add-hook 'web-mode-hook
          (lambda () (modify-syntax-entry ?_ "w")))

(provide 'setup-ruby)

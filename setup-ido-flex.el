;; Enable IDO mode and FLEX mode plugin
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-use-faces nil)
(setq ido-auto-merge-work-directories-length -1)
(require 'ido-vertical-mode)
(ido-vertical-mode 1)

(provide 'setup-ido-flex)

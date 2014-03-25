(menu-bar-mode 1)
(when (window-system)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

(setq mac-command-modifier 'control)
(setq mac-control-modifier 'meta)

(provide 'setup-mac)

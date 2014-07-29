(require 'persp-projectile)

(persp-mode)
(setq persp-is-ibc-as-f-supported t)

(projectile-global-mode)
(setq projectile-remember-window-configs t)
(setq projectile-sort-order 'recently-active)

(provide 'setup-projectile)

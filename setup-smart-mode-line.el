;; Smart Mode Line
(setq sml/theme 'automatic)
(sml/setup)
(setq sml/shorten-directory t)
(setq sml/shorten-modes t)
(setq sml/name-width 25)
(setq sml/mode-width 'full)

(add-to-list 'sml/hidden-modes " AC")
(add-to-list 'sml/hidden-modes " SP")
(add-to-list 'sml/hidden-modes " mate")
(add-to-list 'sml/hidden-modes " Plugged")
(add-to-list 'sml/hidden-modes " Gtags")
(add-to-list 'sml/hidden-modes " Abbrev")
(add-to-list 'sml/hidden-modes " Fill")
(add-to-list 'sml/hidden-modes " Guide")
(add-to-list 'sml/hidden-modes " my-keys")
(add-to-list 'sml/hidden-modes " GitGutter")
(add-to-list 'sml/hidden-modes " Undo-Tree")
(add-to-list 'sml/hidden-modes " Emmet")
(add-to-list 'sml/hidden-modes " MRev")
(add-to-list 'sml/hidden-modes " Robe")
(add-to-list 'sml/hidden-modes " yas")
(add-to-list 'sml/hidden-modes " ing")
(add-to-list 'sml/hidden-modes " Projectile")
(add-to-list 'sml/hidden-modes " Helm")
(add-to-list 'sml/hidden-modes " vl")
(add-to-list 'sml/hidden-modes " Wrap")
(add-to-list 'sml/hidden-modes " W")
(add-to-list 'sml/hidden-modes " Rbow")
(add-to-list 'sml/hidden-modes " YARD")
(add-to-list 'sml/hidden-modes " company")
(add-to-list 'sml/hidden-modes " rt")
(add-to-list 'sml/hidden-modes " robe")
(add-to-list 'sml/hidden-modes " ElDoc")
(add-to-list 'sml/hidden-modes " RBlock")
(add-to-list 'sml/hidden-modes " Google")

(provide 'setup-smart-mode-line)

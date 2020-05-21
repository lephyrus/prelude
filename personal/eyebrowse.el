(require 'bind-key)

(unbind-key "C-M-w" global-map)
(setq eyebrowse-keymap-prefix (kbd "C-M-w"))
(setq eyebrowse-wrap-around t)
(setq eyebrowse-new-workspace t)

(require 'eyebrowse)
(eyebrowse-mode t)

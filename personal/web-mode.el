(require 'web-mode)
(require 'prettier-js)

(defun hook-fns ()
  (setup-iosevka-ligatures)
  (add-node-modules-path)
  (prettier-js-mode))

(eval-after-load 'web-mode
  '(add-hook 'web-mode-hook 'hook-fns))

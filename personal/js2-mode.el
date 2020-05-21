(require 'js2-mode)
(require 'prettier-js)

(defun hook-fns ()
  (setup-iosevka-ligatures)
  (add-node-modules-path)
  (prettier-js-mode))

(eval-after-load 'js2-mode
  '(add-hook 'js2-mode-hook 'hook-fns))

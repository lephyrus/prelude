(require 'tide)

;; don't format the buffer before saving
(remove-hook 'before-save-hook 'tide-format-before-save)

;;;###autoload
(defun lephyrus-swipe-symbol-at-point ()
  "Invokes swiper with symbol at point as initial input."
  (interactive)
  (swiper (format "\\<%s\\>" (thing-at-point 'symbol))))

(provide 'lephyrus-utils)

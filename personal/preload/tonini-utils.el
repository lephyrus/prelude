;;;###autoload
(defun t-comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))

;;;###autoload
(defun t-newline-and-indent ()
  (interactive)
  (end-of-line)
  (newline-and-indent))

;;;###autoload
;; http://rejeep.github.io/emacs/elisp/2010/03/11/duplicate-current-line-or-region-in-emacs.html
(defun t-duplicate-current-line-or-region (arg)
  "Duplicates the current line or region ARG times.
If there's no region, the current line will be duplicated. However, if
there's a region, all lines that region covers will be duplicated."
  (interactive "p")
  (let (beg end (origin (point)))
    (if (and mark-active (> (point) (mark)))
        (exchange-point-and-mark))
    (setq beg (line-beginning-position))
    (if mark-active
        (exchange-point-and-mark))
    (setq end (line-end-position))
    (let ((region (buffer-substring-no-properties beg end)))
      (dotimes (i arg)
        (goto-char end)
        (newline)
        (insert region)
        (setq end (point)))
      (goto-char (+ origin (* (length region) arg) arg)))))

;;;###autoload
(defun t-move-text-internal (arg)
  (cond
   ((and mark-active transient-mark-mode)
    (if (> (point) (mark))
        (exchange-point-and-mark))
    (let ((column (current-column))
          (text (delete-and-extract-region (point) (mark))))
      (forward-line arg)
      (move-to-column column t)
      (set-mark (point))
      (insert text)
      (exchange-point-and-mark)
      (setq deactivate-mark nil)))
   (t
    (beginning-of-line)
    (when (or (> arg 0) (not (bobp)))
      (forward-line)
      (when (or (< arg 0) (not (eobp)))
        (transpose-lines arg))
      (forward-line -1)))))

;;;###autoload
(defun t-move-text-down (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines down."
  (interactive "*p")
  (t-move-text-internal arg))

;;;###autoload
(defun t-move-text-up (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines up."
  (interactive "*p")
  (t-move-text-internal (- arg)))

;;;###autoload
(defun t-indent-buffer ()
  "Indent each nonblank line in the buffer. See `indent-region"
  (interactive)
  (indent-region (point-min) (point-max)))

;;;###autoload
(defun t-insert-date ()
  (interactive)
  (let ((date (format-time-string "%Y-%m-%d")))
    (insert date)))

(defvar t-shell-command-buffer-name "*Shell Output*")
(defvar t-shell-command-error-buffer-name nil)

;;;###autoload
(defun t-delete-current-buffer-file ()
  (interactive)
  (let ((file (buffer-file-name))
        (buffer-name (buffer-name)))
    (if (y-or-n-p (format "Delete %s?: " file))
        (progn
          (kill-buffer buffer-name)
          (delete-file file)))))

;;;###autoload
;; source: http://batsov.com/articles/2011/11/12/emacs-tip-number-2-open-file-in-external-program/
(defun t-open-with ()
  "Simple function that allows us to open the underlying
file of a buffer in an external program."
  (interactive)
  (when buffer-file-name
    (shell-command (concat
                    (if (eq system-type 'darwin)
                        "open"
                      (read-shell-command "Open current file with: "))
                    " "
                    buffer-file-name))))

;;;###autoload
(defun t-delete-process-at-point ()
  (interactive)
  (let ((process (get-text-property (point) 'tabulated-list-id)))
    (cond ((and process
                (processp process))
           (delete-process process)
           (revert-buffer))
          (t
           (error "no process at point!")))))

(provide 'tonini-utils)

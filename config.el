;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq doom-theme 'doom-one)

(setq display-line-numbers-type nil)
(setq org-directory "~/org/")

(defun kluge-insert-date (arg)
  (interactive "P")
  (insert (cond
           ((not arg) (format-time-string "%Y-%m-%d"))
           ((equal arg '(4)) (format-time-string "%Y-%m-%dT%H:%M"))
           ((equal arg '(16)) (format-time-string "%Y-%m-%d %H:%M")))))

(map! :ni "<f5>" 'kluge-insert-date)
(map! :i "C-k" 'kill-line)

(defun kluge-append-semicolon-at-eol ()
  (interactive)
  (end-of-line)
  (insert ";"))

(map! :mode c++-mode :ni "M-RET" 'kluge-append-semicolon-at-eol)

(map! :leader :desc "Open todo.org" "o t" '(lambda () (interactive) (find-file "~/org/todo.org")))

;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq doom-theme 'doom-one)
(setq doom-modeline-modal-icon nil)

(setq display-line-numbers-type nil)

(setq +evil-want-o/O-to-continue-comments nil)

(defun kluge-insert-date (arg)
  (interactive "P")
  (insert (cond
           ((not arg) (format-time-string "%Y-%m-%d"))
           ((equal arg '(4)) (format-time-string "%Y-%m-%dT%H:%M"))
           ((equal arg '(16)) (format-time-string "%Y-%m-%d %H:%M")))))

(map! :ni "<f5>" 'kluge-insert-date)
(map! :ni "S-<f5>" (cmd! (kluge-insert-date '(4))))
(map! :i "C-k" 'kill-line)
(map! :leader
      "SPC" 'avy-goto-char-2
      "j l" 'avy-goto-line)

(after! winum
  (map! :leader
        "0" #'winum-select-window-0-or-10
        "1" #'winum-select-window-1
        "2" #'winum-select-window-2
        "3" #'winum-select-window-3
        "4" #'winum-select-window-4
        "5" #'winum-select-window-5
        "6" #'winum-select-window-6
        "7" #'winum-select-window-7
        "8" #'winum-select-window-8
        "9" #'winum-select-window-9))

;; Company
(after! company
  (map! :map company-active-map
        "<tab>" 'company-complete-selection
        "<return>" nil
        "RET" nil))

;; C++
(defun kluge-append-semicolon-at-eol ()
  (interactive)
  (end-of-line)
  (insert ";"))
(map! :mode c++-mode :ni "M-RET" 'kluge-append-semicolon-at-eol)

;; Git/Magit
(after! git-commit
  (setq git-commit-style-convention-checks '(non-empty-second-line)))

;; Org
(setq org-directory "~/org/")
(map! :leader :desc "Open todo.org" "o t" (cmd! (find-file "~/org/todo.org")))
(after! org
  (setq org-default-notes-file (expand-file-name "backlog.org" org-directory))
  (setq org-todo-keywords
        '((sequence "BACK(b!)" "TODO(t!)" "STRT(s!)" "WAIT(w!)" "|" "DONE(d!)")))
  (setq org-capture-templates
        '(("b" "Backlog" entry (file "~/org/backlog.org")
           "* BACK %?\n%U\n%i")
          ("B" "Backlog with link" entry (file "~/org/backlog.org")
           "* BACK %?\n%U\n%i\n%a")
          ("t" "Todo" entry (file "~/org/todo.org")
           "* TODO %?\n%U\n%i")
          ("T" "Todo with link" entry (file "~/org/todo.org")
           "* TODO %?\n%U\n%i\n%a"))))
(defun kluge-open-below-once ()
  "Emulate pressing o in normal state"
  (interactive)
  (evil-open-below 1))
(after! org-journal
  (setq org-journal-dir "~/journal/")
  (setq org-journal-file-format "%Y-%m-%d.org")
  (add-hook 'org-journal-after-entry-create-hook 'kluge-open-below-once))

;; Scala
; Use stupid-indent-mode instead of scala-mode's own, because it doesn't support whitespace-based syntax.
(use-package! stupid-indent-mode
  :commands stupid-indent-mode)
(defun kluge-do-nothing (fn &rest args)
  nil)
(advice-add 'scala-mode-map:add-self-insert-hooks :around 'kluge-do-nothing)
(defun kluge-stupid-indent-for-scala ()
  (setq tab-width 2)
  (setq evil-shift-width 2)
  (stupid-indent-mode 1))
(add-hook 'scala-mode-hook 'kluge-stupid-indent-for-scala)

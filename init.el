;;; init.el -*- lexical-binding: t; -*-

(doom!
       :completion
       company
       vertico

       :ui
       doom
       doom-dashboard
       modeline
       ophints
       (popup +defaults)
       vc-gutter

       :editor
       (evil +everywhere)
       file-templates
       fold
       snippets

       :emacs
       dired
       electric
       undo
       vc

       :checkers
       syntax

       :tools
       (eval +overlay)
       lookup
       magit

       :os
       (:if IS-MAC macos)

       :lang
       emacs-lisp
       markdown
       (org +journal)
       sh

       :config
       (default +bindings +smartparens))

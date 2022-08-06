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
       lsp
       magit

       :os
       (:if IS-MAC macos)

       :lang
       emacs-lisp
       markdown
       (org +journal)
       (scala +lsp)
       sh

       :config
       (default +bindings +smartparens))

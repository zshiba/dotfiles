
;; no startup screen
(setq inhibit-startup-screen t)

;; specify where to put auto-saved files
(setq backup-directory-alist '(("." . "~/.emacs.d/auto-backup")))

;; use space instead of tab for indentation
;; and 2-space per indent
(setq indent-tabs-mode nil)
(setq standard-indent 2)

;; show line, column number and visible portion in mode line
;(line-number-mode 1)
(column-number-mode 1)
(size-indication-mode 1)

;; show line number at left
(global-display-line-numbers-mode 1)

;; scroll by 1 line with 5-lines scroll margin
(setq scroll-conservatively 1)
(setq scroll-margin 5)

;; preserve caret position when scroll
(setq scroll-preserve-screen-position t)

;; enable completion in mini-buffer
(icomplete-mode 1)

;; allow completion with case insensitive match when opening files
(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;; highlight the current line
(global-hl-line-mode 1)

;; highlight the matching parentheses
(show-paren-mode 1)

;; highlight lines within the pair of parentheses when the one of the parenthesis is out of window
(setq show-paren-style 'mixed)

;; enable to delete selected region
(delete-selection-mode 1)

;; show trailing whitespace
(setq-default show-trailing-whitespace t)

;; show tab characters with underline
(add-hook
  'font-lock-mode-hook
  (lambda ()
    (font-lock-add-keywords
      nil ; apply to the current buffer
      '(("\t" . 'underline)))))


;; "C-h" as backspace and "C-x h" for help
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-x h") 'help-command)

;; "C-m" to add newline and then auto indent
(global-set-key (kbd "C-m") 'newline-and-indent)

;; "C-c b" to create the bookmark
;; "C-c j" to jump to the bookmark
(global-set-key (kbd "C-c b") (lambda ()
                                (interactive)
                                (bookmark-set "bookmark" nil)))
(global-set-key (kbd "C-c j") (lambda ()
                                (interactive)
                                (bookmark-jump "bookmark")))



(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


;; hide mode names in mode line
(use-package diminish
  :ensure t
  :config (diminish 'eldoc-mode)
          (diminish 'abbrev-mode))


;; use "C-_" for undo and "M-_" for redo
(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :config (global-undo-tree-mode 1))


;; show the total number of matches when searching
(use-package anzu
  :ensure t
  :diminish anzu-mode
  :config (global-anzu-mode 1)
  :custom-face (anzu-mode-line ((t (:foreground "blue" :weight bold))))
  :bind (([remap query-replace] . 'anzu-query-replace)
         ([remap query-replace-regexp] . 'anzu-query-replace-regexp)))


;; make it easy to expand/shrink region
(use-package expand-region
  :ensure t
  :bind (("M-=" . er/expand-region)
         ("M--" . er/contract-region)))


;; make it esay to swith windows
(use-package ace-window
  :ensure t
  :bind ("C-x o" . ace-window))


;; auto completion
(use-package company
  :ensure t
  :diminish company-mode
  :hook (after-init . global-company-mode)
  :config (setq company-idle-delay 0.1)
          (setq company-minimum-prefix-length 1)
  :bind (:map company-active-map
              ("C-h" . nil)
              ("C-n" . company-select-next)
              ("C-p" . company-select-previous)))


;; syntax check
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :bind (("M-e" . flycheck-next-error)
         ("M-E" . flycheck-previous-error)))


(use-package rust-mode
  :ensure t
  :config (setq rust-format-on-save t))

;;ToDo
;M-x rust-run-clippy

(use-package flycheck-rust
  :ensure t)
(with-eval-after-load 'rust-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(use-package racer
  :ensure t
  :diminish racer-mode
  :hook ((rust-mode . racer-mode)
         (racer-mode . eldoc-mode)
         (racer-mode . company-mode))
  :config (setq company-tooltip-align-annotations t))


(use-package haskell-mode
  :ensure t)

(use-package flycheck-haskell
  :ensure t)
(with-eval-after-load 'haskell-mode
  (add-hook 'haskell-mode-hook #'flycheck-haskell-setup))

(use-package lsp-haskell
 :ensure t
 :config (setq lsp-haskell-server-path "ghcide")
         (setq lsp-haskell-server-args nil)
        ;(setq lsp-haskell-process-path-hie "haskell-language-server-wrapper")
)


(use-package lsp-mode
  :ensure t
  :hook ((rust-mode . lsp)
         (haskell-mode . lsp)
         (c-mode . lsp)
         (c++-mode . lsp))
  :init (setq lsp-keymap-prefix "M-s")
  :config (setq gc-cons-threshold 100000000)
          (setq read-process-output-max (* 1024 1024))
  :bind (:map lsp-command-map
          ("d" . lsp-find-definition)      ; M-s d
          ("r" . lsp-find-references)      ; M-s r
          ("e" . lsp-execute-code-action)) ; M-s e
  :commands lsp)


(use-package lsp-ui
  :ensure t
  :config (setq lsp-ui-sideline-delay 0)
          (setq lsp-ui-doc-enable nil)
  :custom-face (lsp-face-highlight-read ((t (:inherit highlight :background "white" :foreground "black" :underline t))))
               (lsp-face-highlight-textual ((t (:inherit highlight :background "white" :foreground "black"))))
               (lsp-face-highlight-write ((t (:inherit highlight :background "white" :foreground "black" :weight bold))))
  :commands lsp-ui-mode)






(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(flycheck anzu undo-tree use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(anzu-mode-line ((t (:foreground "blue" :weight bold))))
 '(hl-line ((t (:inherit highlight :extend t :background "color-17"))))
 '(lsp-face-highlight-read ((t (:inherit highlight :background "white" :foreground "black" :underline t))))
 '(lsp-face-highlight-textual ((t (:inherit highlight :background "white" :foreground "black"))))
 '(lsp-face-highlight-write ((t (:inherit highlight :background "white" :foreground "black" :weight bold))))
 '(region ((t (:extend t :background "brightblack"))))
 '(trailing-whitespace ((t (:background "white")))))


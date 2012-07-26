;; startup options
(setq inhibit-splash-screen t
      initial-scratch-message nil
      truncate-partial-width-windows nil)
(setq-default show-trailing-whitespace t)

(when (locate-library "clojure-mode")
  (setq initial-major-mode 'clojure-mode))

;; ido
(ido-mode t)
(setq ido-save-directory-list-file "~/.emacs.d/.ido.last"
      ido-enable-flex-matching t
      ido-use-filename-at-point 'guess)
(global-set-key (kbd "C-x f") 'recentf-ido-find-file)
(global-set-key (kbd "C-t") 'find-file-in-project)

;; line numbers
(line-number-mode 1)
(column-number-mode 1)
(global-linum-mode 1)
(setq linum-format "%d  ")

;; standard diffs are horrible
(autoload 'magit-status "magit" nil t)
(setq diff-switches "-u -w"
      magit-diff-options "-w")
(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "green4")
     (set-face-foreground 'diff-removed "red3")))
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")
     (when (not window-system)
       (set-face-background 'magit-item-highlight "white"))))

;; tabs, spaces, and whitespace, oh my!
(setq tab-width 2
      indent-tabs-mode nil)

;; ()s
(show-paren-mode t)

;; enable copying from system clipboard
(setq x-select-enable-clipboard t)

;; forget the backup files
(setq make-backup-files nil)

;; treat regions as other programs do
(delete-selection-mode t)

;; make flyspell mode behave
(setq flyspell-issue-welcome-flag nil)

;; font scaling
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; inferior lisp
(setq inferior-lisp-program "script/repl")

;; inferior scheme
(autoload 'run-scheme "petite" "Run an inferior Scheme" t)
(setq scheme-program-name "petite")

;; take care of utf-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(custom-set-variables '(slime-net-coding-system (quote utf-8-unix)))

;; account for zsh config files
(add-to-list 'auto-mode-alist '("\\.zsh$" . shell-script-mode))

;; make buffer list sane
(require 'kpm-list)

;; making slides with code on them no longer requires textmate
(require 'htmlize)

;; pramatic programmers book building
(require 'pragprog)
(global-set-key (kbd "C-c C-c b") 'pragprog-build-book)
(global-set-key (kbd "C-c C-c c") 'pragprog-build-chapter)
(add-to-list 'auto-mode-alist '("\\.pml$" . nxml-mode))

;; turn off needless/annoying things
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(fset 'yes-or-no-p 'y-or-n-p)

;; org mode dealies
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-todo-keywords
      '((sequence "TODO" "INPROGRESS" "DONE")))
(setq org-todo-keyword-faces
      '(("INPROGRESS" . (:foreground "blue" :weight bold))))
(setq org-agenda-files (list "~/Dropbox/org/groupon.org"
			     "~/Dropbox/org/personal.org"
			     "~/Dropbox/org/clojure.org"))

(setq org-directory "~/Dropbox/org")
(setq org-mobile-inbox-for-pull "~/Dropbox/org/flagged.org")
(setq org-mobile-directory "~/Dropbox/MobileOrg")
;; org babel config
(require 'ob)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((sh . t)))

(add-to-list 'org-babel-tangle-lang-exts '("clojure" . "clj"))

(defvar org-babel-default-header-args:clojure
  '((:results . "silent") (:tangle . "yes")))

(defun org-babel-execute:clojure (body params)
  "Evaluate a block of Clojure code with Babel."
  (lisp-eval-string body)
  "Done!")

(provide 'ob-clojure)

(setq org-src-fontify-natively t)
(setq org-confirm-babel-evaluate nil)

;; os x stuffs
(when (eq system-type 'darwin)
  (progn
    (setq grep-find-use-xargs 'exec
	  locate-command "mdfind"
	  ispell-program-name "aspell"
	  magit-git-executable "/usr/local/bin/git")))

(defun coffee-custom ()
  "coffee-mode-hook"

  ;; CoffeeScript uses two spaces.
  (make-local-variable 'tab-width)
  (set 'tab-width 2))

(add-hook 'coffee-mode-hook 'coffee-custom)

(provide 'options)

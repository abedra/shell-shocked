;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ELPA
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; STARTUP OPTIONS
(defalias 'yes-or-no-p 'y-or-n-p)
(setq inhibit-startup-message t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PATH
(setenv "JAVA_HOME" "/usr/lib/jvm/java-6-sun")
(push "~/.emacs.d" load-path)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; MENU/TOOL/SCROLL BAR OPTIONS
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TEMP FILE LOCATION
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; UTF-8 OPTIONS
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(custom-set-variables '(slime-net-coding-system (quote utf-8-unix)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; IDO
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; LINE NUMBERS
(require 'linum)
(global-linum-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SMEX
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SHOW PARENS
(show-paren-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FLYSPELL HACKS
(setq flyspell-issue-welcome-flag nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; MISC
(ansi-color-for-comint-mode-on)
(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b"))))
(add-to-list 'auto-mode-alist '("\\.zsh$" . shell-script-mode))
(setq x-select-enable-clipboard t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; HTMLIZE
(require 'htmlize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PRAGMATIC MARKUP LANGUAGE
(require 'pragprog)
(global-set-key (kbd "C-c C-c b") 'pragprog-build-book)
(global-set-key (kbd "C-c C-c c") 'pragprog-build-chapter)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FONT SIZE TOOLS
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; KPM LIST MODE
(require 'kpm-list)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; INFERIOR LISP
(setq inferior-lisp-program "script/repl")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; MAGIT
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; LEININGEN MODE
(require 'elein)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ANDROID MODE
(require 'android-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; BUFFER CLEAN UP
(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer."
  (interactive)
  (indent-buffer)
  (untabify-buffer)
  (delete-trailing-whitespace))

(defun cleanup-region (beg end)
  "Remove tmux artifacts from region."
  (interactive "r")
  (dolist (re '("\\\\│\·*\n" "\W*│\·*"))
    (replace-regexp re "" nil beg end)))

(global-set-key (kbd "C-x M-t") 'cleanup-region)
(global-set-key (kbd "C-c n") 'cleanup-buffer)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ORG MODE
(push "~/.emacs.d/org-mode/lisp" load-path)
(push "~/.emacs.d/org-mode/contrib/lisp" load-path)
(require 'org-install)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-todo-keywords
  '((sequence "TODO" "INPR" "WAITING" "DONE")))
(setq org-todo-keyword-faces
  '(("INPR" . (:background "green" :foreground "white" :weight bold))
    ("WAITING" . (:foreground "orange" :weight bold))))
(setq org-agenda-files (list "~/notes/relevance.org"
                             "~/notes/personal.org"
                             "~/notes/clojure.org"
                             "~/notes/songs.org"))
(setq org-directory "~/notes/days")
(setq org-mobile-files (quote ("~/notes/days")))
(setq org-mobile-inbox-for-pull "~/notes/days/flagged.org")
(setq org-mobile-directory "~/Dropbox/MobileOrg")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CLOJURE
(autoload 'clojure-mode "clojure-mode" nil t)

(eval-after-load 'clojure-mode
  '(progn
     (require 'paredit)
     (defun clojure-paredit-hook () (paredit-mode +1))
     (add-hook 'clojure-mode-hook 'clojure-paredit-hook)
     (define-key clojure-mode-map "{" 'paredit-open-brace)
     (define-key clojure-mode-map "}" 'paredit-close-brace)))

(eval-after-load 'slime
  '(setq slime-protocol-version 'ignore))

(eval-after-load 'paredit
  ;; need a binding that works in the terminal
  '(define-key paredit-mode-map (kbd "M-)") 'paredit-forward-slurp-sexp))

(defun clojure-repl ()
  (interactive)
  (inferior-lisp "java -jar /home/abedra/src/opensource/clojure/clojure/target/clojure-1.3.0-master-SNAPSHOT.jar"))

(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs$" . clojure-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; MARKDOWN MODE HOOKS

(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; COLOR THEME
(push "~/.emacs.d/solarized" load-path)
(require 'color-theme-solarized)
(when (window-system)
  (color-theme-solarized-light))
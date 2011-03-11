;;; This was installed by package-install.el.p
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

(push "~/.emacs.d" load-path)

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(ansi-color-for-comint-mode-on)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq inhibit-startup-message t)

(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b"))))

(eval-after-load 'paredit
  ;; need a binding that works in the terminal
  '(define-key paredit-mode-map (kbd "M-)") 'paredit-forward-slurp-sexp))

(add-to-list 'auto-mode-alist '("\\.zsh$" . shell-script-mode))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; EXPERIMENTAL SECTION
(require 'erlang-start)
(setq load-path (cons "~/src/opensource/kpm-list" load-path))
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; IDO
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SMEX
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; LINE NUMBERS
(require 'linum)
(global-linum-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; LEININGEN MODE
(require 'elein)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ANDROID MODE 
(require 'android-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Show Parens
(show-paren-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ORG MODE
(push "~/.emacs.d/org-mode/lisp" load-path)
(push "~/.emacs.d/org-mode/contrib/lisp" load-path)
(require 'org-install)
(setq org-log-done t)
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
     (define-key clojure-mode-map "}" 'paredit-close-brace)

     ;; Custom indentation rules; see clojure-indent-function
     (define-clojure-indent
       (describe 'defun)
       (testing 'defun)
       (given 'defun)
       (using 'defun)
       (with 'defun)
       (it 'defun)
       (do-it 'defun))))

(eval-after-load 'slime
  '(setq slime-protocol-version 'ignore))

(require 'elein)

(defun clojure-repl ()
  (interactive)
  (inferior-lisp "java -jar /home/abedra/src/opensource/clojure/clojure/target/clojure-1.3.0-master-SNAPSHOT.jar"))

(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Colors

(when (window-system)
  (load-library "color-theme-blackboard")
  (add-hook 'after-init-hook 'color-theme-blackboard))

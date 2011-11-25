(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil t)
  (url-retrieve
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))

(require 'cl)
(require 'el-get)
(require 'package)

(dolist (archive '(("marmalade" . "http://marmalade-repo.org/packages/")
		   ("elpa" . "http://tromey.com/elpa")))
  (add-to-list 'package-archives archive))
(package-initialize)

(setq el-get-sources
      '((:name magit
	       :after (lambda ()
			(global-set-key (kbd "C-c C-g") 'magit-status)))
	(:name paredit
	       :after (lambda ()
			(let ((paredit-modes '(clojure
					       emacs-lisp
					       lisp
					       lisp-interaction
					       scheme)))
			  (dolist (mode paredit-modes)
			    (add-hook (intern (concat (symbol-name mode) "-mode-hook"))
				      (lambda () (paredit-mode +1)))))
			(define-key paredit-mode-map (kbd "M-)") 'paredit-forward-slurp-sexp)))
	(:name clojure-mode 
	       :type elpa
	       :after (lambda ()
			(add-to-list 'auto-mode-alist '("\\.clj.*$" . clojure-mode))))
	(:name slime-repl :type elpa)
	(:name slime
	       :type elpa
	       :after (lambda ()
			(setq slime-protocol-version 'ignore)
			(setq font-lock-verbose nil)))
	(:name find-file-in-project
	       :type git
	       :url "git://github.com/dburger/find-file-in-project.git"
	       :after (lambda ()
			(setq ffip-patterns '("*"))
			(setq ffip-use-project-cache nil)
			(defun ffip-toggle-use-project-cache ()
			  (interactive)
			  (setq ffip-use-project-cache (not ffip-use-project-cache))
			  (message (concat "Project caching "
					   (if ffip-use-project-cache
					       "enabled."
					     "disabled."))))
			(global-set-key (kbd "C-x M-f") 'find-file-in-project)
			(global-set-key (kbd "C-x M-F") 'ffip-toggle-use-project-cache)
			(when (and (eq system-type 'darwin)
				   window-system)
			  (global-set-key (kbd "s-t") 'find-file-in-project)
			  (global-set-key (kbd "s-T") 'ffip-toggle-use-project-cache))))))

(setq my-packages
      (append
       '(ac-slime
	 auto-complete
	 coffee-mode
	 elein
	 el-get
	 markdown-mode
	 org-mode
	 ruby-block
	 ruby-end
	 ruby-mode
	 swank-clojure
	 textile-mode
	 yaml-mode)
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)

(setq inhibit-splash-screen t
      initial-scratch-message nil
      truncate-partial-width-windows nil)

(when (locate-library "clojure-mode")
  (setq initial-major-mode 'clojure-mode))

(line-number-mode 1)
(column-number-mode 1)
(when (boundp 'tool-bar-mode)
  (tool-bar-mode -1))
(global-linum-mode 1)
(setq linum-format "%d  ")

(setq x-select-enable-clipboard t
      make-backup-files nil)

(setq tab-width 2
      indent-tabs-mode nil)

(fset 'yes-or-no-p 'y-or-n-p)
(delete-selection-mode t)
(show-paren-mode t)
(auto-compression-mode t)
(recentf-mode t)
(menu-bar-mode 0)

(ido-mode t)
(setq ido-save-directory-list-file "~/.emacs.d/.ido.last"
      ido-enable-flex-matching t
      ido-use-filename-at-point 'guess
      ido-show-dot-for-dired t)

(defun clojure-repl ()
  (interactive)
  (inferior-lisp "java -jar /Users/abedra/src/opensource/clojure/clojure/clojure-1.4.0-master-SNAPSHOT.jar"))x

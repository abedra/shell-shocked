(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(setenv "JAVA_HOME" "/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home")
(setenv "CLOJURESCRIPT_HOME" "/Users/abedra/src/opensource/clojure/clojurescript")

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
                   ("elpa" . "http://tromey.com/elpa/")))
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
        (:name smex
               :type elpa
               :after (lambda ()
                        (smex-initialize)
                        (global-set-key (kbd "M-x") 'smex)
                        (global-set-key (kbd "M-X") 'smex-major-mode-commands)))
        (:name deft
               :type elpa
               :after (lambda ()
                        (setq deft-extension "org")
                        (setq deft-directory "~/Dropbox/deft")
                        (setq deft-text-mode 'org-mode)
                        (global-set-key [f3] 'deft)))
        (:name rvm
               :type elpa
               :after (lambda ()
                        (rvm-use-default)))))

(setq my-packages
      (append
       '(ac-slime
         auto-complete
         coffee-mode
         deft
         elein
         el-get
         markdown-mode
         org-mode
         ruby-block
         ruby-end
         ruby-mode
         swank-clojure
         textile-mode
         smex
         yaml-mode)
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)

(add-to-list 'auto-mode-alist '("\\.feature.*$" . feature-mode))
(global-set-key (kbd "C-x l") 'goto-line)

(require 'options)
(require 'functions)

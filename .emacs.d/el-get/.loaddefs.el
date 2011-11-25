;;; .loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (set-up-slime-ac) "ac-slime/ac-slime" "../../../../../.emacs.d/el-get/ac-slime/ac-slime.el"
;;;;;;  (20175 4998))
;;; Generated autoloads from ../../../../../.emacs.d/el-get/ac-slime/ac-slime.el

(defface ac-slime-menu-face '((t (:inherit 'ac-candidate-face))) "\
Face for slime candidate menu." :group (quote auto-complete))

(defface ac-slime-selection-face '((t (:inherit 'ac-selection-face))) "\
Face for the slime selected candidate." :group (quote auto-complete))

(defvar ac-source-slime-fuzzy '((init . ac-slime-init) (candidates . ac-source-slime-fuzzy-candidates) (candidate-face . ac-slime-menu-face) (selection-face . ac-slime-selection-face) (prefix . slime-symbol-start-pos) (symbol . "l") (match lambda (prefix candidates) candidates) (document . ac-slime-documentation)) "\
Source for fuzzy slime completion")

(defvar ac-source-slime-simple '((init . ac-slime-init) (candidates . ac-source-slime-simple-candidates) (candidate-face . ac-slime-menu-face) (selection-face . ac-slime-selection-face) (prefix . slime-symbol-start-pos) (symbol . "l") (document . ac-slime-documentation)) "\
Source for slime completion")

(autoload 'set-up-slime-ac "ac-slime/ac-slime" "\
Add an optionally-fuzzy slime completion source to the
front of `ac-sources' for the current buffer.

\(fn &optional FUZZY)" t nil)

;;;***

;;;### (autoloads (clojure-enable-slime-on-existing-buffers clojure-jack-in
;;;;;;  clojure-mode) "clojure-mode/clojure-mode" "../../../../../.emacs.d/el-get/clojure-mode/clojure-mode.el"
;;;;;;  (20175 5150))
;;; Generated autoloads from ../../../../../.emacs.d/el-get/clojure-mode/clojure-mode.el

(autoload 'clojure-mode "clojure-mode/clojure-mode" "\
Major mode for editing Clojure code - similar to Lisp mode.
Commands:
Delete converts tabs to spaces as it moves back.
Blank lines separate paragraphs.  Semicolons start comments.
\\{clojure-mode-map}
Note that `run-lisp' may be used either to start an inferior Lisp job
or to switch back to an existing one.

Entry to this mode calls the value of `clojure-mode-hook'
if that value is non-nil.

\(fn)" t nil)

(autoload 'clojure-jack-in "clojure-mode/clojure-mode" "\


\(fn)" t nil)

(autoload 'clojure-enable-slime-on-existing-buffers "clojure-mode/clojure-mode" "\


\(fn)" t nil)

(add-hook 'slime-connected-hook 'clojure-enable-slime-on-existing-buffers)

(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))

;;;***

;;;### (autoloads (coffee-mode) "coffee-mode/coffee-mode" "../../../../../.emacs.d/el-get/coffee-mode/coffee-mode.el"
;;;;;;  (20175 5002))
;;; Generated autoloads from ../../../../../.emacs.d/el-get/coffee-mode/coffee-mode.el

(autoload 'coffee-mode "coffee-mode/coffee-mode" "\
Major mode for editing CoffeeScript.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))

(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

;;;***

;;;### (autoloads (elein-run-task elein-run-cmd elein-reswank elein-kill-swank
;;;;;;  elein-swank) "elein/elein" "../../../../../.emacs.d/el-get/elein/elein.el"
;;;;;;  (20175 5003))
;;; Generated autoloads from ../../../../../.emacs.d/el-get/elein/elein.el

(autoload 'elein-swank "elein/elein" "\
Launch lein swank and connect slime to it.  Interactively, a
PREFIX means launch a standalone swank session without a
project.

\(fn &optional PREFIX)" t nil)

(autoload 'elein-kill-swank "elein/elein" "\
Kill swank process started by lein swank.

\(fn)" t nil)

(autoload 'elein-reswank "elein/elein" "\
Kill current lisp, restart lein swank and connect slime to it.

\(fn)" t nil)

(autoload 'elein-run-cmd "elein/elein" "\
Run 'lein ARGS' using `compile' in the project root directory.

\(fn ARGS)" t nil)

(autoload 'elein-run-task "elein/elein" "\
Run 'lein TASK' using `compile' in the project root directory.

\(fn TASK)" t nil)

;;;***

;;;### (autoloads (magit-status) "magit/magit" "../../../../../.emacs.d/el-get/magit/magit.el"
;;;;;;  (20175 5146))
;;; Generated autoloads from ../../../../../.emacs.d/el-get/magit/magit.el

(autoload 'magit-status "magit/magit" "\
Open a Magit status buffer for the Git repository containing
DIR.  If DIR is not within a Git repository, offer to create a
Git repository in DIR.

Interactively, a prefix argument means to ask the user which Git
repository to use even if `default-directory' is under Git control.
Two prefix arguments means to ignore `magit-repo-dirs' when asking for
user input.

\(fn DIR)" t nil)

;;;***

;;;### (autoloads (rebase-mode) "magit/rebase-mode" "../../../../../.emacs.d/el-get/magit/rebase-mode.el"
;;;;;;  (20175 5146))
;;; Generated autoloads from ../../../../../.emacs.d/el-get/magit/rebase-mode.el

(autoload 'rebase-mode "magit/rebase-mode" "\
Major mode for editing of a Git rebase file.

Rebase files are generated when you run 'git rebase -i' or run
`magit-interactive-rebase'.  They describe how Git should perform
the rebase.  See the documentation for git-rebase (e.g., by
running 'man git-rebase' at the command line) for details.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("git-rebase-todo" . rebase-mode))

;;;***

;;;### (autoloads (markdown-mode) "markdown-mode/markdown-mode" "../../../../../.emacs.d/el-get/markdown-mode/markdown-mode.el"
;;;;;;  (20175 5004))
;;; Generated autoloads from ../../../../../.emacs.d/el-get/markdown-mode/markdown-mode.el

(autoload 'markdown-mode "markdown-mode/markdown-mode" "\
Major mode for editing Markdown files.

\(fn)" t nil)

;;;***

;;;### (autoloads (paredit-mode) "paredit/paredit" "../../../../../.emacs.d/el-get/paredit/paredit.el"
;;;;;;  (20175 5149))
;;; Generated autoloads from ../../../../../.emacs.d/el-get/paredit/paredit.el

(autoload 'paredit-mode "paredit/paredit" "\
Minor mode for pseudo-structurally editing Lisp code.
With a prefix argument, enable Paredit Mode even if there are
  imbalanced parentheses in the buffer.
Paredit behaves badly if parentheses are imbalanced, so exercise
  caution when forcing Paredit Mode to be enabled, and consider
  fixing imbalanced parentheses instead.
\\<paredit-mode-map>

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (ruby-end-mode) "ruby-end/ruby-end" "../../../../../.emacs.d/el-get/ruby-end/ruby-end.el"
;;;;;;  (20175 5133))
;;; Generated autoloads from ../../../../../.emacs.d/el-get/ruby-end/ruby-end.el

(autoload 'ruby-end-mode "ruby-end/ruby-end" "\
Automatic insertion of end blocks for Ruby.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (ruby-mode) "ruby-mode/ruby-mode" "../../../../../.emacs.d/el-get/ruby-mode/ruby-mode.el"
;;;;;;  (20175 5519))
;;; Generated autoloads from ../../../../../.emacs.d/el-get/ruby-mode/ruby-mode.el

(autoload 'ruby-mode "ruby-mode/ruby-mode" "\
Major mode for editing Ruby scripts.
\\[ruby-indent-line] properly indents subexpressions of multi-line
class, module, def, if, while, for, do, and case statements, taking
nesting into account.

The variable ruby-indent-level controls the amount of indentation.
\\{ruby-mode-map}

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))

(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))

(add-to-list 'interpreter-mode-alist '("rbx" . ruby-mode))

(add-to-list 'interpreter-mode-alist '("jruby" . ruby-mode))

(add-to-list 'interpreter-mode-alist '("ruby1.9" . ruby-mode))

(add-to-list 'interpreter-mode-alist '("ruby1.8" . ruby-mode))

;;;***

;;;### (autoloads (slime-repl-init) "slime-repl/slime-repl" "../../../../../.emacs.d/el-get/slime-repl/slime-repl.el"
;;;;;;  (20175 5154))
;;; Generated autoloads from ../../../../../.emacs.d/el-get/slime-repl/slime-repl.el

(autoload 'slime-repl-init "slime-repl/slime-repl" "\


\(fn)" nil nil)

(add-hook 'slime-load-hook 'slime-repl-init)

;;;***

;;;### (autoloads (smex-initialize) "smex/smex" "../../../../../.emacs.d/el-get/smex/smex.el"
;;;;;;  (20175 5139))
;;; Generated autoloads from ../../../../../.emacs.d/el-get/smex/smex.el

(autoload 'smex-initialize "smex/smex" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/el-get/ac-slime/ac-slime.el"
;;;;;;  "../../../../../.emacs.d/el-get/auto-complete/auto-complete-config.el"
;;;;;;  "../../../../../.emacs.d/el-get/auto-complete/auto-complete.el"
;;;;;;  "../../../../../.emacs.d/el-get/auto-complete/fuzzy.el" "../../../../../.emacs.d/el-get/auto-complete/popup.el"
;;;;;;  "../../../../../.emacs.d/el-get/clojure-mode/clojure-mode-autoloads.el"
;;;;;;  "../../../../../.emacs.d/el-get/clojure-mode/clojure-mode-pkg.el"
;;;;;;  "../../../../../.emacs.d/el-get/clojure-mode/clojure-mode.el"
;;;;;;  "../../../../../.emacs.d/el-get/coffee-mode/coffee-mode.el"
;;;;;;  "../../../../../.emacs.d/el-get/el-get/el-get-install.el"
;;;;;;  "../../../../../.emacs.d/el-get/el-get/el-get.el" "../../../../../.emacs.d/el-get/elein/elein.el"
;;;;;;  "../../../../../.emacs.d/el-get/kpm-list/kpm-list.el" "../../../../../.emacs.d/el-get/magit/50magit.el"
;;;;;;  "../../../../../.emacs.d/el-get/magit/magit-bisect.el" "../../../../../.emacs.d/el-get/magit/magit-key-mode.el"
;;;;;;  "../../../../../.emacs.d/el-get/magit/magit-pkg.el" "../../../../../.emacs.d/el-get/magit/magit-stgit.el"
;;;;;;  "../../../../../.emacs.d/el-get/magit/magit-svn.el" "../../../../../.emacs.d/el-get/magit/magit-topgit.el"
;;;;;;  "../../../../../.emacs.d/el-get/magit/magit.el" "../../../../../.emacs.d/el-get/magit/rebase-mode.el"
;;;;;;  "../../../../../.emacs.d/el-get/markdown-mode/markdown-mode.el"
;;;;;;  "../../../../../.emacs.d/el-get/package/package.el" "../../../../../.emacs.d/el-get/paredit/paredit.el"
;;;;;;  "../../../../../.emacs.d/el-get/ruby-block/ruby-block.el"
;;;;;;  "../../../../../.emacs.d/el-get/ruby-end/ruby-end.el" "../../../../../.emacs.d/el-get/ruby-mode/ruby-mode-autoloads.el"
;;;;;;  "../../../../../.emacs.d/el-get/ruby-mode/ruby-mode-pkg.el"
;;;;;;  "../../../../../.emacs.d/el-get/ruby-mode/ruby-mode.el" "../../../../../.emacs.d/el-get/slime-repl/slime-repl-autoloads.el"
;;;;;;  "../../../../../.emacs.d/el-get/slime-repl/slime-repl-pkg.el"
;;;;;;  "../../../../../.emacs.d/el-get/slime-repl/slime-repl.el"
;;;;;;  "../../../../../.emacs.d/el-get/smex/smex-autoloads.el" "../../../../../.emacs.d/el-get/smex/smex-pkg.el"
;;;;;;  "../../../../../.emacs.d/el-get/smex/smex.el" "../../../../../.emacs.d/el-get/swank-clojure/swank-clojure.el"
;;;;;;  "../../../../../.emacs.d/el-get/textile-mode/textile-mode.el"
;;;;;;  "../../../../../.emacs.d/el-get/yaml-mode/yaml-mode.el")
;;;;;;  (20175 5881 557783))

;;;***

(provide '.loaddefs)
;; Local Variables:
;; version-control: never
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; .loaddefs.el ends here

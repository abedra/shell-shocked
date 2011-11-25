;;; .loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (set-up-slime-ac) "ac-slime/ac-slime" "ac-slime/ac-slime.el"
;;;;;;  (20174 60273))
;;; Generated autoloads from ac-slime/ac-slime.el

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

;;;### (autoloads (coffee-mode) "coffee-mode/coffee-mode" "coffee-mode/coffee-mode.el"
;;;;;;  (20174 60277))
;;; Generated autoloads from coffee-mode/coffee-mode.el

(autoload 'coffee-mode "coffee-mode/coffee-mode" "\
Major mode for editing CoffeeScript.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))

(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

;;;***

;;;### (autoloads (elein-run-task elein-run-cmd elein-reswank elein-kill-swank
;;;;;;  elein-swank) "elein/elein" "elein/elein.el" (20174 60278))
;;; Generated autoloads from elein/elein.el

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

;;;### (autoloads (find-file-in-project) "find-file-in-project/find-file-in-project"
;;;;;;  "find-file-in-project/find-file-in-project.el" (20174 61975))
;;; Generated autoloads from find-file-in-project/find-file-in-project.el

(autoload 'find-file-in-project "find-file-in-project/find-file-in-project" "\
Prompt with a completing list of all files in the project to find one.

The project's scope is defined as the first directory containing
an `.emacs-project' file. You can override this by locally
setting the `ffip-project-root' variable.

\(fn)" t nil)

;;;***

;;;### (autoloads (highlight-parentheses-mode) "highlight-parentheses/highlight-parentheses"
;;;;;;  "highlight-parentheses/highlight-parentheses.el" (20174 60393))
;;; Generated autoloads from highlight-parentheses/highlight-parentheses.el

(autoload 'highlight-parentheses-mode "highlight-parentheses/highlight-parentheses" "\
Minor mode to highlight the surrounding parentheses.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (global-hl-sexp-mode hl-sexp-mode) "hl-sexp/hl-sexp"
;;;;;;  "hl-sexp/hl-sexp.el" (20174 60409))
;;; Generated autoloads from hl-sexp/hl-sexp.el

(autoload 'hl-sexp-mode "hl-sexp/hl-sexp" "\
Minor mode to highlight the sexp about point in the current window.
With ARG, turn Hl-Sexp mode on if ARG is positive, off otherwise.
Uses functions `hl-sexp-unhighlight' and `hl-sexp-highlight' on
`pre-command-hook' and `post-command-hook'.

\(fn &optional ARG)" t nil)

(defvar global-hl-sexp-mode nil "\
Non-nil if Global-Hl-Sexp mode is enabled.
See the command `global-hl-sexp-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-hl-sexp-mode'.")

(custom-autoload 'global-hl-sexp-mode "hl-sexp/hl-sexp" nil)

(autoload 'global-hl-sexp-mode "hl-sexp/hl-sexp" "\
Toggle Hl-Sexp mode in all buffers.
With prefix ARG, enable Global-Hl-Sexp mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Hl-Sexp mode is enabled in all buffers where
`hl-sexp-mode' would do it.
See `hl-sexp-mode' for more information on Hl-Sexp mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (magit-status) "magit/magit" "magit/magit.el" (20174
;;;;;;  61914))
;;; Generated autoloads from magit/magit.el

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

;;;### (autoloads (rebase-mode) "magit/rebase-mode" "magit/rebase-mode.el"
;;;;;;  (20174 61914))
;;; Generated autoloads from magit/rebase-mode.el

(autoload 'rebase-mode "magit/rebase-mode" "\
Major mode for editing of a Git rebase file.

Rebase files are generated when you run 'git rebase -i' or run
`magit-interactive-rebase'.  They describe how Git should perform
the rebase.  See the documentation for git-rebase (e.g., by
running 'man git-rebase' at the command line) for details.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("git-rebase-todo" . rebase-mode))

;;;***

;;;### (autoloads (markdown-mode) "markdown-mode/markdown-mode" "markdown-mode/markdown-mode.el"
;;;;;;  (20174 60410))
;;; Generated autoloads from markdown-mode/markdown-mode.el

(autoload 'markdown-mode "markdown-mode/markdown-mode" "\
Major mode for editing Markdown files.

\(fn)" t nil)

;;;***

;;;### (autoloads (paredit-mode) "paredit/paredit" "paredit/paredit.el"
;;;;;;  (20174 61974))
;;; Generated autoloads from paredit/paredit.el

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

;;;### (autoloads (ruby-end-mode) "ruby-end/ruby-end" "ruby-end/ruby-end.el"
;;;;;;  (20174 60511))
;;; Generated autoloads from ruby-end/ruby-end.el

(autoload 'ruby-end-mode "ruby-end/ruby-end" "\
Automatic insertion of end blocks for Ruby.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("auto-complete/auto-complete-config.el"
;;;;;;  "auto-complete/auto-complete.el" "auto-complete/fuzzy.el"
;;;;;;  "auto-complete/popup.el" "el-get/el-get-install.el" "el-get/el-get.el"
;;;;;;  "magit/50magit.el" "magit/magit-bisect.el" "magit/magit-key-mode.el"
;;;;;;  "magit/magit-pkg.el" "magit/magit-stgit.el" "magit/magit-svn.el"
;;;;;;  "magit/magit-topgit.el" "package/package.el" "ruby-block/ruby-block.el"
;;;;;;  "swank-clojure/swank-clojure.el" "textile-mode/textile-mode.el"
;;;;;;  "yaml-mode/yaml-mode.el") (20174 61976 673996))

;;;***

(provide '.loaddefs)
;; Local Variables:
;; version-control: never
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; .loaddefs.el ends here

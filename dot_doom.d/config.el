;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Logan Rios"
      user-mail-address "loganrios1@gmail.com")

;; sensible defaults (sharked from Tecosaur)
(setq-default
 delete-by-moving-to-trash t)

(setq auto-save-default t
      scroll-margin 5)

(global-subword-mode 1) ;; iterates through camelcase

;; sharked from hlissner's config
;; disables auto-completion, which we will later remap
;; (setq company-idle-delay nil)
(map! :i "C-c SPC" #'+company/complete)
(setq company-idle-delay 1.0)

;; Disable invasive lsp-mode features
(setq lsp-ui-sideline-enable nil   ; not anymore useful than flycheck
      lsp-ui-doc-enable nil        ; slow and redundant with K
      lsp-enable-symbol-highlighting nil
      +lsp-prompt-to-install-server 'quiet)

(setq evil-ex-substitute-global t)

;; Focus new window after splitting
(setq evil-split-window-below t
      evil-vsplit-window-right t)

;; hide the menu for a minimalist startup screen
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-footer)
(add-hook! '+doom-dashboard-mode-hook (hide-mode-line-mode 1) (hl-line-mode -1))
(setq-hook! '+doom-dashboard-mode-hook evil-normal-state-cursor (list nil))

(setq doom-font (font-spec :family "Comic Code Ligatures" :size 13)
      doom-variable-pitch-font (font-spec :family "Palatino" :size 12)
      doom-big-font (font-spec :family "Comic Code Ligatures" :size 24))

(setq doom-theme 'doom-gruvbox)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

(setq display-line-numbers-type nil)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Switch buffers with 'J', a la Qutebrowser
(map! :n "J" #'evil-next-buffer)

;; Map `gj'/`gk' for j/k in org-mode, while still
;; keeping that binding available for header jumping.
(map! :nv "j" #'evil-next-visual-line)
(map! :nv "k" #'evil-previous-visual-line)

;; maybe someday when i do colemak again
;;(global-evil-colemak-basics-mode)

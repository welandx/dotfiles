;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "weland"
      user-mail-address "weland@bupt.edu.cn")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-nord)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


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

(use-package rime
  :custom
  (default-input-method "rime"))
(setq lsp-clients-clangd-args '("-j=3"
                                "--background-index"
                                "--clang-tidy"
                                "--completion-style=detailed"
                                "--header-insertion=never"
                                "--header-insertion-decorators=0"))
(after! lsp-clangd (set-lsp-priority! 'clangd 2))

(use-package! telega
  :bind ("C-c t" . #'telega)
  :init (setq telega-proxies
	      '((:server "127.0.0.1"
			 :port "9981"
                         :enable t
                         :type (:@type "proxyTypeHttp")))
              telega-chat-show-avatars nil)
  (setq telega-chat-fill-column 65)
  (setq telega-emoji-use-images t)
  ;;(setq telega-server-libs-prefix "/nix/store/8n54mnnizmzvi7b3bhv31fc3hr0fcl9i-tdlib-1.7.0/lib")
  :config
  (set-fontset-font t 'unicode (font-spec :family "Symbola") nil 'prepend)
  (with-eval-after-load 'company (add-hook 'telega-chat-mode-hook (lambda ()
                                                                    (make-local-variable 'company-backends)
                                                                    (dolist (it '(telega-company-botcmd telega-company-emoji))
                                                                      (push it company-backends)))))
  (with-eval-after-load 'all-the-icons (add-to-list 'all-the-icons-mode-icon-alist '(telega-root-mode all-the-icons-fileicon "telegram"
                                                                                                      :heigt 1.0
                                                                                                      :v-adjust -0.2
                                                                                                      :face all-the-icons-yellow))
                        (add-to-list 'all-the-icons-mode-icon-alist '(telega-chat-mode all-the-icons-fileicon "telegram"
                                                                                       :heigt 1.0
                                                                                       :v-adjust -0.2
                                                                                       :face all-the-icons-blue)))
  (telega-notifications-mode t)
  (telega-mode-line-mode 1)
  (add-hook 'telega-chat-mode-hook
            (lambda ()
              (toggle-truncate-lines +1)
              (display-line-numbers-mode -1)))
  (add-hook 'telega-root-mode-hook
            (lambda ()
              (toggle-truncate-lines +1)
              (display-line-numbers-mode -1)
              (toggle-truncate-lines -1)))
  (define-key telega-msg-button-map "k" nil))
(use-package! eaf
  :load-path "~/.emacs.d/site-lisp/emacs-application-framework") ; Set to "/usr/share/emacs/site-lisp/eaf" if installed from AUR

(use-package! eaf-browser)
(use-package! eaf-pdf-viewer)

(use-package! eaf-evil)
(define-key key-translation-map (kbd "SPC")
    (lambda (prompt)
      (if (derived-mode-p 'eaf-mode)
          (pcase eaf--buffer-app-name
            ("browser" (string= (eaf-call-sync "call_function" eaf--buffer-id "is_focus") "True")
                           (kbd "SPC")
                         (kbd eaf-evil-leader-key)))
            ("pdf-viewer" (kbd eaf-evil-leader-key))
            ("image-viewer" (kbd eaf-evil-leader-key))
            (_  (kbd "SPC")))
        (kbd "SPC")))

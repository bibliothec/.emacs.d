
;;エラー表示
(setq debug-on-error t)
(require 'package)
;; package.elが管理していないelisp置き場
(add-to-list 'load-path "~/.emacs.d/elisp/")
;;通信エラー用
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
;; MELPAを追加(package.el)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/") t)
;; packageのリフレッシュ
;;(when (not package-archive-contents)
;;  (package-refresh-contents))
;; package.elの初期化
(package-initialize)
;;上のワーニング回避
(setq display-warning-minimum-level :error)
;;C-x bで存在しないバッファを開いた時にスクラッチモードで
(setq default-major-mode 'lisp-interaction-mode)
;; タイトルパーにファイルのフルパスを表示する
(setq frame-title-format "%f")
(tab-bar-mode 1)
;; 行間
(setq-default line-spacing 0)
; yes-or-no-pをy/nで選択できるようにする
(defalias 'yes-or-no-p 'y-or-n-p)
;;括弧を補完
(electric-pair-mode 1)
;; カーソルを点滅させない
(blink-cursor-mode 0)
;; scroll一行づつ
(setq scroll-conservatively 1000)
(setq scroll-step 1)
;; スクロール開始のマージンの行数
(setq scroll-margin 10)
;; 1 画面スクロール時に重複させる行数
(setq next-screen-context-lines 10)
;; 1 画面スクロール時にカーソルの画面上の位置をなるべく変えない
(setq scroll-preserve-screen-position t)
; 1行ずつ水平スクロールする設定
(setq hscroll-step 1)
(setq hscroll-margin 20)
;;(setq hl-line-face 'underline)
;;その行だけスクロール
;;(setq auto-hscroll-mode 'current-line)
;; 拡大しているときに1行スクロールする設定
(setq mouse-wheel-follow-mouse 't)
;; スクロールの速度調整
(setq mouse-wheel-progressive-speed nil)
;; C-k で後ろ行を削除する
(setq kill-whole-line t)
;; エラー音をならなくする
(setq ring-bell-function 'ignore)
;; クリップボードへのコピー
(setq x-select-enable-clipboard t)
;; ツールバーを表示しない
(tool-bar-mode 0)
;; メニューバーを非表示
(menu-bar-mode 0)
;; スクロールバーを表示
(setq scroll-bar-mode t)
;; 現在行の強調:
;;(global-hl-line-mode t)
;;タブ文字の削除
(setq-default indent-tabs-mode nil)
;;タブの大きさを指定
(setq-default default-tab-width 4)
;;初期画面でwelcome画面の表示を消す方法
(setq inhibit-startup-message t)
;; scratchの初期メッセージ消去
(setq initial-scratch-message "")
;;画面の下のバーで、今どこの行、列にいるかを表示させる。ex)Top(35,73)など
(line-number-mode t)
(column-number-mode t)
;; reload buffer
(global-set-key (kbd "<f5>") 'revert-buffer-no-confirm)
;;下のバーに時間を表示(これはあってもなくても良い)
;;(display-time)
;;リージョンに色をつける
(setq transient-mark-mode t)
;; 現在ポイントがある関数名をモードラインに表示
(which-function-mode 1)
;; 折り返し表示
(setq-default truncate-lines t)
(setq-default truncate-partial-width-windows t)
;; 大文字・小文字を区別しない
(setq case-fold-search t)
;; 起動時画面一杯にする
(add-to-list 'default-frame-alist '(fullscreen . fullheight))
;;C-hでdeleteできるように設定
(global-set-key"\C-h" 'delete-backward-char)
;; 行番号表示(Emacs26以降)
(global-display-line-numbers-mode t)
;;対応する括弧のハイライト
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'parenthesis)
(set-face-attribute 'show-paren-match nil
      :background "gray"
      :underline 'unspecified)
;;上に書いた対応する括弧のハイライト設定のオプション(重複して設定はできないので注意)
;;画面内に対応する括弧がある場合は括弧だけを、ない場合は括弧で囲まれた部分をハイライト
(setq show-paren-style 'mixed)
;;対応する括弧だけをハイライト(setq show-paren-style 'parenthesis)
;;括弧で囲まれた部分をハイライト(setq show-paren-style 'expression)
;;バックグラウンドの透過率の設定
(add-to-list 'default-frame-alist '(alpha . (1.0 1.0)))
;アルファ値(0.0 = 完全透明、1.0 = 不透明)で指定できる。
;;;~のバックアップファアイルを作らない
(setq make-backup-files nil)
;;#のバックアップファアイルを作らない
(setq auto-save-default nil)
;; shift+カーソルキーでバッファ切り替え
(windmove-default-keybindings)
(setq windmove-wrap-around t)
 ;; png, jpg などのファイルを画像として表示
 (setq auto-image-file-mode t)
;;c-x c-fでフォルダも作れるようにする
(setq confirm-nonexistent-file-or-buffer nil)
(defadvice find-file (before auto-create-directory activate)
  (unless (file-exists-p (ad-get-arg 0))
    (let ((dir (file-name-directory (ad-get-arg 0))))
      (unless (file-exists-p dir)
        (make-directory dir t)))))

;; , を入力したらスペース追加
(global-set-key (kbd ",") (lambda () (interactive) (insert ", ")))

;; Make Alt+n behave like C-↓
(global-set-key (kbd "M-n") (kbd "<C-down>"))
;; Make Alt+p behave like C-↑
(global-set-key (kbd "M-p") (kbd "<C-up>"))


;; use-packageのインストール(パッケージの自動インストールのため)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
;; use-packageを有効化する
(eval-when-compile
  (require 'use-package))

;Ctrl-jで、日本語入力を可能にする(takadaqのみ)
;;(global-set-key (kbd "C-j") 'toggle-input-method)
;;日本語を使えるようにする(上の設定とセットでするべき？)
(set-language-environment "Japanese")

;;パケージの自動インストール
(use-package lsp-mode
  :ensure t)
;; lsp-mode
(require 'lsp-mode)
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024))
(setq lsp-completion-provider :capf)
(setq lsp-idle-delay 0.500)
(require 'lsp-ui)
(setq lsp-ui-imenu-enable t)
(setq lsp-headerline-breadcrumb-enable t)

;; lsp-ui
(use-package lsp-ui
  :ensure t)
(require 'lsp-ui)
(setq lsp-ui-imenu-enable t)
(setq lsp-headerline-breadcrumb-enable t)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)


;; company(補完)
(use-package company
  :ensure t)
(require 'company)
(global-company-mode t)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)
(setq company-selection-wrap-around t)
(setq completion-ignore-case t)
;; 基本的に候補は無選択状態から始める。
;; 誤って確定してしまうのを防ぐ。
;;(setq-default company-selection-default nil)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "C-s") 'company-filter-candidates)


;;tmuxライク
(use-package ace-window
  :ensure t
  :bind (("M-o" . ace-window))
  :custom
  ;; キー操作による移動先の表示形式を指定
  (aw-leading-char-style 'char)
  ;; カスタマイズ可能な移動先候補の表示位置を指定
  (aw-dispatch-always t)
  ;; フレーム（ウィンドウ）が1つの場合にフレームを分割しない
  (aw-dispatch-alist
   '((?x aw-delete-window "Ace - Delete Window")
     (?c aw-swap-window "Ace - Swap Window")
     (?n aw-flip-window)
     (?v aw-split-window-vert "Ace - Split Vert Window")
     (?h aw-split-window-horz "Ace - Split Horz Window")
     (?m delete-other-windows "Ace - Maximize Window")
     (?g delete-other-windows)))
  ;; カスタマイズ可能な移動先候補の表示順序を指定
  (aw-dispatch-ordered-combination t))


;;ddskk
(use-package ddskk
  :ensure t
  :bind (("C-x C-j" . skk-mode)))
(setq skk-preload nil)
(use-package ddskk-posframe
  :ensure t
  :after ddskk
  :hook (skk-mode . ddskk-posframe-mode))

;; vim(c-zで切り替え)
(use-package evil
     :ensure t
     :init
     (evil-mode 1))
;; Insertモード時にキーバインドを切り替える
(setq evil-disable-insert-state-bindings t)
;; Emacs起動時にはemacsモードで開始する
(setq evil-default-state 'emacs)
;; terminalを開いたときにevilのinsertにならないように
(evil-set-initial-state 'term-mode 'emacs)
(add-to-list 'evil-emacs-state-modes 'term-mode)
;; モードラインにevil-modeのときはvimmodeと表示する
(setq evil-mode-line-format '(concat " " (:eval (if (evil-normal-state-p) "vimmode" " "))))
(setq evil-normal-state-tag   (propertize " N " 'face '((:background "green" :foreground "black")))
      evil-emacs-state-tag    (propertize " E " 'face '((:background "orange" :foreground "black")))
      evil-insert-state-tag   (propertize " I " 'face '((:background "red") :foreground "white"))
      evil-motion-state-tag   (propertize " M " 'face '((:background "blue") :foreground "white")))

;;マルチターミナル
(use-package multi-term
  :ensure t
  :bind (:map global-map
              ("C-x t" . multi-term-dedicated-toggle)
              ("C-x T" . multi-term))
)

;;C-a, C-eの挙動変化
(use-package mwim
  :ensure t
  :bind
  (("C-a" . mwim-beginning-of-code-or-line)
   ("C-e" . mwim-end-of-code-or-line)))

;;数の増減
(use-package evil-numbers
  :bind
  (("C-c +" . evil-numbers/inc-at-pt)
   ("C-c -" . evil-numbers/dec-at-pt)))
(define-key evil-normal-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
(define-key evil-visual-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-x") 'evil-numbers/dec-at-pt)
(define-key evil-visual-state-map (kbd "C-x") 'evil-numbers/dec-at-pt)


;;テーマ
(use-package atom-one-dark-theme
  :ensure t)
(load-theme 'atom-one-dark t)
(use-package gruvbox-theme
  :ensure t)
(load-theme 'gruvbox t)

;;icon
(use-package all-the-icons
    :ensure t)

;;バックグラウンドの色を変える
;;(set-face-background 'default "#303030")
;;色は#303030の部分を変えることで他の色に変更可能。

;;(set-face-foreground 'default "#f5f5f5")
(set-face-attribute 'region nil :background "#666" :foreground "#ffffff")


;; modeline
(use-package powerline
 :ensure t
 :config
 (powerline-center-evil-theme))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package powerline-evil
 :ensure t
 :init
 (powerline-evil-vim-theme))





;; minimap
(use-package minimap
  :ensure t
  ;;:init
  ;;(minimap-mode)
  :config
  (setq minimap-window-location 'right
        minimap-update-delay 0.2
        minimap-minimum-width 20
        minimap-automatically-delete-window nil)
  (custom-set-faces
     '(minimap-active-region-background
      ((((background dark)) (:background "#555555555555"))
    (t (:background "#C847D8FEFFFF"))) :group 'minimap))
  :bind ("<f9>" . minimap-mode))

;;minimapの関数版
  (use-package imenu-list
    :ensure t
    :bind
    ("<f10>" . imenu-list-smart-toggle)
    :custom-face
    (imenu-list-entry-face-1 ((t (:foreground "white"))))
    :custom
    (imenu-list-focus-after-activation t)
    (imenu-list-auto-resize nil))


;;キーバインどのガイド
(use-package which-key
    :ensure t
    :diminish which-key-mode
    :hook (after-init . which-key-mode))

;;カーソルを一瞬光らせる
 (use-package beacon
    :ensure t
    :custom
    (beacon-color "yellow")
    :config
    (beacon-mode 1))

;;git操作
(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status))
  :config
  (setq magit-completing-read-function 'ivy-completing-read)
  (setq magit-diff-refine-hunk t)
  (setq magit-push-always-verify nil))
;;gitの差分可視化
(use-package git-gutter
    :ensure t
    :custom
    (git-gutter:modified-sign "~")
    (git-gutter:added-sign    "+")
    (git-gutter:deleted-sign  "-")
    :custom-face
    (git-gutter:modified ((t (:background "#f1fa8c"))))
    (git-gutter:added    ((t (:background "#50fa7b"))))
    (git-gutter:deleted  ((t (:background "#ff79c6"))))
    :config
    (global-git-gutter-mode +1))


;;undo, redoを便利に
(use-package undo-tree
  :ensure t
  :bind (("M-/" . undo-tree-redo))
  :config
  (global-undo-tree-mode))


;;構文チェッカー:
(use-package flycheck
  :ensure t
  :hook (prog-mode . flycheck-mode))


;;カッコの補完
(use-package smartparens
  :ensure t
  :hook (after-init . smartparens-global-strict-mode) ; strictモードを有効化
  :config (require 'smartparens-config)
  :custom (electric-pair-mode nil)) ; electirc-pair-modeを無効化

;;カッコの強調:
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

;;スペースの強調
(use-package whitespace
  :ensure t
  :hook (prog-mode . whitespace-mode)
  :custom
  (whitespace-style '(face trailing tabs spaces empty space-mark tab-mark))
  (whitespace-line-column 80))


;;インデントの強調
(use-package highlight-indent-guides
  :ensure t
  :hook (prog-mode . highlight-indent-guides-mode)
  :custom
  (highlight-indent-guides-method 'column)
  (highlight-indent-guides-responsive 'top)
  (highlight-indent-guides-delay 0.1))

;;コメントアウトの拡張
(use-package comment-dwim-2
  :ensure t
  :bind ("M-;" . comment-dwim-2)
  :config
  (setq comment-dwim-2--inline-comment-behavior 'reindent-comment))


;; neotree（サイドバー）
(use-package neotree
  :ensure t)
(require 'neotree)
(global-set-key "\C-o" 'neotree-toggle)


;;補完インターフェース
;;(use-package ivy
;;  :ensure t
;;  :diminish ivy-mode
;;  :config
;;  (ivy-mode 1))
;;(setq ivy-use-virtual-buffers nil)
;;(setq enable-recursive-minibuffers t)
;;(setq ivy-use-selectable-prompt t)
;;(setq ivy-re-builders-alist 
;;        '((swiper . ivy--regex-plus)
;;        (t      . ivy--regex-fuzzy)))
;;(setq ivy-re-builders-alist
;;      '((t . ivy--regex-ignore-order)))
;;ivyのプリセット
;;(use-package counsel
;;  :ensure t
;;  :config
;;  (ivy-mode 1)
;;  (global-set-key (kbd "M-x") 'counsel-M-x)
;;  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
;;  (global-set-key (kbd "C-x b") 'counsel-switch-buffer)
;;  (global-set-key (kbd "C-c f") 'counsel-git)
;;  (global-set-key (kbd "C-c g") 'counsel-git-grep))
;;文字列検索
;;(use-package swiper
;;  :ensure t
;;  :bind (("C-s" . swiper)))
;;ivyをリッチに
;;(use-package all-the-icons-ivy-rich
;;  :ensure t
;;  :init (all-the-icons-ivy-rich-mode 1))
;;(use-package ivy-rich
;;  :ensure t
;;  :init
;;  (ivy-rich-mode 1))
;;ivyをフレーム表示
;;(use-package ivy-posframe
;;  :ensure t
;;  :config
;;  (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center)))
;;  (ivy-posframe-mode 1))

;;現在のウィンドウをズーム(minimapも拡大されてしまう問題)
;;(use-package zoom
;;  :ensure t
;;  :config
;;  (setq zoom-size '(0.618 . 0.618))
;;  (zoom-mode t))


;;ページブレイクライン
;;(use-package page-break-lines
;;  :ensure t
;;  :config
;;  (global-page-break-lines-mode))
;;dashboard
;;(use-package projectile
;;  :ensure t)
;;(use-package dashboard
;;  :ensure t
;;  :diminish
;;    (dashboard-mode page-break-lines-mode)
;;  :config
;;  (dashboard-setup-startup-hook))
;;(setq dashboard-center-content t)
;;(setq dashboard-banner-logo-title "Welcom to Emacs!")
;;(setq dashboard-startup-banner 'logo)
;;(setq dashboard-show-shortcuts t)
;;(setq dashboard-banner-length 100)
;;(setq dashboard-init-info "さっさとコード書け")
;;(setq dashboard-icon-type 'all-the-icons)
;;(setq dashboard-set-heading-icons t)
;;(setq dashboard-set-file-icons t)
;;(setq dashboard-set-navigator t)
;;(setq dashboard-set-init-info t)
;;(setq dashboard-set-footer nil)
;;(setq dashboard-items '(
;;                        (recents  . 5)
;;                        ;;(bookmarks . 5)
;;                        (projects . 5)
;;                        (agenda . 5)
;;                        ;;(registers . 5)
;;                        ))
;;(dashboard-setup-startup-hook)




;; python
(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred

;;rust
(use-package rust-mode
  :ensure t
  :mode "\\.rs\\'"
  :config
  (setq rust-format-on-save t)
  (setq indent-tabs-mode nil)
  (setq rust-indent-offset 4))
;; lsp-modeの設定
(use-package lsp-mode
  :hook (rust-mode . lsp-deferred)
  :config
  (setq lsp-rust-server 'rust-analyzer)
  (setq lsp-prefer-flymake nil)
  (setq lsp-log-io nil))

;;go
(use-package go-mode
  :mode "\\.go\\'"
  :hook (go-mode . lsp-deferred)
  :config
  (setq tab-width 4))
;; lsp-modeの設定
(use-package lsp-mode
  :hook (go-mode . lsp-deferred)
  :config
  (setq lsp-prefer-flymake nil)
  (setq lsp-log-io nil))

;;C/C++
(use-package lsp-mode
  :hook ((c-mode . lsp)
         (c++-mode . lsp))
  :commands lsp
  :config
  (setq lsp-prefer-flymake nil))

;;C#
(use-package csharp-mode
  :ensure t
  :hook (csharp-mode . lsp-deferred)
  :custom
  (lsp-csharp-server-path (executable-find "omnisharp"))
  (lsp-enable-snippet nil))

;;java
(use-package lsp-java
  :ensure t
  :hook (java-mode . lsp-deferred)
  :custom
  (lsp-java-java-path "/usr/lib/jvm/default/bin/java")
  (lsp-java-jdt-download-url "http://download.eclipse.org/jdtls/snapshots/jdt-language-server-latest.tar.gz")
  (lsp-java-workspace-dir ".")
  (lsp-java-trace-server "verbose"))

;;markdown
(use-package markdown-mode
  :ensure t
  :mode ("\\.md\\'" . markdown-mode))
;;html
(use-package sgml-mode
  :ensure nil
  :mode "\\.html\\'")
;;css
(use-package css-mode
  :ensure nil
  :mode "\\.css\\'")

;;markdown preview C-c C-c C-p
(add-hook 'markdown-mode-hook 'markdown-live-preview-mode)


;;java/typescript
(use-package lsp-mode
  :hook ((typescript-mode js-mode) . lsp)
  :commands lsp
  :custom
  (lsp-typescript-server-install-dir "/usr/lib/node_modules/typescript-language-server/bin/"))

;;emmet
(use-package emmet-mode
    :ensure t)
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; マークアップ言語全部で使う
(add-hook 'css-mode-hook  'emmet-mode) ;; CSSにも使う
(add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2))) ;; indent はスペース2個
(eval-after-load "emmet-mode"
  '(define-key emmet-mode-keymap (kbd "C-j") nil)) ;; C-j は newline のままにしておく
(keyboard-translate ?\C-i ?\H-i) ;;C-i と Tabの被りを回避
(define-key emmet-mode-keymap (kbd "H-i") 'emmet-expand-line) ;; C-i で展開



;; Windowsの場合の設定
(when (eq system-type 'windows-nt)
  ;; Windows専用の設定をここに書く
  (setq multi-term-program "powershell.exe")
  (set-face-attribute 'default nil 
                      :family "Consolas"
                      :height 100 
                      :width 'normal) 
  (set-fontset-font t 'japanese-jisx0208 (font-spec :family "Meiryo UI"))
  (add-hook 'window-setup-hook 
            (lambda () (set-fontset-font t 'japanese-jisx0208 (font-spec :family "Meiryo UI" 
                                                                         :width 'normal))))
  )

;; macOSの場合の設定
(when (eq system-type 'darwin)
  ;; macOS専用の設定をここに書く
  )

;; Linuxの場合の設定
(when (eq system-type 'gnu/linux)
     ;; Linux専用の設定をここに書く
    ;; 日本語フォントを設定
    (set-face-attribute 'default nil 
                    :family "Noto Sans Mono CJK JP"
                    :height 150
                    :weight 'Medium
                    :width 'normal)
    (set-face-attribute 'default nil
                      :family "Hack"
                      :weight 'normal
                      :height 150)
 
    ;;システムパスを与える
    (use-package exec-path-from-shell
    :ensure t
    :config
    (exec-path-from-shell-initialize))

    (setq multi-term-program "/bin/bash")
  )




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(multi-term evil-numbers which-key dashboard atom-one-dark-theme powerline-evil lsp-mode use-package zenburn-theme yaml-mode yafolding web-mode web-beautify vterm volatile-highlights vi-tilde-fringe typescript-mode spinner smartparens smart-mode-line rainbow-mode rainbow-delimiters racer python-mode protobuf-mode plantuml-mode neotree mozc monokai-theme minimap melancholy-theme markdown-preview-mode leaf-keywords ivy-prescient hydra highlight-indent-guides gruvbox-theme go-impl gcmh flycheck-rust emmet-mode el-get dracula-theme dockerfile-mode beacon auto-complete afternoon-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(minimap-active-region-background ((((background dark)) (:background "#555555555555")) (t (:background "#C847D8FEFFFF"))) nil 'minimap))


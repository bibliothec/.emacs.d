
;;エラー表示
(setq debug-on-error t)
(require 'package)
;; package.elが管理していないelisp置き場
(add-to-list 'load-path "~/.emacs.d/elisp/")
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
;; MELPAを追加(package.el)
;;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/")t)
;;(add-to-list 'package-archives '("stable-melpa" . "https://stable.melpa.org/packages/")t)
;;(add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/")t)
;;(fset 'package-desc-vers 'package--ac-desc-version)
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
;;(setq-default scroll-step 1)
(setq scroll-conservatively 1)
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
(global-hl-line-mode t)
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
;;Ctrl-jで、日本語入力を可能にする(takadaqのみ)
(global-set-key (kbd "C-j") 'toggle-input-method)
;;日本語を使えるようにする(上の設定とセットでするべき？)
(set-language-environment "Japanese")
;;~のバックアップファアイルを作らない
(setq make-backup-files nil)
;;#のバックアップファアイルを作らない
(setq auto-save-default nil)

;;バックグラウンドの色を変える
;;(set-face-background 'default "#303030")
;;色は#303030の部分を変えることで他の色に変更可能。

;;(set-face-foreground 'default "#f5f5f5")

;; , を入力したらスペース追加
(defun my-insert-comma ()
  "Insert comma and space."
  (interactive)
  (insert ", ")
  )
(global-set-key (kbd ",") 'my-insert-comma)






;; use-packageのインストール(パッケージの自動インストールのため)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
;; use-packageを有効化する
(eval-when-compile
  (require 'use-package))


;; 日本語フォントを設定
(set-face-attribute 'default nil 
                    :font "Noto Sans Mono CJK JP-12"
                    :width 'expanded)
(setq face-font-rescale-alist
      '(("Sans Mono CJK JP-12" . 4.0)))

;;システムパスを与える
(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))


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


;;neotree
(use-package neotree
  :ensure t)

;; vim(c-zで切り替え)
(use-package evil
     :ensure t
     :init
     (evil-mode 1))
;; Insertモード時にキーバインドを切り替える
(setq evil-disable-insert-state-bindings t)
;; Emacs起動時にはemacsモードで開始する
(setq evil-default-state 'emacs)


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

;; modeline
(use-package powerline
 :ensure t
 :config
 (powerline-default-theme))


;; minimap
(use-package minimap
  :ensure t
  :init
  (minimap-mode)
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

;;git
(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status))
  :config
  (setq magit-completing-read-function 'ivy-completing-read)
  (setq magit-diff-refine-hunk t)
  (setq magit-push-always-verify nil))

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

;; neotree（サイドバー）
(use-package neotree
  :ensure t)
(require 'neotree)
(global-set-key "\C-o" 'neotree-toggle)


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



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(which-key dashboard atom-one-dark-theme powerline-evil lsp-mode use-package zenburn-theme yaml-mode yafolding web-mode web-beautify vterm volatile-highlights vi-tilde-fringe typescript-mode spinner smartparens smart-mode-line rainbow-mode rainbow-delimiters racer python-mode protobuf-mode plantuml-mode neotree mozc monokai-theme minimap melancholy-theme markdown-preview-mode leaf-keywords ivy-prescient hydra highlight-indent-guides gruvbox-theme go-impl gcmh flycheck-rust emmet-mode el-get dracula-theme dockerfile-mode beacon auto-complete afternoon-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


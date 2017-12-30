;; Package管理
(package-initialize)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))

(require 'auto-install)
(auto-install-compatibility-setup)

;; cmdキーを superとして割り当てる
(setq mac-command-modifier 'super)

;; バックスペースの設定
(global-set-key (kbd "C-h") 'delete-backward-char)

;; auto-complete（自動補完）
(require 'auto-complete)
(require 'auto-complete-config)
(setq ac-quick-help-delay 0.1)
(setq ac-delay 0.1)
(setq ac-auto-show-menu nil)
(setq ac-auto-start nil)
(ac-set-trigger-key "TAB")
(add-hook 'auto-complete-mode-hook 'ac-common-setup)
(setq-default ac-sources '(ac-source-abbrev
			   ac-source-dictionary
			   ac-source-words-in-same-mode-buffers))
(add-to-list 'ac-sources 'ac-source-filename)
(global-auto-complete-mode t)

;; font
(add-to-list 'default-frame-alist '(font . "ricty-12"))

;; color theme
(load-theme 'zenburn t)

;; alpha
(if window-system 
    (progn
      (set-frame-parameter nil 'alpha 95)))

;; 非アクティブウィンドウの背景色を設定
;; (load-file "~/.emacs.d/site-lisp/hiwin.el")
;; (set-face-background 'hiwin-face "gray30")

;; line numberの表示
(require 'linum)
(global-linum-mode 1)

;; tabサイズ
(setq-default indent-tabs-mode nil)
;;(setq default-tab-width 4)

;; メニューバーを非表示
(menu-bar-mode 0)

;; ツールバーを非表示
(tool-bar-mode 0)

;; default scroll bar消去
(scroll-bar-mode -1)

;; 現在ポイントがある関数名をモードラインに表示
(which-function-mode 1)

;; 対応する括弧をハイライト
(show-paren-mode 1)

;; リージョンのハイライト
(transient-mark-mode 1)

;; タイトルにフルパス表示
(setq frame-title-format "%f")

;;current directory 表示
(let ((ls (member 'mode-line-buffer-identification
                  mode-line-format)))
  (setcdr ls
	  (cons '(:eval (concat " ("
			  (abbreviate-file-name default-directory)
            ")"))
	  (cdr ls))))

;; スタートアップメッセージを表示させない
(setq inhibit-startup-message 1)

;; ターミナルで起動したときにメニューを表示しない
(if (eq window-system 'x)
    (menu-bar-mode 1) (menu-bar-mode 0))
(menu-bar-mode nil)

;; scratchの初期メッセージ消去
(setq initial-scratch-message "")

;;バックアップファイルを作らない
(setq backup-inhibited t)

;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)

;; elscreen（上部タブ）
(require 'elscreen)
(elscreen-start)
(global-set-key "\C-l" 'elscreen-next)
(global-set-key (kbd "s-t") 'elscreen-create)
(global-set-key "\C-r" 'elscreen-previous)
(global-set-key (kbd "s-d") 'elscreen-kill)
(set-face-attribute 'elscreen-tab-background-face nil
                    :background "grey10"
                    :foreground "grey90")
(set-face-attribute 'elscreen-tab-control-face nil
                    :background "grey20"
                    :foreground "grey90")
(set-face-attribute 'elscreen-tab-current-screen-face nil
                    :background "grey20"
                    :foreground "grey90")
(set-face-attribute 'elscreen-tab-other-screen-face nil
                    :background "grey30"
                    :foreground "grey60")
;;; [X]を表示しない
(setq elscreen-tab-display-kill-screen nil)
;;; [<->]を表示しない
(setq elscreen-tab-display-control nil)
;;; タブに表示させる内容を決定
(setq elscreen-buffer-to-nickname-alist
      '(("^dired-mode$" .
         (lambda ()
           (format "Dired(%s)" dired-directory)))
        ("^Info-mode$" .
         (lambda ()
           (format "Info(%s)" (file-name-nondirectory Info-current-file))))
        ("^mew-draft-mode$" .
         (lambda ()
           (format "Mew(%s)" (buffer-name (current-buffer)))))
        ("^mew-" . "Mew")
        ("^irchat-" . "IRChat")
        ("^liece-" . "Liece")
        ("^lookup-" . "Lookup")))
(setq elscreen-mode-to-nickname-alist
      '(("[Ss]hell" . "shell")
        ("compilation" . "compile")
        ("-telnet" . "telnet")
        ("dict" . "OnlineDict")
        ("*WL:Message*" . "Wanderlust")))

;; neotree（サイドバー）
(require 'neotree)
(global-set-key "\C-o" 'neotree-toggle)

;; スクロールは1行ごとに
(setq mouse-wheel-scroll-amount '(1 ((shift) . 5)))

;; スクロールの加速をやめる
(setq mouse-wheel-progressive-speed nil)

;; bufferの最後でカーソルを動かそうとしても音をならなくする
(defun next-line (arg)
  (interactive "p")
  (condition-case nil
      (line-move arg)
    (end-of-buffer)))

;; エラー音をならなくする
(setq ring-bell-function 'ignore)

;; スクロールは1行ごとに
(setq mouse-wheel-scroll-amount '(1 ((shift) . 5)))

;; スクロールの加速をやめる
(setq mouse-wheel-progressive-speed nil)

;; bufferの最後でカーソルを動かそうとしても音をならなくする
(defun next-line (arg)
  (interactive "p")
  (condition-case nil
      (line-move arg)
    (end-of-buffer)))

;; エラー音をならなくする
(setq ring-bell-function 'ignore)

;; golden ratio
(golden-ratio-mode 1)
(add-to-list 'golden-ratio-exclude-buffer-names " *NeoTree*")

;; active window move
(global-set-key (kbd "<C-left>")  'windmove-left)
(global-set-key (kbd "<C-down>")  'windmove-down)
(global-set-key (kbd "<C-up>")    'windmove-up)
(global-set-key (kbd "<C-right>") 'windmove-right)

;; php-mode
(require 'php-mode)

;; php-mode-hook
(add-hook 'php-mode-hook
          (lambda ()
            (require 'php-completion)
            (php-completion-mode t)
            (define-key php-mode-map (kbd "C-o") 'phpcmp-complete)
            (make-local-variable 'ac-sources)
            (setq ac-sources '(
                               ac-source-words-in-same-mode-buffers
                               ac-source-php-completion
                               ac-source-filename
                               ))))

;; web mode
;; http://web-mode.org/
;; http://yanmoo.blogspot.jp/2013/06/html5web-mode.html
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.ctp\\'"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; web-modeの設定
(defun web-mode-hook ()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-engines-alist
        '(("php"    . "\\.ctp\\'"))
        )
  )

(add-hook 'web-mode-hook  'web-mode-hook)

;;;js2-modeの設定
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook (lambda () (setq js2-basic-offset 2)))

;; 色の設定
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(web-mode-comment-face ((t (:foreground "#D9333F"))))
 '(web-mode-css-at-rule-face ((t (:foreground "#FF7F00"))))
 '(web-mode-css-pseudo-class-face ((t (:foreground "#FF7F00"))))
 '(web-mode-css-rule-face ((t (:foreground "#A0D8EF"))))
 '(web-mode-doctype-face ((t (:foreground "#82AE46"))))
 '(web-mode-html-attr-name-face ((t (:foreground "#C97586"))))
 '(web-mode-html-attr-value-face ((t (:foreground "#82AE46"))))
 '(web-mode-html-tag-face ((t (:foreground "#E6B422" :weight bold))))
 '(web-mode-server-comment-face ((t (:foreground "#D9333F")))))

;; anything settings
(require 'anything-config)
(setq anything-enable-shortcuts 'prefix)
(define-key anything-map (kbd "@") 'anything-select-with-prefix-shortcut)
(global-set-key (kbd "C-x b") 'anything-mini)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (anything js2-mode zenburn-theme web-mode php-mode elscreen auto-install auto-complete))))


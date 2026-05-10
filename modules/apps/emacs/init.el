;; ==========================================
;; 1. THE UI
;; ==========================================
(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(tool-bar-mode   -1)
(menu-bar-mode   -1)
(set-fringe-mode 10)
(setq initial-scratch-message "")

;; Font & Cursor
;; Note: Ensure "Departure Mono" is installed in your NixOS config
(set-frame-font "Departure Mono-12" nil t)
(setq-default cursor-type 'bar)
(setq-default line-spacing 0.1)

;; Line numbers in prog modes only
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;; Highlight the current line
(global-hl-line-mode 1)

;; Show matching parens
(show-paren-mode 1)

;; Line wrapping for Org mode
(add-hook 'org-mode-hook 'visual-line-mode)

;; ==========================================
;; 2. THEME
;; ==========================================
(use-package doom-themes
  :config
  (load-theme 'doom-flatwhite t))

;; ==========================================
;; 4. DASHBOARD
;; ==========================================
;; 1. Set these BEFORE use-package even starts
(setq dashboard-set-init-info nil)
(setq dashboard-init-info "") 
(setq dashboard-items nil)
(setq dashboard-set-footer nil)

(recentf-mode 1)
(setq recentf-max-saved-items 25)

(use-package dashboard
  :ensure t
  :init
  (setq dashboard-startup-banner 'official)
  (setq dashboard-banner-logo-title "Welcome to Emacs")
  (setq dashboard-center-content t)
  (setq dashboard-show-shortcuts nil)
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents . 10)))        
  (setq dashboard-item-names '(("Recent Files:" . "  Recent Files"))) 
  ;; 2. Manually wipe the buffer one last time after it loads
  (setq dashboard-init-info "")
  (dashboard-refresh-buffer))

;; Ensure dashboard is the first thing you see
(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))

;; ==========================================
;; 3. UTILS
;; ==========================================
(use-package all-the-icons)

;; No backup / auto-save clutter
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Remember cursor position in files
(save-place-mode 1)

;; Remember minibuffer history
(savehist-mode 1)

;; Auto-revert buffers when files change on disk
(global-auto-revert-mode 1)

;; ==========================================
;; 4. IVY / COUNSEL / SWIPER
;; ==========================================
(use-package diminish :ensure t)

(use-package ivy
  :ensure t
  :after diminish
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (setq ivy-wrap t)
  (define-key ivy-minibuffer-map (kbd "<up>")    #'ivy-previous-line)
  (define-key ivy-minibuffer-map (kbd "<down>")  #'ivy-next-line)
  (define-key ivy-minibuffer-map (kbd "<right>") #'ivy-alt-done)
  (define-key ivy-minibuffer-map (kbd "<left>")  #'ivy-up-directory))

(use-package counsel
  :ensure t
  :after ivy
  :config (counsel-mode 1))

(use-package swiper
  :ensure t
  :after ivy
  :bind ("C-s" . swiper))
  
;; ==========================================
;; 5. KEYMAPS
;; ==========================================
(cua-mode 1)
(global-set-key (kbd "C-x k")   'kill-current-buffer)
(global-set-key (kbd "C-=")     'text-scale-increase)
(global-set-key (kbd "C--")     'text-scale-decrease)
(global-set-key (kbd "C-c t") 'vterm)

;; ==========================================
;; 6. Terminal
;; ==========================================
          (setq vterm-shell "${pkgs.zsh}/bin/zsh") 
          (setq vterm-max-scrollback 10000)
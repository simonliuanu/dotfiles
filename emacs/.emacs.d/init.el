;;; init.el --- Personal Emacs configuration -*- lexical-binding: t; -*-

;;; Commentary:
;; A small, dependency-free starting point.  Add package declarations and
;; machine-specific settings below as the configuration grows.

;;; Code:

;; Keep Customize-generated settings out of this hand-maintained file.
(setq custom-file (locate-user-emacs-file "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file nil 'nomessage))

;; Clean, predictable UI defaults.
(menu-bar-mode -1)
(tool-bar-mode -1)
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(column-number-mode 1)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)
(global-hl-line-mode 1)
(electric-pair-mode 1)
(show-paren-mode 1)

;; Editing defaults.
(setq-default indent-tabs-mode nil
              tab-width 4
              tab-always-indent nil
              fill-column 80)
(setq c-basic-offset 4)
(setq inhibit-startup-screen t
      ring-bell-function #'ignore
      use-short-answers t
      require-final-newline t
      backup-directory-alist
      `(("." . ,(locate-user-emacs-file "backups/")))
      auto-save-file-name-transforms
      `((".*" ,(locate-user-emacs-file "auto-save/") t)))
(setq initial-scratch-message nil)

;; macOS key bindings: Command is Meta and Option enters special characters.
(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta
        mac-option-modifier 'none))

;; Convenient built-in completion and history persistence.
(savehist-mode 1)
(save-place-mode 1)
(recentf-mode 1)
(fido-vertical-mode 1)

(global-set-key (kbd "C-c c") #'compile)
(global-set-key (kbd "C-c f") #'find-file)
(global-set-key (kbd "C-c g") #'rgrep)

(provide 'init)
;;; init.el ends here

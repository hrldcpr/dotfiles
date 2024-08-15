;; On first install, run package-install-selected-packages
;; to install packages from package-selected-packages below.

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; emacs (as of v28.2) doesn't seem to know about foot
;; this fixes C-- shortcut, among other things
(add-to-list 'term-file-aliases '("foot" . "xterm"))

;; prefer simple linear undo/redo
;; TODO use undo-tree package instead?
(global-set-key (kbd "C--") 'undo-only)
(global-set-key (kbd "C-_") 'undo-redo)

(setq make-backup-files nil)
(setq-default indent-tabs-mode nil)
(menu-bar-mode -1)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq require-final-newline t)
(setq column-number-mode t)

(add-hook 'c-mode-hook (lambda () (add-hook 'before-save-hook 'clang-format-buffer nil 'local)))
(add-hook 'c++-mode-hook (lambda () (add-hook 'before-save-hook 'clang-format-buffer nil 'local)))
(add-hook 'glsl-mode-hook (lambda () (add-hook 'before-save-hook 'clang-format-buffer nil 'local)))
(add-hook 'elixir-mode-hook (lambda () (add-hook 'before-save-hook 'elixir-format nil 'local)))
(add-hook 'go-mode-hook (lambda () (add-hook 'before-save-hook 'gofmt-before-save nil 'local)))

(add-hook 'css-mode-hook 'prettier-js-mode)
(add-hook 'html-mode-hook 'prettier-js-mode)
(add-hook 'js-mode-hook 'prettier-js-mode)
(add-hook 'markdown-mode-hook 'prettier-js-mode)

(add-hook 'python-mode-hook 'blacken-mode)

;; Copy to Wayland clipboard, in addition to usual kill ring:
;; (Adapted from https://www.emacswiki.org/emacs/CopyAndPaste#h5o-4 / https://gist.github.com/yorickvP/6132f237fbc289a45c808d8d75e0e1fb)
;; (This is useful because Emacs wraps long lines in various ways, so terminal emulators' builtin copying gets nasty.)
(when (executable-find "wl-copy")
  (defun wl-copy (text)
    (let ((p (make-process :name "wl-copy"
                           :command '("wl-copy")
                           :connection-type 'pipe)))
      (process-send-string p text)
      (process-send-eof p)))
  (setq interprogram-cut-function 'wl-copy))

;; TODO move package-selected-packages out of custom-set-variables, because I've started setting it by hand...
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(
     blacken
     clang-format
     dockerfile-mode
     elixir-mode
     go-mode
     markdown-mode
     prettier-js
     )))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

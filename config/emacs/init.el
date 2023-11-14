(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(setq make-backup-files nil)
(setq-default indent-tabs-mode nil)
(menu-bar-mode -1)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(add-hook 'c-mode-hook (lambda () (add-hook 'before-save-hook 'clang-format-buffer nil 'local)))
(add-hook 'c++-mode-hook (lambda () (add-hook 'before-save-hook 'clang-format-buffer nil 'local)))
(add-hook 'glsl-mode-hook (lambda () (add-hook 'before-save-hook 'clang-format-buffer nil 'local)))

;; (add-hook 'elixir-mode-hook (lambda () (add-hook 'before-save-hook 'elixir-format nil 'local)))

(add-hook 'markdown-mode-hook 'prettier-js-mode)

(add-hook 'python-mode-hook 'blacken-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(blacken prettier-js markdown-mode clang-format elixir-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

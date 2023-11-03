(setq-default indent-tabs-mode nil)
(menu-bar-mode -1)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

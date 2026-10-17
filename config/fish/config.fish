
fish_add_path -g ~/.npm-global/bin

export EDITOR=emacs

/home/harold/.local/bin/mise activate fish | source

if status is-interactive
    # Commands to run in interactive sessions can go here
    fzf_key_bindings

    # make Control-L clear entire scrollback, instead of just the screen:
    bind \cl 'clear; commandline -f repaint'
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    export EDITOR=emacs
    fzf_key_bindings
end


# make Control-L clear entire scrollback, instead of just the screen
bind \cl 'clear; commandline -f repaint'

/home/harold/.local/bin/mise activate fish | source

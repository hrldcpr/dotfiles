if status is-interactive
    # Commands to run in interactive sessions can go here
    export EDITOR=emacs
    fzf_key_bindings
    [ -e ~/.asdf/asdf.fish ] && . ~/.asdf/asdf.fish
end

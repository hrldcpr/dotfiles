if status is-interactive
    # Commands to run in interactive sessions can go here
    export EDITOR=emacs
    fzf_key_bindings
    . ~/.asdf/asdf.fish
end

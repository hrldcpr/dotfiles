if status is-interactive
    # Commands to run in interactive sessions can go here
    fzf_key_bindings
    . ~/.asdf/asdf.fish
    # stop firefox from using xwayland:
    set --export MOZ_ENABLE_WAYLAND 1
end

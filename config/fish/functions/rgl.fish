function rgl -d "ripgrep piped through less, with color"
  rg -p $argv | less -R
end

### About
My preferred configuration for `Zsh`, `Tmux`, `Neovim`, `GHCi` and `Xmonad`.
******

![Screen Shot](./assets/f14c9352197ee26c7855848611b2ea76.png)

<hr />


```
Usage: doi <command> <target> [options]

  COMMANDS:
    ln   Create symlinks for selected dotfiles (default: zsh only)
    rm   Remove symlinks and any files created during ln

  TARGETS:
    -a   Install all     dotfiles
    -z   Install Zsh     dotfiles
    -t   Install Tmux    dotfiles
    -g   Install GHCi    dotfiles
    -n   Install Neovim  dotfiles
    -x   Install X11     dotfiles

  OPTIONS:
    -i   Install package dependencies for chosen dotfiles (ln only)
    -f   Force ln to backup existing files instead of failing
    -v   Verbose output
```

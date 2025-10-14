# dotfiles

My dotfiles that have grown organically over the years.

## Setup

* Install [OMZ](https://ohmyz.sh/)
* Install [vim-plug](https://github.com/junegunn/vim-plug)

### Vim

When first setting up `vim-plug` or installing new plugins, open a vim editor and run `:PlugInstall` or run
`vim +PlugInstall`.

### Symlinks

Run `./scripts/setup.sh` to setup symlinks.

### GPG Key

The `.gitconfig` in this repository expects a GPG key for signing git commits. After running `./scripts/setup.sh`,
follow the logged instructions to setup your GPG key.

# dotfiles

> weland's config files

[中文版](./README_cn.md)

<!-- TOC GFM -->

* [zsh](#zsh)
* [doom emacs](#doom-emacs)
* [vimrc](#vimrc)

<!-- /TOC -->

## zsh
- use ohmyzsh and some plugins
- http proxy
- nix	package manager
- some alias
## doom emacs

- org-pomo

## vimrc

this configfile is designed for simple text

dependence: [vim-plug](https://github.com/junegunn/vim-plug)

for vim user:
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

- rainbow
- auto complete based on dict and buffer
- tab switch
- file tree

follow are some keymaps:

| Shortcut | Action   |
|----------|----------|
| `Q`      | exit vim |
| `S`      | save file |
| `C-n`    | nerdtree  |


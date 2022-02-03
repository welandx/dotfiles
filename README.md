# dotfiles

> weland's config files

[中文版](./README_cn.md)

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->
**Table of Contents**

- [dotfiles](#dotfiles)
- [zsh](#zsh)
- [doom emacs](#doom-emacs)
- [vimrc](#vimrc)
- [awesome](#awesome)

<!-- markdown-toc end -->


## zsh
- use ohmyzsh and some plugins
- http proxy
- nix	package manager
- some alias
## doom emacs

1. emacs-rime: chinese input method for emacs;
   this section def the auto en/zh switch
2. lsp: use eglot, clangd backend for C++
3. ui: org-mode, fonts(Sarasa), alpha-background(opacity)
4. App: telega(tdlib proxy)
        eaf(browser pdf rss org)
5. org-mode: xenops(for latex) org-roam
6. other: keyfreq

## vimrc

> this configfile is designed for simple text, for further use : [theniceboy](https://github.com/theniceboy/nvim)

dependence: [vim-plug](https://github.com/junegunn/vim-plug)

for vim user on Unix:
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
| `t`    | in nerdtree: open file in new tab  |
| `<F5>`    | xtabline-mode-switch  |
| `"nums"+<BS>`    | xtabline-tab-switch  |

some vim default keymaps:

for further information: [vim cheatsheet](https://vim.rtorr.com/lang/zh_cn)

|Shortcut|Action|
|--------|------|
|`I`,`A`|insert|
|`w`,`e`,`b`|move cursor by words|
|`K`|show keyword help|
|`$`,`0`|line head and end|

## awesome

fork from ayamir/dotfiles

add a start sh and modify some keymap;
split one file to servral moudles

# dotfiles

> weland Linux 配置文件


<!-- vim-markdown-toc GFM -->

* [zshrc](#zshrc)
* [vimrc](#vimrc)
    * [auto complete](#auto-complete)
    * [tabline](#tabline)
    * [文件树](#文件树)
    * [markdown-toc](#markdown-toc)

<!-- vim-markdown-toc -->

## zshrc

使用了ohmyzsh

配置了命令高亮、命令历史、命令建议

双击<Esc>为命令添加`sudo`

`git`简化指令

定义了一些常用别名：

|缩写|全称|
|----|----|
|`ne`|neofetch|
|`ra`|ranger|

## vimrc

> 该vimrc是为简单的文本处理设计的，需要高级特性的地方我使用的是根据 [theniceboy](https://github.com/theniceboy/nvim)的`neovim`配置修改的配置文件，`neovim`版本为`0.6`

### auto complete 
简单的输入提示，默认对`text`,`markdown`,`php`启用

### tabline

### 文件树
nerdtree 

### markdown-toc

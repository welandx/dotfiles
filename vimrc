call plug#begin('~/.vim/plugged')
" normal text auto complete
Plug 'skywind3000/vim-auto-popmenu'  
Plug 'skywind3000/vim-dict'  

" let vim seem colorful
Plug 'luochen1990/rainbow'
Plug 'RRethy/vim-illuminate'
Plug 'Yggdroot/indentLine'
Plug 'NLKNguyen/papercolor-theme'

" tabline
Plug 'mg979/vim-xtabline'
Plug 'preservim/nerdtree'
Plug 'welandx/eleline.vim'

" markdown enhance
Plug 'mzlogin/vim-markdown-toc'

call plug#end()

"-----------------------
"---keybind-------------
"-----------------------
let mapleader=","
" quit and save
nnoremap Q :q<CR> 
nnoremap S :w<CR>
" v-block-mode for windows terminal
" nnoremap <leader>v 

" nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

inoremap ( ()<esc>:let leavechar=")"<cr>i
inoremap [ []<esc>:let leavechar="]"<cr>i
inoremap { {}<esc>:let leavechar="}"<cr>i
"inoremap  {<esc>o}<esc>:let leavechar="}"<cr>O
inoremap ' ''<esc>:let leavechar="'"<cr>i
inoremap " ""<esc>:let leavechar='"'<cr>i
inoremap ` ``<esc>:let leavechar="`"<cr>i
"inoremap <leader>1 ()<esc>:let leavechar=")"<cr>i
"inoremap <leader>2 []<esc>:let leavechar="]"<cr>i
"inoremap <leader>3 {}<esc>:let leavechar="}"<cr>i
"inoremap <leader>4 {<esc>o}<esc>:let leavechar="}"<cr>O
"inoremap <leader>q ''<esc>:let leavechar="'"<cr>i
"inoremap <leader>w ""<esc>:let leavechar='"'<cr>i

"-----------------------
"---plugconfig----------
"-----------------------


" enable this plugin for filetypes, '*' for all files.
" let g:apc_enable_ft = {'*':1}
let g:apc_enable_ft = {'text':1, 'markdown':1, 'php':1}

" source for dictionary, current or other loaded buffers, see ':help cpt'
set cpt=.,k,w,b

" don't select the first item.
set completeopt=menu,menuone,noselect

" suppress annoy messages.
set shortmess+=c

" rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\   'ctermfgs': ['lightyellow', 'lightcyan','lightblue', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}

" vim-illuminate
" Time in milliseconds (default 0)
let g:Illuminate_delay = 750 
let g:Illuminate_ftblacklist = ['nerdtree']


" eleline
set laststatus=2

" indentLine
let g:indentLine_enabled = 1
let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level           = 2  " 从第二层开始可视化显示缩进

" vim-markdown-toc"
" Type ":Gen" then tab, you'll see some options

" other things"
set nu              " 显示行号
set incsearch       " 增量式搜索
set hlsearch        " 搜索时，高亮显示匹配结果。
set ignorecase      " 搜索时忽略大小写
" tab转化为4个字符
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
" command complete
set wildmenu
set wildmode=longest:list,full
" color
set t_Co=256
set t_ut=n
syntax on
set background=dark
colorscheme PaperColor


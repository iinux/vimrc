" execute pathogen#infect()
" source ~/DealOperator/DealOperator.vim


" 定义快捷键的前缀，即<Leader>
let mapleader=";"


"autocmd vimenter * NERDTree
"autocmd! BufWritePost *.php :!php -l %


map <C-n> :NERDTreeToggle<CR>
"map <C-m> :TlistToggle<CR>
"noremap <C-l> :Phplint<CR>
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p


function! PhpSyntaxOverride()
	hi! def link phpDocTags  phpDefine
	hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
	autocmd!
	autocmd FileType php call PhpSyntaxOverride()
augroup END


filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" Plugin 'DealOperator'
Plugin 'nerdtree'
Plugin 'vim-scripts/taglist.vim'
" Plugin 'vim-scripts/FindInNERDTree'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///c/Users/aibang/.vim/bundle/nerdtree/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" 进行语法检验，颜色显示
syntax on
" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
set wildmenu
" 高亮度反白
set hlsearch
" 自动缩排
set autoindent
" 可显示最后一行的状态
set ruler
" 左下角那一行的状态
set showmode
" 可以在每一行的最前面显示行号
set nu
" 自动折行
set wrap
" 将tab替换为相应数量空格
set expandtab
set smartindent
" 可随时用倒退键删除
set backspace=2
" 显示不同的底色色调
set bg=dark
set shiftwidth=4

set tabstop=4
" set ts=4

set softtabstop=4
" 设置内部编码为utf8
set encoding=utf8
" 当前编辑的文件编码
set fileencoding=utf8
set fileencodings=uft8-bom,utf8,gbk,gb2312,big5

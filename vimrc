execute pathogen#infect()
" source ~/DealOperator/DealOperator.vim


" 定义快捷键的前缀，即<Leader>
let mapleader=";"


"autocmd vimenter * NERDTree
"autocmd! BufWritePost *.php :!php -l %


map <C-n> :NERDTreeToggle<CR>
map <C-m> :TlistToggle<CR>
"noremap <C-l> :Phplint<CR>
noremap <C-l> :!php -l %<CR>
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
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'zhenyangze/vim-bitoai'
call vundle#end()
filetype plugin indent on
" To ignore plugin indent changes, instead use:
"filetype plugin on

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

set pastetoggle=<F11>

" highlight Search ctermbg=yellow ctermfg=black 
" highlight IncSearch ctermbg=black ctermfg=yellow 
" highlight MatchParen cterm=underline ctermbg=NONE ctermfg=NONE

" 当光标一段时间保持不动了，就禁用高亮
"autocmd cursorhold * set nohlsearch
" 当输入查找命令时，再启用高亮
"noremap n :set hlsearch<cr>n
"noremap N :set hlsearch<cr>N
"noremap / :set hlsearch<cr>/
"noremap ? :set hlsearch<cr>?
"noremap * *:set hlsearch<cr>

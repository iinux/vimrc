" ============================================================
" .vimrc  —  本地增强版 (macOS / 日常开发机)
" 依赖 vim-plug 插件管理器,首次使用见文末安装说明
" 在服务器版 (.vimrc-server) 基础上,加了文件树、模糊搜索、
" Git 状态、状态栏美化,适合日常写 Java/脚本用
" ============================================================

set nocompatible

" ---------- 基础显示 ----------
syntax on
set number
set relativenumber
set cursorline
set ruler
set showcmd
set showmatch
set wrap
set scrolloff=5
set laststatus=2
set termguicolors              " 真彩色,配合下面的配色主题

" ---------- 编码 ----------
set encoding=utf-8
set fileencodings=utf-8,gbk,gb2312,gb18030

" ---------- 缩进 & Tab ----------
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent

" ---------- 搜索 ----------
set hlsearch
set incsearch
set ignorecase
set smartcase

" ---------- 编辑体验 ----------
set backspace=indent,eol,start
" set mouse=a
set wildmenu
set wildmode=list:longest,full
set clipboard=unnamed
set updatetime=300
set timeoutlen=500
set autoread
set noswapfile
set nobackup
set nowritebackup
set hidden
set foldmethod=indent
set foldlevelstart=99

let mapleader = ","

" ============================================================
" 插件 (vim-plug)
" ============================================================
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'          " 文件树
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'            " 模糊查找文件/内容 (:Files :Rg)
Plug 'airblade/vim-gitgutter'      " 左侧栏显示 git diff 标记
Plug 'tpope/vim-fugitive'          " :Git blame / :Git diff 等
Plug 'vim-airline/vim-airline'     " 好看的状态栏
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'          " cs"' 这种包裹符号快速修改
Plug 'jiangmiao/auto-pairs'        " 自动补全括号引号
Plug 'sheerun/vim-polyglot'        " 一揽子语法高亮(含 Java/Thrift/YAML)
Plug 'morhetz/gruvbox'             " 配色主题
"Plug 'neoclide/coc.nvim'         " 代码补全 + LSP

call plug#end()

" ---------- 主题 ----------
set background=dark
silent! colorscheme gruvbox
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1   " 顶部显示 buffer 列表

" ============================================================
" 快捷键
" ============================================================
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader><space> :nohlsearch<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap j gj
nnoremap k gk

vnoremap < <gv
vnoremap > >gv

" NERDTree
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>

" fzf:全局文件搜索 / 内容搜索(需要系统装了 ripgrep: brew install ripgrep)
nnoremap <C-p> :Files<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>b :Buffers<CR>

" gitgutter 逐块跳转
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" ============================================================
" 针对代码文件的补充
" ============================================================
filetype plugin indent on

highlight ColorColumn ctermbg=DarkGrey guibg=#3c3836
call matchadd('ColorColumn', '\%121v', 100)

autocmd FileType yaml,json,thrift setlocal tabstop=2 shiftwidth=2 softtabstop=2

" ============================================================
" 首次使用安装说明(读完可删除这段注释)
" ============================================================
" 1. 安装 vim-plug:
"    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" 2. 把本文件保存为 ~/.vimrc
" 3. 打开 vim,执行 :PlugInstall 安装所有插件
" 4. (可选) brew install ripgrep   —— 让 :Rg 内容搜索可用

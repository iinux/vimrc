execute pathogen#infect()
syntax on
set nu
set hlsearch
set ts=4
set expandtab

filetype plugin indent on

"autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>

function! PhpSyntaxOverride()
	hi! def link phpDocTags  phpDefine
	hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
	autocmd!
	autocmd FileType php call PhpSyntaxOverride()
augroup END

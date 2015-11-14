"use vundle to manage plugin, required turn file type off an nocopatible                       
"clang.llvm.org
"gnome-terminal --maximize
filetype off
set nocompatible
filetype plugin on
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'taglist.vim'
Bundle 'Valloric/YouCompleteMe'
set nu
syntax on
syntax enable
set tabstop=3
filetype indent on
set hlsearch
set incsearch
set noswapfile
set nobackup
set cindent
set noexpandtab
set smarttab
set autoindent
set softtabstop=3
set shiftwidth=3
set completeopt=longest,menu 
set history=1000
set background=dark
inoremap < <><ESC>i
inoremap > <c-r>=ClosePair('>')<CR>
inoremap ( ()<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { {<CR>}<ESC>O
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction
let Tlist_Auto_Open = 1
let Tlist_Auto_Update = 1
let Tlist_Exit_OnlyWindow = 1
let g:ycm_filetype_blacklist = {
			\ 'tagbar' : 1,
			\ 'qf' : 1,
			\ 'notes' : 1,
			\ 'markdown' : 1,
			\ 'unite' : 1,
			\ 'text' : 1,
			\ 'vimwiki' : 1,
			\ 'pandoc' : 1,
			\ 'infolog' : 1,
			\ 'mail' : 1
			\}
nnoremap gl :YcmCompleter GoToDeclaration<CR>
nnoremap gf :YcmCompleter GoToDefinition<CR>
let g:ycm_error_symbol = 'x'
let g:ycm_warning_symbol = '!'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_cache_omnifunc = 0
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <silent> <F8> :TlistToggle<CR>
nnoremap <F12> :!ctags -R<CR>

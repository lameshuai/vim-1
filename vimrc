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
Bundle 'The-NERD-tree'
Bundle 'Valloric/YouCompleteMe'
set nu
set ic
set fileencoding=UTF-8 
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
set backspace=indent,eol,start
inoremap < <><ESC>i
inoremap > <c-r>=ClosePair('>')<CR>
inoremap ( ()<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { {}<ESC>i
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=ClosePair(']')<CR>
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction
let Tlist_Auto_Update = 1
let Tlist_Compact_Format = 1 
let Tlist_Exit_OnlyWindow = 1 
let Tlist_Enable_Fold_Column = 0 
let Tlist_Use_Right_Window = 1 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
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
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_cache_omnifunc = 0
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_min_num_of_chars_for_completion= 2
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_show_diagnostics_ui = 1
let g:ycm_open_loclist_on_ycm_diags = 0
let g:ycm_error_symbol = '✗'
let g:ycm_warning_symbol = '⚠'
highlight YcmErrorSection guibg= 0
highlight YcmWarningSection guibg= 0
nnoremap gl :YcmCompleter GoToDeclaration<CR>
nnoremap gf :YcmCompleter GoToDefinition<CR>
nnoremap <silent> <F4> :NERDTreeToggle<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <silent> <F8> :TlistToggle<CR>
nnoremap <F9> :YcmCompleter FixIt<CR>
nnoremap <F12> :!ctags -R<CR>

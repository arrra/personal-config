set nocompatible
filetype on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


""""""""""""""""""""""""""""""""""""""""""
" => Vim plugin
"""""""""""""""""""""""""""""""""""""""""""


Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'godlygeek/tabular'
Plugin 'bling/vim-airline'
Plugin 'pangloss/vim-javascript'
Plugin 'bling/vim-bufferline'
Plugin 'tpope/vim-fugitive'
Plugin 'JavaScript-Indent'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'kien/ctrlp.vim'
Bundle 'ntpeters/vim-better-whitespace'
Plugin 'digitaltoad/vim-jade'
Plugin 'scrooloose/nerdcommenter'

call vundle#end()

filetype plugin indent on


""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""


set number
set noswapfile
set nowb
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab


""""""""""""""""""""""""""""""""""""""""""
" => Key Mapping/Toggle
"""""""""""""""""""""""""""""""""""""""""""


"map leader
let mapleader = ","
"fast save and quit
nmap <leader>w :w!<cr>
nmap <leader>q :q!<cr>
"nerdtree shortcut CTR+n
map <C-n> :NERDTreeToggle<CR>
"Ctrlp map
let g:ctrlp_map = '<c-p>'
"neocomplcache
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>


""""""""""""""""""""""""""""""""""""""""""
" => solarized theme
"""""""""""""""""""""""""""""""""""""""""""


syntax enable
set background=dark
let g:solarized_termcolors=   256
let g:solarized_termtrans =   0
let g:solarized_degrade   =   0
let g:solarized_bold      =   1
let g:solarized_underline =   1
let g:solarized_italic    =   1
let g:solarized_termcolors=256
colorscheme solarized


""""""""""""""""""""""""""""""""""""""""""
" => Airline
"""""""""""""""""""""""""""""""""""""""""""


let g:airline_powerline_fonts = 1
set laststatus=2
set nocompatible
set laststatus=2
set encoding=utf-8
set t_Co=256

if !exists('g:airline_symbols')
	    let g:airline_symbols = {}
    endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


""""""""""""""""""""""""""""""""""""""""""
" => Syntastic
"""""""""""""""""""""""""""""""""""""""""""


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checkers = ['jshint','jslint']
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1


""""""""""""""""""""""""""""""""""""""""""
" => neocomplacache
"""""""""""""""""""""""""""""""""""""""""""


let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


""""""""""""""""""""""""""""""""""""""""""
" => Vim-better-whitespace
"""""""""""""""""""""""""""""""""""""""""""


highlight ExtraWhitespace ctermbg=red
autocmd FileType <javascript> autocmd BufWritePre <buffer> StripWhitespace




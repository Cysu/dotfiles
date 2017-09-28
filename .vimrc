" Vundle {{{
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'                  " plugin manager
Plugin 'rking/ag.vim'                          " silver search
Plugin 'kien/ctrlp.vim'                        " fuzzy search
Plugin 'vim-airline/vim-airline'               " status bar
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-syntastic/syntastic'               " syntax check
Plugin 'scrooloose/nerdtree'                   " file explorer
Plugin 'Shougo/neocomplete.vim'                " autocomplete
Plugin 'tpope/vim-surround'                    " quoting / parenthesizing
call vundle#end()
filetype plugin indent on
" }}}

" Colors {{{
set background=dark
syntax enable
" }}}

" Misc {{{
set backspace=indent,eol,start
set nobackup
set title
set ttyfast
" }}}

" Spaces and Tabs {{{
set expandtab
set tabstop=4         " width of the <TAB> character in files
set softtabstop=4     " spaces when pressing <TAB> and <BS> keys
set shiftwidth=4      " spaces when pressing <<, >>, and ==
filetype indent on    " load filetype-specific indent files
filetype plugin on
set autoindent
" }}}

" UI Layout {{{
set number            " line number
set showcmd           " last command at bottom
set ruler             " vertical ruler
set wildmenu          " visual autocomplete for command menu
set showmatch         " highlight matching {[()]}
set lazyredraw          " redraw only needed
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
" }}}

" Searching {{{
set ignorecase
set incsearch
set hlsearch
" }}}

" Folding {{{
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
nnoremap <space> za
" }}}

" Movement {{{
set mouse=a
nnoremap j gj
nnoremap k gk
" }}}

" Leader Shortcuts {{{
let mapleader=","
" ,s to save session, vim -S reopen
nnoremap <leader><space> :noh<CR>
nnoremap <leader>s :mksession<CR>
nnoremap <leader>a :Ag
" }}}

" CtrlP {{{
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_custom_ignore = '\vbuild/|dist/|venv/|target/|\.(o|swp|pyc|egg)$'
" }}}

" Airline {{{
let g:airline_theme = 'luna'
let g:airline_left_sep = ''
let g:airline#extensions#tabline#enabled = 1
" }}}

" Syntastic {{{
map <C-x> :SyntasticCheck<CR>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {"mode": "passive"}
" }}}

" NERDTree {{{
map <C-e> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '\.git$']
" }}}

" NeoComplete {{{
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" }}}

" AutoGroups {{{
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd FileType cpp,c,cxx,h,hpp setlocal tabstop=2
    autocmd FileType cpp,c,cxx,h,hpp setlocal shiftwidth=2
    autocmd FileType cpp,c,cxx,h,hpp setlocal softtabstop=2
    autocmd FileType make setlocal set noexpandtab
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
    autocmd BufEnter *.md setlocal ft=markdown
augroup END
" }}}

" vim:foldmethod=marker:foldlevel=0

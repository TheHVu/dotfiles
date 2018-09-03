
"/////////////////////////////////////////////////////////////////////////////////
"For installing plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'haya14busa/incsearch.vim' "for auto highlight search
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' } "For autocomplete (for all) 
Plug 'vhda/verilog_systemverilog.vim' "for syntax highlight
"Plug 'ctrlpvim/ctrlp.vim' "for ctrlp plug in
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets' "snippets for ultisnips
Plug 'ervandew/supertab' 
Plug 'tpope/vim-surround' "for suround operations.
Plug 'vim-syntastic/syntastic' "for checking the every language syntax, not for verilog because of verilog_systemverilog
Plug 'vim-scripts/indentpython.vim' "auto index for python
"Plug 'tpope/vim-commenary' "for make comments
"tPlug 'majutsushi/tagbar' "for tagbar view
Plug 'junegunn/fzf.vim' "for searching content in vim, require Ag (the_silver_searcher installed before.
Plug '~/.fzf'
Plug 'kien/ctrlp.vim' "for full path fuzzy file, buffer, mru, tag, ... finder for Vim
call plug#end()

"/////////////////////////////////////////////////////////////////////////////////
"General setting
language  en_US
syntax on "Turn on syntax
set number
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoread    "auto read from other application
au CursorHold * checktime  
set autowrite   "auto write
set autoindent

"toogle absolute and relative numbering
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber 

"color setting
colorscheme gruvbox "set colorscheme
set background=dark "set dark background
let g:airline_theme='dark' "set theme for airline_theme

"set spell 	"For checking spelling
nmap <F8> :TagbarToggle<CR> 

" Move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
map <C-h> <C-W>h
imap jj <Esc>

"NERDTree seting
map <C-n> :NERDTreeToggle<CR>	"For On/off NERDTree

"Python setting
au BufNewFile,BufRead *.py set
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79
    \ expandtab
    \ autoindent
    \ fileformat=unix
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"/////////////////////////////////////////////////////////////////////////////////
"Setting for the_silver_searcher
set rtp+=~/.fzf
let $FZF_DEFAULT_COMMAND = 'ag --hidden -g ""'
nnoremap <c-f> :Ag<CR>
nnoremap <c-p> :Files<CR>

"Automatic search highlight fron insearch.vim plugin
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" :h g: insearch#auto_nohlsearch
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

"/////////////////////////////////////////////////////////////////////////////////
"For vimdiff function
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

"/////////////////////////////////////////////////////////////////////////////////
"For ultisnips configuration with youcompleteme usung supper tab
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"/////////////////////////////////////////////////////////////////////////////////
"Basic setup for synthetic plugin
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"////////////////////////////////////
"////////////////////////////////////
"setup for kien/ctrlp
"Change the default mapping and the default command to invoke CtrlP:
let g:ctrlp_map = '<c-p>' "turn on/off
let g:ctrlp_cmd = 'CtrlP'
"set local working directory
let g:ctrlp_working_path_mode = 'ra' "
"'c' - the directory of the current file.
"'r' - the nearest ancestor that contains one of these directories or files: .git .hg .svn .bzr _darcs
"'a' - like c, but only if the current working directory outside of CtrlP is not a direct ancestor of the directory of the current file.
"0 or '' (empty string) - disable this feature.

"/////////////////////////////////////////////////////////////////////////////////
"Map key for Verilog direction
"imap Jl          0000001
"imap Jn            0000010
"imap Je            0000100
"imap Js            0001000
"imap Jw            0010000
"imap Ju            0100000
"imap Jd            1000000
"
"imap J000 000_000_000
"imap J001 000_000_001
"imap J002 000_000_010
"imap J010 000_001_000
"imap J011 000_001_001
"imap J012 000_001_010
"imap J020 000_010_000
"imap J021 000_010_001
"imap J022 000_010_010
"
"
"imap J100 001_000_000
"imap J101 001_000_001
"imap J102 001_000_010
"imap J110 001_001_000
"imap J111 001_001_001
"imap J112 001_001_010
"imap J120 001_010_000
"imap J121 001_010_001
"imap J122 001_010_010
"
"
"imap J200 010_000_000
"imap J201 010_000_001
"imap J202 010_000_010
"imap J210 010_001_000
"imap J211 010_001_001
"imap J212 010_001_010
"imap J220 010_010_000
"imap J221 010_010_001
"imap J222 010_010_010
"
"
"imap J300 010_000_000
"imap J301 010_000_001
"imap J302 010_000_010
"imap J310 010_001_000
"imap J311 010_001_001
"imap J312 010_001_010
"imap J320 010_010_000
"imap J321 010_010_001
"imap J322 010_010_010

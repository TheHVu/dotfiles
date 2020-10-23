
"g:python[3]_host_prog = '/anaconda3/envs/apps_3.7/bin/python3'
"/////////////////////////////////////////////////////////////////////////////////
"For installing plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'haya14busa/incsearch.vim' "for auto highlight search
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py' } "For autocomplete (for all) 
Plug 'Valloric/YouCompleteMe', {'on' : []} " disable YMC
Plug 'vhda/verilog_systemverilog.vim' "for syntax highlight
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets' "snippets for ultisnips
Plug 'ervandew/supertab' 
Plug 'tpope/vim-surround' "for suround operations.
"Plug 'vim-syntastic/syntastic' "for checking the every language syntax, not for verilog because of verilog_systemverilog
"Plug 'vim-scripts/indentpython.vim' "auto index for python
Plug 'junegunn/fzf.vim' "for searching content in vim, require Ag (the_silver_searcher installed before.
Plug '~/.fzf'
Plug 'kien/ctrlp.vim' "for full path fuzzy file, buffer, mru, tag, ... finder for Vim
Plug 'jiangmiao/auto-pairs'
Plug 'lervag/vimtex', {'for': 'tex'}
Plug 'terryma/vim-multiple-cursors'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'davidhalter/jedi-vim' "for autocomplete
call plug#end() 

let g:deoplete#enable_at_startup = 1 "setup for deoplete
"/////////////////////////////////////////////////////////////////////////////////
"General setting
let mapleader = " "
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
set showcmd "show command

"toogle absolute and relative numbering
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber 

"color setting
colorscheme gruvbox "set colorscheme
set background=dark "set dark background
let g:airline_theme='dark' "set theme for airline_theme

"set spell 	"For checking spelling
set spell spelllang=en_us
nmap <F8> :TagbarToggle<CR> 

" Move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
map <C-h> <C-W>h
imap jj <Esc>

" map CTRL-E to end-of-line (insert mode)
imap <C-e> <esc>$i<right>
" map CTRL-A to beginning-of-line (insert mode)
imap <C-a> <esc>0i

"NERDTree seting
map <C-o> :NERDTreeToggle<CR>	"For On/off NERDTree

"Python setting
au BufNewFile,BufRead *.py set
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
"    \ textwidth=79
    \ expandtab
    \ autoindent
    \ fileformat=unix
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'


"setup for vimtex
let g:tex_flavor = 'latex'
map <leader>lt :VimtexTocOpen<CR>
map <leader>lc :VimtexCompile<CR>
map <leader>lv :VimtexView<CR>
map <leader>ls :VimtexStop<CR>
"let g:vimtex_latexmk_progname= 'nvr'
if has('nvim')
  let g:vimtex_compiler_progname = 'nvr'
endif
let g:vimtex_latexmk_options="-pdf -pdflatex='pdflatex -file-line-error -shell-escape -synctex=1'"
let g:vimtex_fold_enabled = 0
let g:vimtex_toc_resize = 0
let g:vimtex_toc_hide_help = 1
let g:vimtex_indent_enabled = 1
let g:vimtex_latexmk_enabled = 1
let g:vimtex_latexmk_callback = 1
let g:vimtex_complete_recursive_bib = 0
let g:vimtex_view_method = 'zathura'
let g:vimtex_complete_close_braces = 1
let g:vimtex_quickfix_mode = 2
let g:vimtex_quickfix_open_on_warning = 1
let g:vimtex_quickfix_ignored_warnings = [
        \ 'Underfull',
        \ 'Overfull',
        \ 'specifier changed to',
      \ ]


let g:vimtex_compiler_latexmk = {
\ 'backend' : 'nvim',
\ 'background' : 1,
\ 'build_dir' : '',
\ 'callback' : 1,
\ 'continuous' : 1,
\ 'executable' : 'latexmk',
\ 'options' : [
\   '-pdf',
\   '-verbose',
\   '-file-line-error',
\   '-synctex=1',
\   '-interaction=nonstopmode',
\ ],
\}


"/////////////////////////////////////////////////////////////////////////////////
"Setting for the_silver_searcher
set rtp+=~/.fzf
let $FZF_DEFAULT_COMMAND = 'ag --hidden -g ""'
nnoremap <c-f> :Ag<CR>
nnoremap <c-s> :Files<CR>

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
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
" this mapping Enter key to <C-y> to chose the current highlight item 
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"/////////////////////////////////////////////////////////////////////////////////
"Basic setup for synthetic plugin
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
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
imap Jl          0000001
imap Jn            0000010
imap Je            0000100
imap Js            0001000
imap Jw            0010000
imap Ju            0100000
imap Jd            1000000

"imap J00 0000_0000_0000
"imap J01 0000_0000_0001
"imap J02 0000_0000_0010
"imap J03 0000_0000_0011
"imap J04 0000_0000_0100
"imap J05 0000_0000_0101
"imap J06 0000_0000_0110
"imap J07 0000_0000_0111
"imap J08 0000_0000_1000
"
"imap J10 0000_0001_0000
"imap J11 0000_0001_0001
"imap J12 0000_0001_0010
"imap J13 0000_0001_0011
"imap J14 0000_0001_0100
"imap J15 0000_0001_0101
"imap J16 0000_0001_0110
"imap J17 0000_0001_0111
"imap J18 0000_0001_1000
"
"imap J20 0000_0010_0000
"imap J21 0000_0010_0001
"imap J22 0000_0010_0010
"imap J23 0000_0010_0011
"imap J24 0000_0010_0100
"imap J25 0000_0010_0101
"imap J26 0000_0010_0110
"imap J27 0000_0010_0111
"imap J28 0000_0010_1000

imap J000 000_000_000
imap J001 000_000_001
imap J002 000_000_010
imap J003 000_000_011
imap J004 000_000_100
imap J010 000_001_000
imap J011 000_001_001
imap J012 000_001_010
imap J013 000_001_011
imap J014 000_001_100
imap J020 000_010_000
imap J021 000_010_001
imap J022 000_010_010
imap J023 000_010_011
imap J024 000_010_100
imap J030 000_011_000
imap J031 000_011_001
imap J032 000_011_010
imap J033 000_011_011
imap J034 000_011_100
imap J040 000_100_000
imap J041 000_100_001
imap J042 000_100_010
imap J043 000_100_011
imap J044 000_100_100
"
"imap J100 001_000_000
"imap J101 001_000_001
"imap J102 001_000_010
"imap J103 001_000_011
"imap J104 001_000_100
"imap J110 001_001_000
"imap J111 001_001_001
"imap J112 001_001_010
"imap J113 001_001_011
"imap J114 001_001_100
"imap J120 001_010_000
"imap J121 001_010_001
"imap J122 001_010_010
"imap J123 001_010_011
"imap J124 001_010_100
"imap J130 001_011_000
"imap J131 001_011_001
"imap J132 001_011_010
"imap J133 001_011_011
"imap J134 001_011_100
"imap J140 001_100_000
"imap J141 001_100_001
"imap J142 001_100_010
"imap J143 001_100_011
"imap J144 001_100_100

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

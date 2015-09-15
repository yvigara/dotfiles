" Leader
let mapleader = " "

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=500
set ruler         " show the cursor position all the time
set cursorline
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set hidden

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" Plugins Installation: {{{

if filereadable(expand("~/.vimrc.plugins"))
  source ~/.vimrc.plugins
endif

"}}}

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

filetype plugin indent on

" Gruvbox Config: {{{

if !has("gui_running")
  let g:gruvbox_italic=0
endif
set encoding=utf-8
set t_Co=256
set term=xterm-256color
set termencoding=utf-8
set background=dark
colorscheme gruvbox

" }}}
" AirLine Config: {{{

let g:airline_theme='hybrid'
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:bufferline_echo = 0
let g:airline_left_sep=''
let g:airline_right_sep=''
"let g:airline_section_z=''


let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ }

let g:airline_section_c = airline#section#create(['%<', '%{getcwd()}', " | ", 'file', "\ua0", 'readonly'])


let g:airline_extensions = ['branch', 'ctrlspace', 'tagbar', 'tabline', 'syntastic', 'whitespace']
let g:airline#extensions#branch#enabled = 1


let g:airline#extensions#ctrlspace#enabled = 1

let g:airline#extensions#syntastic#enabled = 1

" Tabline config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#fnamecollapse = 3
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''


nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

let g:airline#extensions#tagbar#enabled = 1

let g:airline#extensions#whitespace#symbol = '!'
let g:airline#extensions#whitespace#enabled = 1

" }}}

" CtrlSpace Config: {{{

let g:CtrlSpaceUseMouseAndArrowsInTerm = 1
let g:CtrlSpaceFileEngine = "file_engine_darwin_amd64"

" }}}

let g:syntastic_puppet_checkers=['puppetlint']
let g:syntastic_check_on_open = 1
let g:syntastic_style_error_symbol = '⚡'
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_check_on_wq = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

let g:niji_matching_filetypes = ['lisp', 'clojure', 'puppet', 'java', 'ruby', 'python', 'go']

" Tabs and indentation (Default to two spaces)
set tabstop=2 "set tab character to 4 characters
set shiftwidth=2 "indent width for autoindent
set shiftround
set expandtab "turn tabs into whitespace
set smartindent
set display+=lastline
set nojoinspaces
set hlsearch
set ignorecase
set smartcase
set showmatch
set matchtime=1
set novb
set noshowmode
set ttyfast
set lazyredraw
set magic

set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" JJM Enable line numbers, useful for discussion when on a projector
set number
set numberwidth=5

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" JJM Highlight extra white space.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
highlight TrailingWhitespace ctermbg=red guibg=red
highlight TabWhitespace ctermbg=darkgreen guibg=darkgreen
highlight DoubleSpaceAfterPeriod ctermbg=red guibg=red
autocmd Syntax * syn match TrailingWhitespace /\s\+$/
autocmd Syntax * syn match TabWhitespace /[\t]/
autocmd Syntax * syn match DoubleSpaceAfterPeriod /\.  /
" Give an indicator when we approach col 80 (>72)
"au BufWinEnter * let w:m1=matchadd('Search', '\%<81v.\%>72v', -1)
" Give a strong indicator when we exceed col 80(>80)
"au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
" Give an indicator of tailing white space.
au BufWinEnter * let w:m3=matchadd('ErrorMsg', '\s\+$', -1)
" Give an indicator of spaces before a tab.
au BufWinEnter * let w:m4=matchadd('ErrorMsg', ' \+\ze\t', -1)
au BufNewFile,BufRead *.yaml,*.yml,*.eyaml setf yaml
autocmd StdinReadPre * let s:std_in=1

"nmap <F8> :TagbarToggle<CR>
nmap <silent> <leader>t :TagbarToggle<cr>

map <C-y> :set paste<CR>
" Switch between the last two files
nnoremap <leader><leader> <c-^>

" turn off search highlighting (type <leader>n to de-select everything)
nmap <silent> <leader>/ :silent :nohlsearch<cr>

" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<space>


" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" NERDTree: {{{
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_winsize   = 25
let g:netrw_preview   = 1
nmap <silent> <leader>e :Vexplore<cr>
" General properties
"let NERDTreeDirArrows=1
"let NERDTreeMinimalUI=1
"let NERDTreeIgnore=['\.o$', '\.pyc$', '\.php\~$']
"let NERDTreeWinSize = 35

" Make sure that when NT root is changed, Vim's pwd is also updated
"let NERDTreeChDirMode = 2
"let NERDTreeShowLineNumbers = 1
"let NERDTreeAutoCenter = 1

"map <C-n> :NERDTreeToggle<CR>
"nmap <silent> <leader>n :NERDTreeToggle<cr>

"autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
"autocmd VimEnter * if !argc() | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" }}}

" Vim-go: {{{

let g:go_fmt_fail_silently = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

au FileType go set makeprg=gb

" Show a list of interfaces which is implemented by the type under your cursor
au FileType go nmap <Leader>gs <Plug>(go-implements)

" Show type info for the word under your cursor
au FileType go nmap <Leader>gi <Plug>(go-info)

" Open the relevant Godoc for the word under the cursor
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

" Open the Godoc in browser
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

" Run/build/test/coverage
au FileType go nmap <leader>gr <Plug>(go-run)
au FileType go nmap <leader>gb <Plug>(go-build)
au FileType go nmap <leader>gt <Plug>(go-test)
au FileType go nmap <leader>gc <Plug>(go-coverage)

au Filetype go setlocal ts=4 sts=4 sw=4 noexpandtab
au Filetype go hi clear  TabWhitespace

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
		\ }
" }}}

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
" vim: set noet ft=vim fdm=marker:

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" BASIC SETTINGS """""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","  " leader key
let g:mapleader=","
set nocompatible      " Use vim, no vi defaults

" Pathogen
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

""
"" Basic Setup
""
" No annoying sound on errors
set t_vb=
set noerrorbells
set novisualbell
set encoding=utf-8    " Set default encoding to UTF-8
filetype plugin on    " load ftplugins
filetype indent on    " load indent files
set hidden            " allow buffer switching without saving
set history=1000      " store commands history
set autoread          " auto read when a file is change from the outside
set clipboard=unnamed " yank to the system register (*) by default
set grepprg=ack       " replace the default grep program with ack



""
"" Display
""
set ffs=unix,dos,mac  " Try recognizing dos, unix, and mac line endings.
set number            " Show line numbers
set ruler             " Show line and column number
set showmatch         " show matching brackets when cursor is over them
set matchpairs+=<:>   " specially for html
set mat=2             " How many tenths of a second to blink when matching brackets
set t_Co=256          " enable 256-color mode.
set background=dark   " assume a dark background
colorscheme jellybeans
set cursorline        " highlight current line
syntax enable         " Turn on syntax highlighting allowing local overrides
" Use nicer representations when showing invisible characters.
set listchars=""
set listchars+=tab:\▸\ ,trail:·,extends:»,precedes:«
set showbreak=↪
" Don't render tag contents with bold, italic & underline in HTML.
let html_no_rendering=1


""
"" Whitespace and indentation
""
set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set softtabstop=2
set expandtab                     " use spaces, not tabs
set smarttab                      " Use shift-width for tabbing. Ignore tabstop & softtabstop.
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode
set autoindent                    " indent at the same level of the previous line


""
"" Searching
""
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

""
"" Backup and swap files
""
set nobackup
set nowb
set noswapfile

""
"" Statusline
""
" unless we're using powerline
if !exists('g:Powerline_loaded') || !g:Powerline_loaded
  set laststatus=2

  " Broken down into easily includeable segments
  set statusline=%<%f\                     " Filename
  set statusline+=%w%h%m%r                 " Options
  set statusline+=%{fugitive#statusline()} " Git Hotness
  set statusline+=\ [%{&ff}/%Y]            " filetype
  set statusline+=\ [%{getcwd()}]          " current dir
  set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

""
"" Folding
""
set foldmethod=marker   "detect triple-{ style fold markers
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo "which commands trigger auto-unfold

""
"" Scrolling
""
set scrolloff=8      " Number of lines from vertical edge to start scrolling
set sidescrolloff=15 " Number of cols from horizontal edge to start scrolling
set sidescroll=1     " Number of cols to scroll at a time

""
"" Completion
""
set completeopt=menu,preview,longest
set wildmode=list:longest
set wildmenu "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
" ruby
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1

" use syntax complete if nothing else available
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
              \ if &omnifunc == "" |
              \ setlocal omnifunc=syntaxcomplete#Complete |
              \ endif
endif

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

""
"" Editor
""
set formatoptions-=o 	  "dont continue comments when pushing o/O
set virtualedit=onemore " allow for cursor beyond last character
set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \ exe "normal g`\"" |
      \ endif

""
"" GUI Settings
""
if has('gui_running')
  set guioptions-=T " remove the toolbar

  " disable cursor blink
  set guicursor+=a:blinkon0
  " Disable scrollbars
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set guioptions-=L

  set lines=40
  set guifont=Ubuntu\ Mono\ 14
  set shell=/bin/zsh
endif


" treat scss files also as css
autocmd BufNewFile,BufRead *.scss             set ft=scss.css
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" PLUGINS SETTINGS """""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""
"" Zencoding
""
let g:user_zen_settings = {
  \ 'php' : {
  \ 'extends' : 'html',
  \ 'filters' : 'c',
  \ },
  \ 'xml' : {
  \ 'extends' : 'html',
  \ },
  \ 'haml' : {
  \ 'extends' : 'html',
  \ },
  \ 'erb' : {
  \ 'extends' : 'html',
  \ },
 \}

""
"" snipMate
""
let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['javascript'] = 'javascript,javascript-jquery'

""
"" Vroom
""
if $TMUX != ''
  let g:vroom_use_vimux = 1 " use vimux when running tests by vroom
end

""
"" Vimux
""
" Use exising pane (not used by vim) if found instead of running split-window.
let VimuxUseNearestPane = 1

""
"" SuperTab
""
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabContextDiscoverDiscovery =
      \ ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]
let g:SuperTabRetainCompletionDuration = 'insert'
let g:SuperTabNoCompleteBefore = []
let g:SuperTabNoCompleteAfter = ['^', '\s', ',']

""
"" NERDTree
""
" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1
" exclude
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
" quit NERDTree after openning a file
let NERDTreeQuitOnOpen=1
" Use a single click to fold/unfold directories and a double click to open files
let NERDTreeMouseMode=2
" show hidden files and directories
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30
" Highlight the selected entry in the tree
let NERDTreeHighlightCursorline = 1
let g:NERDShutUp=1

""
"" ctrlP
""
let g:ctrlp_working_path_mode = 'ra' " r - try to find root, a - current dir
let g:ctrlp_custom_ignore = {
            \ 'dir': '\.git$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$\|\.dll$' }
" jump to buffer in the same tab if already open
let g:ctrlp_switch_buffer = 1
" default by filename
let g:ctrlp_by_filename = 1

""
"" EasyMotion
""
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade Comment

""
"" solarized
""
let g:solarized_termcolors=256

""
"" Powerline
""
let g:Powerline_symbols = 'fancy'

""
"" delimitMate
""
let delimitMate_expand_cr = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" KEY MAPPINGS """""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use jk as <Esc> alternative
inoremap jk <Esc>
inoremap kj <Esc>

" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
" (it will prompt for sudo password when writing)
cmap w!! %!sudo tee > /dev/null %

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" avoid pressing shift to enter command mode
nnoremap ; :

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" system buffer mappings
map <C-c> "+y
map <Insert> :set paste<CR>"+p:set nopaste<CR>

" Toggle hlsearch with <leader>hs
nmap <leader>hs :set hlsearch! hlsearch?<CR>

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

"key mapping for window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" buffer cycling
map <F2> :bprevious<CR>
map <F3> :bnext<CR>
" switch between splits
map <Tab> <C-w>w

" splits
map <C-w>\| <C-W>v<C-W><Right>
map <C-w>- :split<cr>

" close buffer without closing window
nmap <C-w><Del> <Plug>Kwbd

" key mapping for saving file
nmap <leader>w :w<CR>
"
" Quickly close the current window
nnoremap <leader>q :q<CR>

" Do not lost block selection after indentation
vmap > >gv
vmap < <gv

" Insert blank lines without going into insert mode shortcut
nmap t o<ESC>k
nmap T O<ESC>j

" go to last edit location with ,.
nnoremap ,. '.

" Disable arrow keys
map <Left> :echo 'damnit!'<cr>
map <Right> :echo 'you suck!'<cr>
map <Up> :echo 'this is why you fail'<cr>
map <Down> :echo 'fuck you!'<cr>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" NERDTree toggle
silent! nmap <silent> <Leader>p :NERDTreeToggle<CR>

" Run all specs in tmux
map <leader>rat :call VimuxRunCommand("bundle exec rspec spec/") <CR>

" Gundo toggle
nnoremap <F5> :GundoToggle<CR>

" ZenCoding expand
let g:user_zen_leader_key = '<C-e>'

" bufexplorer
silent! map <leader>b :BufExplorer<cr>


"When typing a string, your quotes auto complete. Move past the quote
"while still in insert mode by hitting Ctrl-a. Example:
"
" type 'foo<c-a>
"
" the first quote will autoclose so you'll get 'foo' and hitting <c-a> will
" put the cursor right after the quote
imap <C-a> <esc>wa

" Get the current highlight group. Useful for then remapping the color
map ,hi :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

""
"" Tabular alignments
""
" Ruby 1.9 hashes
nmap <leader>a: :Tab/\w:\zs/l0l1<CR>
vmap <leader>a: :Tab/\w:\zs/l0l1<CR>
" Ruby hash rocket
function IndentRHashes()
  Tabularize /^[^:]*\zs:/r1c0l0
  Tabularize /^[^=>]*\zs=>/l1
endfunction
nmap <leader>a> :call IndentRHashes()<CR>
vmap <leader>a> :call IndentRHashes()<CR>
" First equals sign
nmap <leader>a= :Tabularize /^[^=]*\zs=<CR>
vmap <leader>a= :Tabularize /^[^=]*\zs=<CR>

" Folding
nnoremap <Space> za
vnoremap <Space> za

" Reselect text that was just pasted with ,v
nnoremap <leader>v V`]

""
"" Surround
""
" ,# Surround a word with #{ruby interpolation}
map ,# ysiw#
vmap ,# c#{<C-R>"}<ESC>

" ," Surround a word with "quotes"
map ," ysiw"
vmap ," c"<C-R>""<ESC>

" ,' Surround a word with 'single quotes'
map ,' ysiw'
vmap ,' c'<C-R>"'<ESC>

" ,) or ,( Surround a word with (parens)
" The difference is in whether a space is put in
map ,( ysiw(
map ,) ysiw)
vmap ,( c( <C-R>" )<ESC>
vmap ,) c(<C-R>")<ESC>

" ,[ Surround a word with [brackets]
map ,] ysiw]
map ,[ ysiw[
vmap ,[ c[ <C-R>" ]<ESC>
vmap ,] c[<C-R>"]<ESC>

" ,{ Surround a word with {braces}
map ,} ysiw}
map ,{ ysiw{
vmap ,} c{ <C-R>" }<ESC>
vmap ,{ c{<C-R>"}<ESC>


""
"" Fugitive mappings
""
nmap <leader>gs :Gstatus<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Git push<CR>
imap <C-o> <esc>o

"" Tab navigation
" Easily create a new tab.
map <Leader>tt :tabnew<CR>
" Easily close a tab.
map <Leader>tc :tabclose<CR>
" Easily move a tab.
noremap <Leader>tm :tabmove<CR>
" Easily go to next tab.
noremap <Leader>tn :tabnext<CR>
" Easily go to previous tab.
noremap <Leader>tp :tabprevious<CR>

"" shift key typos fixes
command! -bang -nargs=* -complete=file E e<bang> <args>
command! -bang -nargs=* -complete=file W w<bang> <args>
command! -bang -nargs=* -complete=file Wq wq<bang> <args>
command! -bang -nargs=* -complete=file WQ wq<bang> <args>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Q q<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>

" Toggle zooming (temporarily display only the current one of multiple windows).
noremap <leader>o :ZoomWin<cr>

" Quickly switch between two most common white-space set-ups.
noremap <leader>2 :set ts=2 sts=2 sw=2 expandtab<cr>
noremap <leader>4 :set ts=4 sts=4 sw=4 expandtab<cr>

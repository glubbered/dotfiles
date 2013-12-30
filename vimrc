"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""" Vundle """"""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundler for vim, use :BundleInstall to install these bundles and
" :BundleUpdate to update all of them
Bundle 'gmarik/vundle'

" file explorer
Bundle 'scrooloose/nerdtree'
" syntax checking
Bundle 'scrooloose/syntastic'
" as-you-type, fuzzy-search code completion engine (requires native modules
" compilation)
Bundle 'Valloric/YouCompleteMe'

" Git in vim, use ,gs for git status then - to stage then C to commit
" check :help Gstatus for more keys
Bundle 'tpope/vim-fugitive'
" git files syntax, indent
Bundle 'tpope/vim-git'
" A Vim plugin which shows a git diff in the 'gutter' (sign column).
" It shows whether each line has been added, modified, and where lines have been removed.
Bundle 'airblade/vim-gitgutter'

" vim plugin for the Perl module / CLI script 'ack' (search)
Bundle 'mileszs/ack.vim'
" full path fuzzy file, buffer, mru, tag, ... finder
Bundle 'kien/ctrlp.vim'
" Surrond stuff with things. ysiw" surrounds a word with quotes
" cs"' changes " to '
Bundle 'tpope/vim-surround'
" defining custom text objects
Bundle 'kana/vim-textobj-user'
" extended % matching
Bundle 'edsono/vim-matchit'
" helps to end certain structures automatically
Bundle 'tpope/vim-endwise'
" quick jumping over text
Bundle 'Lokaltog/vim-easymotion'
"Bundle 'justinmk/vim-sneak'
" add a buffer close to vim that doesn't close the window
Bundle 'rgarver/Kwbd.vim'

" scala syntax
Bundle 'derekwyatt/vim-scala'
" sbt syntax
Bundle 'derekwyatt/vim-sbt'

" improved js syntax
Bundle 'jelera/vim-javascript-syntax'
" improved javascript indentation
Bundle 'pangloss/vim-javascript'
" syntax for jquery keywords and selectors
Bundle 'itspriddle/vim-jquery'
" coffeescript runtime files
Bundle 'kchmck/vim-coffee-script'
" handlebars  and mustache templates syntax
"Bundle 'mustache/vim-mustache-handlebars'

" ROR tools (navigation, hl)
"Bundle 'tpope/vim-rails'
" lightweight support for Ruby's Bundler
"Bundle 'tpope/vim-bundler'
" custom text object for selecting ruby blockskk
"Bundle 'nelstrom/vim-textobj-rubyblock'
" ruby motions, text objects, syntax, omnicompl
"Bundle 'vim-ruby/vim-ruby'
" running your Ruby tests
"Bundle 'skalnik/vim-vroom'


Bundle 'othree/html5.vim'
" maps for editing tags
Bundle 'tpope/vim-ragtag'
" HTML/XML abbreviation editor
Bundle 'mattn/zencoding-vim'
Bundle 'hail2u/vim-css3-syntax'
" runtime files for Haml, Sass, and SCSS
Bundle 'tpope/vim-haml'

" nginx syntax
"Bundle 'vim-scripts/nginx.vim'
Bundle 'gre/play2vim'

" easy commenting in many filetypes
Bundle 'scrooloose/nerdcommenter'
" plugin to interact with tmux
"Bundle 'benmills/vimux'
" tmux config syntax
Bundle 'peterhoeg/vim-tmux'
" maintains a history of previous yanks, changes and deletes
" visualizing undo tree to make it usable
"Bundle 'sjl/gundo.vim'
" snippets
Bundle 'garbas/vim-snipmate'
" snippets for snipmate
Bundle 'honza/vim-snippets'
" snipmate dependency
Bundle 'tomtom/tlib_vim'
" snipmate dependency
Bundle 'MarcWeber/vim-addon-mw-utils'
" make gvim-only colorschemes work transparently in terminal vim
Bundle 'godlygeek/csapprox'
" better-looking, more functional vim statusline
Bundle 'bling/vim-airline'
" quickly and easily switch between buffers
Bundle 'vim-scripts/bufexplorer.zip'
" text filtering and alignment
Bundle 'godlygeek/tabular'
" automatic closing of quotes, parenthesis, brackets, etc.
Bundle 'jiangmiao/auto-pairs'
" tmux syntax
Bundle 'vim-scripts/YankRing.vim'
" zoom into and out of a window
"Bundle 'vim-scripts/ZoomWin'
" extended session management
"Bundle 'xolox/vim-session'
" dependency for vim-session
"Bundle 'xolox/vim-misc'
" automatically create directories on write
Bundle 'DataWraith/auto_mkdir'

" color schemes
Bundle 'rking/vim-detailed'
Bundle 'altercation/vim-colors-solarized'
Bundle 'nanotech/jellybeans.vim'
Bundle 'morhetz/gruvbox'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" BASIC SETTINGS """""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","  " leader key
let g:mapleader=","
set nocompatible      " Use vim, no vi defaults

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
set clipboard=unnamedplus " yank to the system register (+) by default
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
set cursorline        " highlight current line
set shortmess+=I      " don't display welcome
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
"set nowrap                        " don't wrap lines
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
set tags=tags;/

""
"" Backup and swap files
""
set nobackup
set nowb
set noswapfile

""
"" Statusline
""
" unless we're using airline
if !exists('g:loaded_airline') || !g:loaded_airline
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
set scrolljump=5     " Lines to scroll when cursor leaves screen

""
"" Completion
""
"set completeopt=menu,preview,longest
"set wildmode=longest,list
"set wildmenu
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,public/javascripts/compiled
set wildignore+=*.css,tmp,*.orig,*.jpg,*.png,*.gif,log,solr,.sass-cache,.jhw-cache
set wildignore+=bundler_stubs,build,error_pages,bundle,build,error_pages
set wildignore+=.DS_Store
" ruby
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1

" use syntax complete if nothing else available
"if has("autocmd") && exists("+omnifunc")
  "autocmd Filetype *
              "\ if &omnifunc == "" |
              "\ setlocal omnifunc=syntaxcomplete#Complete |
              "\ endif
"endif

"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"
autocmd FileType java setlocal ts=4 sts=4 sw=4 expandtab

" automatically open and close the popup menu / preview window
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

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

" Strip whitespace on write
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
  "set guifont=Source\ Code\ Pro\ for\ Powerline\ 14
  set guifont=PT\ Mono\ for\ Powerline\ 13
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
" use snippets from javascript-jquery in javascript
let g:snipMate.scope_aliases['javascript'] = 'javascript,javascript-jquery'

""
"" Vroom
""
if $TMUX != ''
  let g:vroom_use_vimux = 1 " use vimux when running tests by vroom
end
let g:vroom_use_bundle_exec = 0 " don't use bundler (for faster specs)
" zeus support
let g:vroom_spec_command = '`[ -e .zeus.sock ] && echo zeus` rspec '

""
"" Vimux
""
" Use exising pane (not used by vim) if found instead of running split-window.
let VimuxUseNearestPane = 1

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
" project root search policy
let g:ctrlp_working_path_mode = 'ra' " r - try to find root, a - current dir
let g:ctrlp_custom_ignore = {
            \ 'dir': '\.git$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$\|\.dll$' }
" jump to buffer in the same tab if already open
let g:ctrlp_switch_buffer = 1
" default by filename
let g:ctrlp_by_filename = 1
let g:ctrlp_extensions = ['tag', 'buffertag']

""
"" EasyMotion
""
" highlight colors
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade Comment

""
"" solarized
""
let g:solarized_termcolors=256

""
"" YankRing
""
let g:yankring_replace_n_pkey = ''

""
"" syntastic
""
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
" user faster fsc compiler by default
let g:syntastic_scala_checkers=['fsc']

""
"" Sessions
""
let g:session_autosave = 'no'

""
"" Airline
""
let g:airline_powerline_fonts = 1

""
"" YouCompleteMe
""
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

""
"" Eclim
""
let g:EclimCompletionMethod = 'omnifunc'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" KEY MAPPINGS """""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use jk as <Esc> alternative
inoremap jk <Esc>
inoremap kj <Esc>

" sane regexes
nnoremap / /\v
vnoremap / /\v

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
" next window
map <Tab> <C-w>w

" buffer cycling
map <F2> :bprevious<CR>
map <F3> :bnext<CR>

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

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" NERDTree toggle
silent! nmap <silent> <Leader>p :NERDTreeToggle<CR>
silent! nmap <silent> <leader>f :NERDTreeFind<CR>

" Run all specs in tmux
map <leader>rat :call VimuxRunCommand("`[ -e .zeus.sock ] && echo zeus` rspec spec/") <CR>

" Gundo toggle
nnoremap <F5> :GundoToggle<CR>

" ZenCoding expand
let g:user_zen_leader_key = '<C-e>'

" bufexplorer
silent! map <leader>b :BufExplorer<cr>


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

" new line in insert mode
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

" shift key typos fixes
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

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>

" Make the current directory
nmap <leader>md :silent !mkdir -p %:h<CR>:redraw!<CR>

" YankRing
nmap <leader>y :YRShow<cr>

" Eclim
nmap <leader>ji :JavaImport<CR>
nmap <leader>js :JavaSearchContext<CR>
nmap <leader>jg :JavaSearch<CR>


set t_Co=256          " enable 256-color mode.
set background=dark   " assume a dark background
colorscheme jellybeans
if has('gui_running')
  colorscheme gruvbox
endif

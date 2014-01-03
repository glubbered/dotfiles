"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""" Vundle """"""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" PLUGINS {{{

" Bundler for vim, use :BundleInstall to install these bundles and
" :BundleUpdate to update all of them
Bundle 'gmarik/vundle'

" some sugar for netrw
Bundle 'tpope/vim-vinegar'
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
" scala syntax
Bundle 'derekwyatt/vim-scala'
" sbt syntax
Bundle 'derekwyatt/vim-sbt'
" play templates syntax
Bundle 'gre/play2vim'
" improved js syntax
Bundle 'jelera/vim-javascript-syntax'
" improved javascript indentation
Bundle 'pangloss/vim-javascript'
" syntax for jquery keywords and selectors
Bundle 'itspriddle/vim-jquery'
" coffeescript runtime files
Bundle 'kchmck/vim-coffee-script'
Bundle 'othree/html5.vim'
" maps for editing tags
Bundle 'tpope/vim-ragtag'
" HTML/XML abbreviation editor
Bundle 'mattn/emmet-vim'
Bundle 'hail2u/vim-css3-syntax'
" runtime files for Haml, Sass, and SCSS
Bundle 'tpope/vim-haml'
" Comment stuff out
Bundle 'tpope/vim-commentary'
" tmux config syntax
Bundle 'peterhoeg/vim-tmux'
" make gvim-only colorschemes work transparently in terminal vim
Bundle 'godlygeek/csapprox'
" better-looking, more functional vim statusline
Bundle 'bling/vim-airline'
" TODO
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc.vim'
" automatic closing of quotes, parenthesis, brackets, etc.
Bundle 'jiangmiao/auto-pairs'
" color schemes
Bundle 'nanotech/jellybeans.vim'
Bundle 'morhetz/gruvbox'

" }}}

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
" Writes to the unnamed register also writes to the * and + registers. This
" makes it easy to interact with the system clipboard
if has('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif
set grepprg=ack-grep  " replace the default grep program with ack



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
set fillchars+=vert:│ " better looking for windows separator (only in terminal vim)
set showbreak=↪
" Don't render tag contents with bold, italic & underline in HTML.
let html_no_rendering=1
set lazyredraw        " only redraws if it is needed


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
"" Command line completion
""
set wildmenu                        " Command line autocompletion
set wildmode=list:longest,full      " Shows all the options
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,public/javascripts/compiled,target/*
set wildignore+=*.css,tmp,*.orig,*.jpg,*.png,*.gif,log,solr,.sass-cache,.jhw-cache,.idea,.idea_modules
set wildignore+=bundler_stubs,build,error_pages,bundle,build,error_pages
set wildignore+=.DS_Store


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
" set indentation to 4 spaces in java sources
autocmd FileType java setlocal ts=4 sts=4 sw=4 expandtab

"""
""" Netrw
"""
" netrw preview in vertical split
let g:netrw_preview = 1

" PLUGINS SETTINGS {{{

""
"" Emmet
""
let g:user_emmet_leader_key='<C-e>'

""
"" snipMate
""
"let g:snipMate = {}
"let g:snipMate.scope_aliases = {}
"" use snippets from javascript-jquery in javascript
"let g:snipMate.scope_aliases['javascript'] = 'javascript,javascript-jquery'

""
"" Vroom
""
"if $TMUX != ''
  "let g:vroom_use_vimux = 1 " use vimux when running tests by vroom
"end
"let g:vroom_use_bundle_exec = 0 " don't use bundler (for faster specs)
"" zeus support
"let g:vroom_spec_command = '`[ -e .zeus.sock ] && echo zeus` rspec '

""
"" EasyMotion
""
" highlight colors
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade Comment

""
"" syntastic
""
"let g:syntastic_error_symbol='✗'
"let g:syntastic_warning_symbol='⚠'
"" user faster fsc compiler by default
"let g:syntastic_scala_checkers=['fsc']

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
"" Unite
""
" use ack instead of grep if available
if executable('ack-grep')
  let g:unite_source_grep_command='ack-grep'
  let g:unite_source_grep_default_opts='--no-group --no-color'
  let g:unite_source_grep_recursive_opt=''
  let g:unite_source_grep_search_word_highlight = 1
endif
" enable yank history
let g:unite_source_history_yank_enable = 1
" sort by rank
call unite#filters#sorter_default#use(['sorter_rank'])
" ignores
call unite#custom#source('file_rec/async', 'ignore_pattern', '.*\(\.idea\|\.idea_modules\|target\|\.git\)/.*$')
" uze fuzzy matching
call unite#filters#matcher_default#use(['matcher_fuzzy'])
let g:unite_candidate_icon="▸"

" }}}

" BUILT-IN MAPPINGS {{{
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
" nmap <C-w><Del> <Plug>Kwbd

" key mapping for saving file
nmap <leader>w :w<CR>

" Quickly close the current window
nnoremap <leader>q :q<CR>

" close current buffer
nnoremap <leader>d :bd<CR>

" open file explorer
nmap <leader>p :Explore<CR>

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


" Get the current highlight group. Useful for then remapping the color
map ,hi :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

" Folding
nnoremap <Space> za
vnoremap <Space> za

" Reselect text that was just pasted with ,v
nnoremap <leader>v V`]

" output current file name without extension
inoremap \fn <C-R>=expand("%:t:r")<CR>

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

" <Leader>``: Force quit all
nnoremap <Leader>`` :qa!<cr>

" Make the current directory
nmap <leader>md :silent !mkdir -p %:h<CR>:redraw!<CR>

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>

" Quickly switch between two most common white-space set-ups.
noremap <leader>2 :set ts=2 sts=2 sw=2 expandtab<cr>
noremap <leader>4 :set ts=4 sts=4 sw=4 expandtab<cr>

" }}}

" PLUGINS MAPPINGS {{{

" NERDTree toggle
"silent! nmap <silent> <Leader>p :NERDTreeToggle<CR>
"silent! nmap <silent> <leader>f :NERDTreeFind<CR>

" Run all specs in tmux
"map <leader>rat :call VimuxRunCommand("`[ -e .zeus.sock ] && echo zeus` rspec spec/") <CR>

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


""
"" Unite mappings
""
" fuzzy file search. start in insert mode
nnoremap <C-p> :Unite -start-insert file_rec/async<cr>
" yank history
nnoremap <leader>y :<C-u>Unite history/yank<CR>
" search content
nnoremap <leader>ack :Unite grep:.<CR>
" quick buffer switching
nnoremap <leader>b :Unite -quick-match buffer<CR>

" }}}

" COLOR SCHEME {{{
set t_Co=256          " enable 256-color mode.
set background=dark   " assume a dark background
colorscheme jellybeans
if has('gui_running')
  colorscheme gruvbox
endif
" }}}

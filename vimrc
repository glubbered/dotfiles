" VUNDLE {{{
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" }}}

" PLUGINS {{{

" Bundler for vim, use :BundleInstall to install these bundles and
" :BundleUpdate to update all of them
Bundle 'gmarik/vundle'

" Git in vim, use ,gs for git status then - to stage then C to commit
" check :help Gstatus for more keys
Bundle 'tpope/vim-fugitive'
" git files syntax, indent
Bundle 'tpope/vim-git'
" A Vim plugin which shows a git diff in the 'gutter' (sign column).
" It shows whether each line has been added, modified, and where lines have been removed.
Bundle 'airblade/vim-gitgutter'

" defining custom text objects
Bundle 'kana/vim-textobj-user'
" quick jumping over text
Bundle 'justinmk/vim-sneak'
" some sugar for netrw
Bundle 'tpope/vim-vinegar'
" TODO
Bundle 'Shougo/unite.vim'
" tags source for unite
Bundle 'tsukkee/unite-tag'
" unite dependency (native module)
Bundle 'Shougo/vimproc.vim'

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
Bundle 'hail2u/vim-css3-syntax'
" runtime files for Haml, Sass, and SCSS
Bundle 'tpope/vim-haml'

" maps for editing tags
Bundle 'tpope/vim-ragtag'
" HTML/XML abbreviation editor
Bundle 'mattn/emmet-vim'
" Comment stuff out
Bundle 'tpope/vim-commentary'
" automatic closing of quotes, parenthesis, brackets, etc.
Bundle 'jiangmiao/auto-pairs'
" Surrond stuff with things. ysiw" surrounds a word with quotes
" cs"' changes " to '
Bundle 'tpope/vim-surround'
" helps to end certain structures automatically
Bundle 'tpope/vim-endwise'
" as-you-type, fuzzy-search code completion engine (requires native modules
" compilation)
Bundle 'Valloric/YouCompleteMe'

" tmux config syntax
Bundle 'peterhoeg/vim-tmux'
" make gvim-only colorschemes work transparently in terminal vim
Bundle 'godlygeek/csapprox'
" better-looking, more functional vim statusline
" Bundle 'bling/vim-airline'
Bundle 'itchyny/lightline.vim'

" color schemes
Bundle 'nanotech/jellybeans.vim'
Bundle 'morhetz/gruvbox'
Bundle 'junegunn/seoul256.vim'

if filereadable(expand('~/.vimrc.bundles.local'))
  source ~/.vimrc.bundles.local
endif

" }}}

" BASIC {{{

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
set grepprg=ag\ --nogroup\ --nocolor " replace the default grep program with ag

set exrc            " enable per-directory .vimrc files
set secure          " disable unsafe commands in local .vimrc files

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
set textwidth=0                   " don't wrap long lines

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
if !exists('g:loaded_lightline') || !g:loaded_lightline "!exists('g:loaded_airline') || !g:loaded_airline
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
"" Command line editing
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
set formatoptions-=o    "dont continue comments when pushing o/O
set formatoptions+=j    " delete comment char on second line when joining two commented lines
set virtualedit=onemore " allow for cursor beyond last character
set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
set spr                 " put new split right of the current one

"""
""" Netrw
"""
" netrw preview in vertical split
let g:netrw_preview = 2
" change left splitting to right
let g:netrw_altv=&spr
" use 75% of window for the new window
let g:netrw_winsize=75

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

  if executable('zsh')
    set shell=zsh\ -l
  endif
endif

" }}}

" FUNCTIONS {{{
"
" Incremental ctags generation
function! GenerateTagsIncrementally()
python << EOF
import os
import os.path

command = 'ctags --append --exclude=build --exclude=target --exclude=.git --exclude=log --exclude=tmp --extra=+q --fields=+l -R '
if os.path.isfile('tags'):
  print('Generating tags incrementally.')
  # Walk the file tree, if a file has an mtime more recent than the tag file,
  # add it to the list of files to index.
  tags_mtime = os.stat('tags').st_mtime
  with open('list', 'w') as fp:
      for dirpath, dirnames, filenames in os.walk(os.getcwd()):
          for filename in filenames:
              full_path = os.path.join(dirpath, filename)
              if os.stat(full_path).st_mtime > tags_mtime:
                  fp.write(full_path + '\n')

  # Run ctags using the created list of files.
  os.system(command + '-L list')
  os.remove('list')
else:
  os.system(command + '*')
EOF
endfunction
command! GenerateTagsIncrementally call GenerateTagsIncrementally()

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

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" }}}

" AUTO {{{

" Strip whitespace on write
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \ exe "normal g`\"" |
      \ endif

" Save when losing focus
au FocusLost    * :silent! wall

" treat scss files also as css
autocmd BufNewFile,BufRead *.scss   ft=scss.css

" set indentation to 4 spaces in java sources
autocmd FileType java setlocal ts=4 sts=4 sw=4 expandtab

" }}}

" PLUGINS SETTINGS {{{

" Lightline {{{
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

function! MyModified()
  if &filetype == 'help'
    return ''
  elseif &modified
    return '+'
  elseif &modifiable
    return ''
  else
    return ''
  endif
endfunction

function! MyReadonly()
  if &filetype == 'help'
    return ''
  elseif &readonly
    return '⭤'
  else
    return ''
  endif
endfunction

function! MyFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction

function! MyFilename()
  let fname = expand('%:t')
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'unite' ? unite#get_status_string() :
        \ '' != fname ? fname : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

" }}}

""
"" Emmet
""
let g:user_emmet_leader_key='<C-e>'

""
"" syntastic
""
"let g:syntastic_error_symbol='✗'
"let g:syntastic_warning_symbol='⚠'
"" user faster fsc compiler by default
"let g:syntastic_scala_checkers=['fsc']

""
"" YouCompleteMe
""
let g:ycm_add_preview_to_completeopt=1
" read identifiers from tags
let g:ycm_collect_identifiers_from_tags_files = 1

""
"" Unite
""
" Use ag for search
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_rec_async_command= 'ag --nocolor --nogroup -g ""'
endif
let g:unite_force_overwrite_statusline = 0
" enable yank history
let g:unite_source_history_yank_enable = 1
" sort by rank
call unite#filters#sorter_default#use(['sorter_rank'])
" ignores
call unite#custom_source('file_rec/async',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ 'target/',
      \ '\.idea/',
      \ '\.idea_modules/',
      \ ], '\|'))
" uze fuzzy matching
call unite#filters#matcher_default#use(['matcher_fuzzy'])
let g:unite_candidate_icon="▸"
let g:unite_source_file_rec_max_cache_files = 0

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

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" system buffer mappings
map <C-c> "+y
map <Insert> :set paste<CR>"+p:set nopaste<CR>

" Toggle hlsearch with <leader>hs
nmap <leader>hs :set hlsearch! hlsearch?<CR>
" and with enter
nnoremap <silent> <CR> :nohlsearch<cr>

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" paste in visual mode without updating the default register
vnoremap p "_dP

" true deletion without updating registers
nnoremap R "_d

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
nnoremap <leader>d :Bclose<CR>

" open file explorer
nmap <leader>p :Explore<CR>

" Do not lost block selection after indentation
vmap > >gv
vmap < <gv

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

" Quickly switch between two most common white-space set-ups.
noremap <leader>2 :set ts=2 sts=2 sw=2 expandtab<cr>
noremap <leader>4 :set ts=4 sts=4 sw=4 expandtab<cr>

" }}}

" PLUGINS MAPPINGS {{{

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
nnoremap <C-p> :Unite -start-insert file_rec/async:!<cr>
" yank history
nnoremap <leader>y :<C-u>Unite history/yank<CR>
" search content
nnoremap <leader>ack :Unite grep:.<CR>
" quick buffer switching
nnoremap <leader>b :Unite -quick-match buffer<CR>
" tags navigation
nnoremap <leader>t :GenerateTagsIncrementally<CR>:Unite -start-insert tag<CR>

" }}}

" COLOR SCHEME {{{

if !has('gui_running')
  set t_Co=256          " enable 256-color mode.
endif
set background=dark   " assume a dark background
let g:seoul256_background = 234
colo seoul256

" }}}

" default
let g:java_imports_search_paths = "/usr/lib/jvm/java-7-oracle/jre/lib/rt.jar"

func! s:populate_jars_classes_cache(cache_file, jars)
  let to_fqcn_command = "sed \"s/\\\\$/./g;s/\\.class//g;s/\\//\./g\""
  for jar in a:jars
    call system("jar tf \"" . jar . "\" | " . to_fqcn_command . " >> \"" . a:cache_file . "\"")
  endfor
endfunc

" Remove duplicate values from the given list in-place (preserves order).
func! s:unique(list)
  call reverse(a:list)
  call filter(a:list, 'count(a:list, v:val) == 1')
  return reverse(a:list)
endfunc

" parse list of paths into list of jars and direct paths.
" recursive patterns will be expanded into jar files
func! s:get_classpath_for(search_paths)
  let jars = []
  let paths = []
  for path in a:search_paths
    " recursive find jars in directory
    if path =~ ".*\\*\\*\.jar"
      "strip **.jar to get pure path
      let path_without_ext = substitute(path, "\\*\\*\.jar", "", "")
      let jars_in_path = split(system("ag -g \".*\.jar\" \"" . path_without_ext . "\""), '\n')
      call extend(jars, jars_in_path)
    " single jar file
    elseif path =~ ".*\.jar"
      call add(jars, path)
    " directory with .class files
    else
      call add(paths, path)
    endif
  endfor
  return [jars, paths]
endfunc

" convert .class file path to full qualified class name
func! s:to_fqcn(path)
  let submodule_name = substitute(a:path, "\\$", ".", "g")
  let trim_ext = substitute(submodule_name, "\.class", "", "g")
  let fqcn = substitute(trim_ext, "\/", ".", "g")
  return fqcn
endfunc

func! s:get_candidates_from_cache(cache_file, class_name)
  let candidates = []
  let cached_fqcns = readfile(a:cache_file)
  let candidates = split(system("ag --nogroup --nocolor --no-numbers \".*" . a:class_name . "\\$\" \"" . a:cache_file . "\""), '\n')
  return candidates
endfunc

func! s:get_candidates_for(class_name)
  " TODO: unite.vim integration
  " TODO: find candidates in java sources (specified in additional
  " configuration variable) ???
  " TODO: ignores
  let search_pattern = "(\\\\$|/)" . a:class_name . ".class"
  let search_paths = split(g:java_imports_search_paths, ';')

  let [jars, paths] = s:get_classpath_for(search_paths)

  let candidates = []
  for path in paths
    " TODO: rewrite with sed?
    let class_file_paths = split(system("ag -u -g " . "\"" . search_pattern . "\" \"" . path . "\"" ), '\n')
    " to fully strip classpath from .class path, classpath
    " should end with /
    if path !~ ".*/$"
      let path = path . "\/"
    endif
    for class_file_path in class_file_paths
      let without_classpath = substitute(class_file_path, path, "", "")
      let fqcn = s:to_fqcn(without_classpath)
      call add(candidates, fqcn)
    endfor
  endfor

  if !exists('g:jars_cache_file')
    let g:jars_cache_file = tempname()
    call system("touch " . g:jars_cache_file)
    echo 'Populating cache...'
    call s:populate_jars_classes_cache(g:jars_cache_file, jars)
    echo 'Cache populated'
  endif

  let candidates_from_cache = s:get_candidates_from_cache(g:jars_cache_file, a:class_name)
  call extend(candidates, candidates_from_cache)

  return s:unique(candidates)
endfunc

" shows menu with found candidates and returns selected index
" in list of candidates or negative value if error or closed
func! s:select_import_candidate(candidates)
  " create menu with indices
  let imports_list = ['Select class to import:']
  for i in range(0, len(a:candidates) - 1)
    call add(imports_list, (i+1) . ") " . a:candidates[i])
  endfor

  let idx = inputlist(imports_list)

  " cancelled
  if idx <= 0
    return -1
  endif

  " to list index
  let idx = idx - 1

  if idx >= len(a:candidates)
    echohl Error | echo "\nIncorrect selection" | echohl None
    return -1
  endif

  return idx
endfunc

func! AddImport()
  " TODO: support for grep if ag isn't installed
  if !executable('ag')
    echoe 'ag must be installed in order to use this plugin. Check https://github.com/ggreer/the_silver_searcher for installation instructions.'
    return ''
  endif

  if !exists('g:java_imports_search_paths')
    echoe 'Search paths for imports not configured'
    return ''
  endif

  let word_under_cursor = expand('<cword>')

  let candidates = s:get_candidates_for(word_under_cursor)

  if empty(candidates)
    echohl Error | echo "\nNo candidates found for " . word_under_cursor | echohl None
    return ''
  endif

  let idx = s:select_import_candidate(candidates)

  if idx < 0
    return ''
  endif

  let import_statement = 'import' . " " . candidates[idx]

  " don't allow duplicate imports
  " TODO: check wildcard imports
  " TODO: check scala group imports
  call cursor(1, 1)
  if searchpos("^" . import_statement . ";?$", 'nW')[0] != 0
    echohl Error | echo "\nThis class is already imported" | echohl None
    return ''
  endif

  " add ; for java imports
  if &ft == 'java'
    let import_statement = import_statement . ';'
  endif

  " append to the beginning of file if nothing else is found
  let append_import_to = 0
  " jump to the last line to start searching backwards
  call cursor(line('$'), 1)
  " search for the last import statement
  let last_import_pos = searchpos('^import', 'bW')[0]
  if last_import_pos != 0
    let append_import_to = last_import_pos
  else
    " if imports not found, try to find package declaration
    let package_pos = searchpos('^package')[0]
    if package_pos != 0
      let append_import_to = package_pos
    endif
  endif

  call append(append_import_to, import_statement)

  return ''
endfunc
inoremap <F10> <C-R>=AddImport()<CR>

func! SquashImports()
  " TODO: support for multiline group imports
  " TODO: java wildcard imports

  " dictionary of found packages and classes in import statements
  let packages = {}

  call cursor(1, 1)
  " store for later use
  let first_import_pos = searchpos('^import')[0]

  let import_pos = first_import_pos
  " repeat while there are any import statement
  while import_pos > 0
    let curr_line = getline('.')

    " use ! as separator for matched groups to get all we need in one regex
    let matches = split(substitute(curr_line, "\\v(.*)\\.(\\{([^\\}]*)\}|\\w*);?$",
          \ '\=submatch(1)."!".submatch(2)."!".submatch(3)', ""), '!')
    let package = matches[0]
    " group import
    if len(matches) == 3
      " get classes inside group
      let classes = split(matches[2], ", \\?")

      if has_key(packages, package)
        " append classes from group to other classes in same package
        call extend(packages[package], classes)
      else
        let packages[package] = classes
      endif
    " single or wildcard import
    else
      let class = matches[1]
      if has_key(packages, package)
        call add(packages[package], class)
      else
        let packages[package] = [class]
      endif
    endif

    execute ':' . import_pos . 'd'

    let import_pos = searchpos('^import', 'nc')[0]
  endwhile

  let import_statements = []
  for [package, classes] in items(packages)
    " wildcard imports
    if len(classes) > 4
      let wildcard = &ft == 'scala' ? '_' : '*;'
      let import_statement = package . '.' . wildcard
      call add(import_statements, import_statement)
    " multiple classes in same package
    elseif len(classes) > 1
      " group import for scala
      if &ft == 'scala'
        let import_statement = package . '.{' . join(classes, ', ') . '}'
        call add(import_statements, import_statement)
      " multiple single imports for java
      else
        for class in classes
          let import_statement = package . '.' . class . ';'
          call add(import_statements, import_statement)
        endfor
      endif
    " single import
    else
      let ending = &ft == 'scala' ? '' : ';'
      let import_statement = package . '.' . classes[0] . ending
      call add(import_statements, import_statement)
    endif
  endfor

  " use position of first import as position to insert optimized imports
  call append(first_import_pos - 1, import_statements)
endfunc
command! SquashImports call SquashImports()


func! FindComplPos()
    let line = getline('.')
    let start = col('.')
    while start > 0 && line[start-1] != "."
      let start -= 1
    endwhile
    return start
endfunc

func! ScalaCompletion(findstart, base)
  if a:findstart
    return FindComplPos()
  else
    let curr_line = line('.') - 1
    let curr_column = FindComplPos()

    let path = expand('%:p')
    execute ":w"
    let res = system("curl -s \"http://localhost:8080/completion?file=".path."&line=".curr_line."&column=".curr_column."\"")
    let res_list = split(res, ';')
    let candidates = []
    for res in res_list
      if res =~ '^' . a:base
        call add(candidates, res)
      endif
    endfor
    return candidates
  endif
endfun

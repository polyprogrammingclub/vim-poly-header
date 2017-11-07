" *start* {{{
if has('vim_starting')
    if &compatible
        set nocompatible    " do not maintain compatibility with vi
    endif

    scriptencoding utf-8
    set encoding=utf-8      " encoding => utf-8 (cannot run after startup)
    "set paste  " you may turn this feature on to paste correctly on startup. It can mess with formatting

endif
"}}}

" *colors and visual preferences* {{{
syntax enable
set background=dark                             " dark background!
if exists("$DISPLAY") " in X11
    set t_Co=256
    " colorscheme monokai
    " colorscheme solarized
    " colorscheme jellybeans
    let airline_powerline_fonts=1
    let airline_theme='tomorrow'
    " let airline_theme='badwolf'
    " let airline_theme='raven'
    " let airline_theme='jellybeans'
    " let airline_theme='molokai'
else
    set t_Co=8
    colorscheme zellner
    let airline_powerline_fonts=0
endif

"set synmaxcol=256                               " limit syntax highlighting to 256 columns (default 1000)

set cursorline                                  " horizontal line where cursor is

set list                                        " show hidden characters
set listchars=eol:¬,tab:»\ ,extends:»,trail:·   " configure what to show for hidden characters

set number                                      " show line numbers

set laststatus=2                                " always show the status bar at the bottom
set noshowmode                                  " don't display --insert--, --visual--, --normal--, etc

set wildmenu                                    " show a nice menu for completiong with colon-commands

set novisualbell                                " no flashing
set noerrorbells                                " no noise
set vb t_vb=                                    " disable any beeps or flashes on error

set nosplitbelow                                " horizontal splits open above (default)
set splitright                                  " vertical splits open to the right"

if exists('+colorcolumn')                       " mark the 80 char style limit
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
" }}}

" *undo* {{{
" don't change order
"set noswapfile
"set nobackup
"set nowb
set undodir=~/.vim/undo
set undofile
"}}}

" *search* {{{
set incsearch           " highlight in real time while searching
set hlsearch            " highlight all matches
"set ignorecase          " ignores case when searching
"set smartcase           " case sensitive with a capital letter
" }}}

" *indentation* {{{
set autoindent                  " automatically indent
set cindent                     " c-style indentation
set smartindent                 " c-like indentation on new line

set shiftwidth=4                " number of spaces to auto-indent with cindent, <<, >>, etc
set softtabstop=4               " make spaces feel like tabs (i.e. <BS> deletes to last tabstop)
set tabstop=4                   " number of spaces tab inserts
set expandtab                   " use spaces rather than tabs

set indentkeys-=0#              " do not break indent on #
set cinoptions=:s,ps,ts,cs      " how cindent re-indents a line
set cinwords=if,else,while,do
set cinwords+=for,switch,case   " words that cause indent on next line
" }}}

" *general* {{{
set virtualedit=block   " doesn't constrain visual block

set history=10000       " big history (max)

set modeline            " check for modes (like vim: foldmethod=marker)
set modelines=5         " check first 5 lines (default)

set autowrite           " auto write on make/shell commands
set autoread            " auto read when file is changed

set hidden              " current buffer can be hidden when not written to disk

set scrolloff=4         " start scrolling when 4 lines away from top/bottom

set mouse=""            " disable mouse (mouse control disabled)

nnoremap <space> za     " let space toggle folds

set timeoutlen=550      " time to wait after esc (default 1000 ... way too long)

set fo-=o               " don't automatically insert comment after newline on commented line
" }}}

" *leader configuration for visual preferences* {{{
" toggle background from light to dark
nnoremap <silent> <leader>bg :let &background=(&background == "light" ? "dark" : "light")<cr>:silent AirlineRefresh<cr>:<cr>

" toggle showing invisibles
nnoremap <silent> <leader>l :set list!<cr>

" toggle relative numbers
nnoremap <silent> <leader>r :set relativenumber!<cr>:<cr>

" list buffers and pre-type ':buffer ' for you
nnoremap <leader>bf :buffers<cr>:buffer<space>

" fun colorschemes
nnoremap <silent> <leader>[l :echo "backgrounds: gruvbox (g), jellybeans (j), monokai (m), solarized (s), xoria256 (x)"<cr>
nnoremap <silent> <leader>[g :set background=dark<cr>:colorscheme gruvbox<cr>:AirlineRefresh<cr>
nnoremap <silent> <leader>[j :set background=dark<cr>:colorscheme jellybeans<cr>:AirlineRefresh<cr>
nnoremap <silent> <leader>[m :set background=dark<cr>:colorscheme monokai<cr>:AirlineRefresh<cr>
nnoremap <silent> <leader>[s :set background=dark<cr>:colorscheme solarized<cr>::AirlineTheme badwolf<cr>:AirlineRefresh<cr>
nnoremap <silent> <leader>[x :set background=dark<cr>:colorscheme xoria256<cr>:AirlineRefresh<cr>
" }}}

" vim: foldmethod=marker
execute pathogen#infect()
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
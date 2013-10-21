" load the plugin and indent settings for the detected filetype
filetype plugin indent on

set ruler
syntax on
set number

"do not behave like Vi
set nocompatible

" Set encoding
set encoding=utf-8

" Whitespace stuff
set nowrap
set tabstop=4

"Write the old file out when switching between files.
set autowrite

"Ever notice a slight lag after typing the leader key + command? This lowers
"the timeout.
set timeout
set timeoutlen=500
set ttimeoutlen=100

"Saves time; maps the spacebar to colon
nmap <space> :

" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

set softtabstop=4
set linespace=2

set expandtab
set modifiable

set autoindent
set smartindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set shiftround
filetype indent on

set cpoptions+=$
set guioptions-=T

set virtualedit=block
set splitbelow

set guifont=Inconsolata-g\ for\ Powerline:h15

if &term != "xterm-color"
    if has("gui-running")
        "let g:solarized_termcolors=256
        set t_Co=256
        set background=dark
        colorscheme gruvbox
    else
        "let g:solarized_termcolors=256
        set t_Co=256
        set background=dark
        colorscheme gruvbox

    endif
endif

let g:gruvbox_italic=0
"let g:gruvbox_termcolors=16

inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

set hlsearch
set incsearch
set ignorecase
set smartcase
highlight Search cterm=underline

set cursorline
"highlight Cursorline cterm=underline

" Code folding
set foldenable
nnoremap <leader>ft Vatzf

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Status bar
set laststatus=2

" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <Leader>s :NERDTreeToggle<CR>


" ZoomWin configuration
map <Leader><Leader> :ZoomWin<CR>

" make uses real tabs
au FileType make set noexpandtab

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

au BufRead,BufNewFile *.smarty set filetype=smarty

au Filetype smarty exec('set dictionary=~/.vim/syntax/smarty.vim')
au Filetype smarty set complete+=k

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79 expandtab

" make Ruby use 2 spaces
au FileType ruby set softtabstop=2 tabstop=2 shiftwidth=2 textwidth=79
au FileType coffee set softtabstop=2 tabstop=2 shiftwidth=2 textwidth=79
au FileType slim set softtabstop=2 tabstop=2 shiftwidth=2 textwidth=79
au FileType haml set softtabstop=2 tabstop=2 shiftwidth=2 textwidth=79
au FileType erb set softtabstop=2 tabstop=2 shiftwidth=2 textwidth=79
au FileType ujs set softtabstop=2 tabstop=2 shiftwidth=2 textwidth=79

" make PHP conform to Fuel standards
au FileType php set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79 expandtab
au FileType blade set textwidth=0

"make HTML conform to 4 space
au FileType html set softtabstop=4 tabstop=4 shiftwidth=4

" allow backspacing over everything in insert mode
set backspace=indent,eol,start


" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e

" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" gist-vim defaults
if has("mac")
    let g:gist_clip_command = 'pbcopy'
elseif has("unix")
    let g:gist_clip_command = 'xclip -selection clipboard'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" Use modeline overrides
set modeline
set modelines=10

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup


" Show (partial) command in the status line
set showcmd

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

if has('mouse')
    set mouse=a
endif

function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

if has("autocmd")
    autocmd FileType python set complete+=k/Users/machuga/.vim/pydiction-0.5/pydiction isk+=.,(
    autocmd bufwritepost .vimrc source ~/.vimrc
    autocmd bufwritepost .vimrc.local source ~/.vimrc
endif " has("autocmd"

nnoremap ,h <C-W>h
nnoremap ,j <C-W>j
nnoremap ,k <C-W>k
nnoremap ,l <C-W>l
nnoremap ,H <C-W>H
nnoremap ,J <C-W>J
nnoremap ,K <C-W>K
nnoremap ,L <C-W>L
nnoremap <Leader>] :noh <CR>
nnoremap <Leader>p :set paste<CR>
nnoremap <Leader>o :set nopaste<CR>
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>


" Command-T configuration
let g:CommandTMaxHeight=20

let g:Powerline_colorscheme = 'default'
let g:Powerline_symbols = 'fancy'

"NerdTREE
" nmap ,nt :NERDTree<CR>
" left NERDTreeShowHidden=1

" Use to clear out tests for screencasts
function! RunRspecTests(filename)
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :exec ":!rspec ".a:filename

    " :!php artisan test
endfunction

" Use to clear out tests for screencasts
function! RunPHPUnitTests()
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :exec ":!phpunit"
endfunction

map <Leader>r :call RunPHPUnitTests()<CR>
"map <Leader>r :call RunTests('%')<CR>
set shell=/bin/sh "Or whatever shell needs set

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

nmap ,s :w<CR>

"Faster shortcut for commenting. Requires T-Comment plugin
map ,c <c-_><c-_>

"auto indent htmlfile before opening and after saving
augroup HTML
    autocmd!
    autocmd BufRead,BufWritePre *.html :normal gg=G
    autocmd FileType html nnoremap <buffer> <leader>c I<!--<esc>A--><esc>
augroup END

imap ,, <C-y>,

"For autocompletion of Snipmate plugin
" let g:acp_behaviorSnipmateLength = 1

autocmd FileType php set ft=php.laravel

nmap ,ev :tabedit $MYVIMRC<cr>

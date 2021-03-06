set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . o\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

set number
highlight LineNr ctermfg=grey

set expandtab
set tabstop=4
set shiftwidth=4
autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
:set cursorline
:highlight CursorLine cterm=underline ctermbg=darkblue

set encoding=utf8
"let g:airline_powerline_fonts = 1

if has("gui_running")
  :color ample
  :set guifont=Powerline\ Consolas:h9
  let g:airline_theme='wombat'
  let g:airline_powerline_fonts=1
  " Hide toolbars:
  :set guioptions-=m
  :set guioptions-=T
  :set guioptions-=L
  :set guioptions-=r
  :set lines=999 columns=999
endif

" Better window navigation
nnoremap <C-Down> <C-w>j
nnoremap <C-Up> <C-w>k
nnoremap <C-Left> <C-w>h
nnoremap <C-Right> <C-w>l

" Interchange two lines
nnoremap <C-j> :m+1<CR>
nnoremap <C-k> :m-2<CR>

" Duplicate a line, can't think of a better 
nnoremap <C-p> :t.<CR>

" Delete current line
nnoremap <C-x> dd

map <F5> :redraw!

" List buffers
map <C-l> :CtrlPBuffer<CR>

" Open NERD Tree
autocmd vimenter * NERDTree

if has("win32")
  "vim starts up in system32 for some reason
  cd $USERPROFILE
endif

:set colorcolumn=80
:highlight ColorColumn ctermbg=darkblue

autocmd QuickFixCmdPost *grep* cwindow

let g:gitgutter_avoid_cmd_prompt_on_windows = 0
let g:airline#extensions#tabline#enabled = 1

augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

call plug#begin('~/.vim/plugged')

" Vim plugins, should add more
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'notpratheek/vim-luna'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bling/vim-bufferline'
Plug 'Lokaltog/vim-distinguished'
Plug 'rust-lang/rust.vim'
Plug 'mkitt/tabline.vim'
Plug 'luochen1990/rainbow'

call plug#end()

    let g:rainbow_conf = {
    \   'guifgs': ['#528fd1','#6aaf50','#cd5542','#ab75c3','#dF9522','#baba36','#057f40','#5180b3','#bdbc61','#9d2512'],
    \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
    \}

let g:rainbow_active = 1


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
  :color OceanicNext
  "let g:airline_theme='luna'
  ":AirlineTheme 'luna'
  :set guifont=Consolas:h8
  :set lines=999 columns=999
endif

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
"let g:airline#extensions#tabline#enabled = 1

augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

call plug#begin('~/.vim/plugged')

" Vim plugins, should add more
" TODO: add NERDTree, OcreanicNext, airline, and more
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bling/vim-bufferline'

call plug#end()

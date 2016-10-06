set encoding=utf-8
scriptencoding utf-8

" NeoBundle

if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'vim-scripts/wombat256.vim'
NeoBundle 'miyakogi/seiya.vim'

call neobundle#end()

NeoBundleCheck

filetype plugin indent on


set t_Co=256
colorscheme wombat256mod
syntax enable

let g:seiya_auto_enable=1

set number
set showcmd
set showmatch

set autoindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

set incsearch

" ------------- NERDTree ------------- "

autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType")     && b:NERDTreeType == "primary") | q | endif

let g:NERDTreeIgnore=['\.clean$', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowHidden=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrows=0
let g:NERDTreeQuitOnOpen=0

map <C-n> :NERDTreeToggle<CR>


" --------- vim-indent-guides -------- "

let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=238
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=249
let g:indent_guides_guide_size = 1

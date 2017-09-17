
" vimのvi互換モードを無効にする
if &compatible
    set nocompatible
endif

" 行番号を有効にする
set number

" タイトルを有効にする
set title

" モードラインを有効にする
set modeline

" モードラインの検索行数を設定
set modelines=5

" マウス無効
set mouse=h

" ファイルタイプ検出
filetype plugin indent on

" 改行コードの自動認識
set fileformats=unix,dos,mac

" 内部文字コードの設定
set encoding=utf-8

" 2バイト文字を2文字分にする
set ambiwidth=double

" 文字コード自動判別
set fileencodings=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932,latin1

" 自動保存
set autowrite

"括弧入力時の対応する括弧を表示
set showmatch

" 入力中のコマンドを表示
set showcmd

" カーソル位置の行を強調
set cursorline

"ファイル名表示
set statusline+=%<%F

"変更のチェック表示
set statusline+=%m

"ファイルフォーマット表示
set statusline+=[%{&fileformat}]

"文字コード表示
set statusline+=[%{has('multi_byte')&&\&fileencoding!=''?&fileencoding:&encoding}]

"ファイルタイプ表示
set statusline+=%y

" 左寄せ項目と右寄せ項目の区切り
set statusline+=%=

" カーソル位置を表示
set statusline+=%lL,%c%VC

" ブランチ表示
set statusline+=%{fugitive#statusline()}

" ファイルの位置の割合を表示
set statusline+=%2P

" 自動インデント
set autoindent

" タブを空白に展開
set expandtab

" タブ幅
set shiftwidth=4

" タブを展開する幅
set tabstop=4
set softtabstop=4

" 検索結果をハイライトで表示
set hlsearch

" 検索中の結果を表示
set incsearch

" 検索結果のハイライトを消す
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

" vimファイル

let $VIM_CONF_PATH = $HOME . '/.config/nvim'

source $VIM_CONF_PATH/dein.vim

" シンタクッスハイライトを有効にする
syntax enable

set t_Co=256

" カラースキーマ設定
colorscheme tender

" ステータスラインを表示する
set laststatus=2

" vim: set et ts=4 sw=4 sts=4 ft=vim :

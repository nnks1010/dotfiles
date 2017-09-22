" dein.vim

" プラグインがインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければgithubから落としてくる
if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

" 設定開始
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    " プラグインリストを収めたTOMLファイル
    let s:toml      = '~/.dein.toml'
    let s:lazy_toml = '~/.dein_lazy.toml'

    " TOMLを読み込み、キャッシュしておく
    call dein#load_toml(s:toml,      {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})

    " 設定終了
    call dein#end()
    call dein#save_state()
endif

" 未インストールがあればインストール
if dein#check_install()
    call dein#install()
endif


" ------------- NERDTree ------------- "

autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType")     && b:NERDTreeType == "primary") | q | endif

let g:NERDTreeIgnore=['\.clean$', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowHidden=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrows=0
let g:NERDTreeQuitOnOpen=0

map <C-m> :NERDTreeToggle<CR>

" ------------- Seiya ------------- "
let g:seiya_auto_enable=1

" ------------- Denite ------------- "
call denite#custom#option('default', 'prompt', '>')
call denite#custom#map('insert', "<C-j>", '<denite:move_to_next_line>')
call denite#custom#map('insert', "<C-k>", '<denite:move_to_previous_line>')
call denite#custom#map('insert', "<C-t>", '<denite:do_action:tabopen>')
call denite#custom#map('insert', "<C-v>", '<denite:do_action:vsplit>')
call denite#custom#map('insert', "<C-u>", '<denite:scroll_window_upwards>')
call denite#custom#map('insert', "<C-d>", '<denite:scroll_window_downwards>')
call denite#custom#map('normal', "t", '<denite:do_action:tabopen>')
call denite#custom#map('normal', "v", '<denite:do_action:vsplit>')
if executable('rg')
  call denite#custom#var('file_rec', 'command', ['rg', '--files', '--glob', '!.git', '--hidden'])
  call denite#custom#var('grep', 'command', ['rg', '--hidden'])
  call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])
endif


" ------------- multiple cursors ------------- "
" Default mapping
"let g:multi_cursor_use_default_mapping=0
"let g:multi_cursor_next_key='<C-n>'
"let g:multi_cursor_prev_key='<C-p>'
"let g:multi_cursor_skip_key='<C-x>'
"let g:multi_cursor_quit_key='<Esc>'

" vim: se et ts=4 sw=4 sts=4 ft=vim :

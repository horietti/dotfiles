set encoding=utf-8
scriptencoding utf-8
" ↑1行目は読み込み時の文字コードの設定
" ↑2行目はVim Script内でマルチバイトを使う場合の設定
" Vim scritptにvimrcも含まれるので、日本語でコメントを書く場合は先頭にこの設定が必要になる

"----------------------------------------------------------
" 汎用
"----------------------------------------------------------
set nobackup
set nowritebackup
set noswapfile
set clipboard=unnamed,autoselect
set hidden " バッファが編集中でもその他のファイルを開けるように
"set fenc=utf-8

" Emacs風カーソル移動キーバインド
noremap! <C-b> <Left>
noremap! <C-f> <Right>
"noremap! <C-n> <Down>
"noremap! <C-p> <Up>
noremap! <C-a> <Home>
noremap! <C-e> <End>
noremap! <C-h> <Backspace>
noremap! <C-d> <Delete>

"----------------------------------------------------------
" カラースキーム
"----------------------------------------------------------
"if neobundle#is_installed('molokai')
"    colorscheme molokai " カラースキームにmolokaiを設定する
"endif
"
"set t_Co=256 " iTerm2など既に256色環境なら無くても良い
syntax on " 構文に色を付ける

"----------------------------------------------------------
" 文字
"----------------------------------------------------------
set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double " □や○文字が崩れる問題を解決

"----------------------------------------------------------
" ステータスライン
"----------------------------------------------------------
"set laststatus=2 " ステータスラインを常に表示
"set showmode " 現在のモードを表示
set showcmd " 打ったコマンドをステータスラインの下に表示
"set ruler " ステータスラインの右側にカーソルの位置を表示する

"----------------------------------------------------------
" コマンドモード
"----------------------------------------------------------
set title
set wildmenu " コマンドモードの補完
set history=5000 " 保存するコマンド履歴の数

"----------------------------------------------------------
" タブ・インデント
"----------------------------------------------------------
set expandtab " タブ入力を複数の空白入力に置き換える
set tabstop=4 " 画面上でタブ文字が占める幅
set softtabstop=4 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する
set smarttab
set shiftwidth=4 " smartindentで増減する幅

"----------------------------------------------------------
" 文字列検索
"----------------------------------------------------------
set incsearch " インクリメンタルサーチ. １文字入力毎に検索を行う
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch " 検索結果をハイライト

" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

"----------------------------------------------------------
" カーソル
"----------------------------------------------------------
set whichwrap=b,s,h,l,<,>,[,],~ " カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set number " 行番号を表示
set cursorline " カーソルラインをハイライト

" 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

" バックスペースキーの有効化
set backspace=indent,eol,start

"----------------------------------------------------------
" カッコ・タグの対応
"----------------------------------------------------------
set showmatch " 括弧の対応関係を一瞬表示する
source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張する

"----------------------------------------------------------
" マウスでカーソル移動とスクロール
"----------------------------------------------------------
"if has('mouse')
"    set mouse=a
"    if has('mouse_sgr')
"        set ttymouse=sgr
"    elseif v:version > 703 || v:version is 703 && has('patch632')
"        set ttymouse=sgr
"    else
"        set ttymouse=xterm2
"    endif
"endif

"----------------------------------------------------------
" クリップボードからのペースト
"----------------------------------------------------------
" 挿入モードでクリップボードからペーストする時に自動でインデントさせないようにする
"if &term =~ "xterm"
"    let &t_SI .= "\e[?2004h"
"    let &t_EI .= "\e[?2004l"
"    let &pastetoggle = "\e[201~"
"
"    function XTermPasteBegin(ret)
"        set paste
"        return a:ret
"    endfunction
"
"    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
"endif

"----------------------------------------------------------
" neocomplete・neosnippetの設定
"----------------------------------------------------------
"if neobundle#is_installed('neocomplete.vim')
"    " Vim起動時にneocompleteを有効にする
"    let g:neocomplete#enable_at_startup = 1
"    " smartcase有効化. 大文字が入力されるまで大文字小文字の区別を無視する
"    let g:neocomplete#enable_smart_case = 1
"    " 3文字以上の単語に対して補完を有効にする
"    let g:neocomplete#min_keyword_length = 3
"    " 区切り文字まで補完する
"    let g:neocomplete#enable_auto_delimiter = 1
"    " 1文字目の入力から補完のポップアップを表示
"    let g:neocomplete#auto_completion_start_length = 1
"    " バックスペースで補完のポップアップを閉じる
"    inoremap <expr><BS> neocomplete#smart_close_popup()."<C-h>"
"    " エンターキーで補完候補の確定. スニペットの展開もエンターキーで確定
"    imap <expr><CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "<C-y>" : "<CR>"
"    " タブキーで補完候補の選択. スニペット内のジャンプもタブキーでジャンプ
"    imap <expr><TAB> pumvisible() ? "<C-n>" : neosnippet#jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"
"endif

"----------------------------------------------------------
" Syntastic
"----------------------------------------------------------
"" 構文エラー行に「>>」を表示
"let g:syntastic_enable_signs = 1
"" 他のVimプラグインと競合するのを防ぐ
"let g:syntastic_always_populate_loc_list = 1
"" 構文エラーリストを非表示
"let g:syntastic_auto_loc_list = 0
"" ファイルを開いた時に構文エラーチェックを実行する
"let g:syntastic_check_on_open = 1
"" 「:wq」で終了する時も構文エラーチェックする
"let g:syntastic_check_on_wq = 1
"
"" Javascript用. 構文エラーチェックにESLintを使用
"let g:syntastic_javascript_checkers=['eslint']
"" Javascript以外は構文エラーチェックをしない
"let g:syntastic_mode_map = { 'mode': 'passive',
"                           \ 'active_filetypes': ['javascript'],
"                           \ 'passive_filetypes': [] }

"----------------------------------------------------------
" CtrlP
"----------------------------------------------------------
"let g:ctrlp_match_window = 'order:ttb,min:20,max:20,results:100' " マッチウインドウの設定. 「下部に表示, 大きさ20行で固定, 検索結果100件」
"let g:ctrlp_show_hidden = 1 " .(ドット)から始まるファイルも検索対象にする
"let g:ctrlp_types = ['fil'] "ファイル検索のみ使用
"let g:ctrlp_extensions = ['funky', 'commandline'] " CtrlPの拡張として「funky」と「commandline」を使用
"
"" CtrlPCommandLineの有効化
"command! CtrlPCommandLine call ctrlp#init(ctrlp#commandline#id())
"
"" CtrlPFunkyの絞り込み検索設定
"let g:ctrlp_funky_matchtype = 'path'
"
"if executable('ag')
"  let g:ctrlp_use_caching=0 " CtrlPのキャッシュを使わない
"  let g:ctrlp_user_command='ag %s -i --hidden -g ""' " 「ag」の検索設定
"endif

"----------------------------------------------------------
"dein Scripts-----------------------------
"----------------------------------------------------------
"if &compatible
"	set nocompatible               " Be iMproved
"endif
"
"" Required:
"set runtimepath+=/Users/daisukehorie/.cache/dein/repos/github.com/Shougo/dein.vim
"
"" Required:
"if dein#load_state('/Users/daisukehorie/.cache/dein')
"	call dein#begin('/Users/daisukehorie/.cache/dein')
"
"	" Let dein manage dein
"	" Required:
"	call dein#add('/Users/daisukehorie/.cache/dein/repos/github.com/Shougo/dein.vim')
"
"	" Add or remove your plugins here like this:
"	"call dein#add('Shougo/neosnippet.vim')
"	"call dein#add('Shougo/neosnippet-snippets')
"	"call dein#add('Shougo/neocomplete.vim')
"	"call dein#add('lervag/vimtex')
"	"call dein#add('thinca/vim-quickrun')
"
"	" Required:
"	call dein#end()
"	call dein#save_state()
"endif
"
"" Required:
"filetype plugin indent on
"syntax enable
"
"" If you want to install not installed plugins on startup.
"if dein#check_install()
"	call dein#install()
"endif
"
"----------------------------------------------------------
" NeoBundle
"----------------------------------------------------------
set nocompatible               " Be iMproved
filetype off                   " Required!

if has('vim_starting')
    " 初回起動時のみruntimepathにNeoBundleのパスを指定する
    set runtimepath+=~/.vim/bundle/neobundle.vim/

    " NeoBundleが未インストールであればgit cloneする
    if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
        echo "install NeoBundle..."
        :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
    endif
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" インストールするVimプラグインを以下に記述
" NeoBundle自身を管理
NeoBundleFetch 'Shougo/neobundle.vim'
" カラースキームmolokai
"NeoBundle 'tomasr/molokai'
" ステータスラインの表示内容強化
"NeoBundle 'itchyny/lightline.vim'
" インデントの可視化
NeoBundle 'Yggdroot/indentLine'
" 末尾の全角半角空白文字を赤くハイライト
NeoBundle 'bronson/vim-trailing-whitespace'
" 構文エラーチェック
"NeoBundle 'scrooloose/syntastic'
" 多機能セレクタ
"NeoBundle 'ctrlpvim/ctrlp.vim'
" CtrlPの拡張プラグイン. 関数検索
"NeoBundle 'tacahiroy/ctrlp-funky'
" CtrlPの拡張プラグイン. コマンド履歴検索
"NeoBundle 'suy/vim-ctrlp-commandline'
" CtrlPの検索にagを使う
"NeoBundle 'rking/ag.vim'
" プロジェクトに入ってるESLintを読み込む
"NeoBundle 'pmsorhaindo/syntastic-local-eslint.vim'
" 行末の半角スペースを可視化
"NeoBundle 'bronson/vim-trailing-whitespace'
" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'
nnoremap <silent><C-w><C-e> :NERDTreeToggle<CR>
" ファイルオープンを便利に
NeoBundle 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'
" http://blog.remora.cx/2010/12/vim-ref-with-unite.html
""""""""""""""""""""""""""""""
" Unit.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
""""""""""""""""""""""""""""""
" vimproc
NeoBundle 'Shougo/vimproc', {
			\ 'build' : {
			\ 'windows' : 'make -f make_mingw32.mak',
			\ 'cygwin' : 'make -f make_cygwin.mak',
			\ 'mac' : 'make -f make_mac.mak',
			\ 'unix' : 'make -f make_unix.mak',
			\ },
			\ }

" for LaTeX
NeoBundle 'lervag/vimtex'

" vim-quickrun
NeoBundleLazy "thinca/vim-quickrun", {
			\ 'depends': 'osyo-manga/shabadou.vim',
			\ 'autoload': {
			\   'mappings': [['nxo', '<Plug>(quickrun)']]
			\ }}
nmap <Leader>r <Plug>(quickrun)
let s:hooks = neobundle#get_hooks("vim-quickrun")
function! s:hooks.on_source(bundle)
	let g:quickrun_config = {
				\   "_": {
				\     "hook/close_quickfix/enable_success" : 1,
				\     "hook/close_buffer/enable_failure" : 1,
				\     "outputter" : "multi:buffer:quickfix",
				\     "hook/neco/enable" : 1,
				\     "hook/neco/wait" : 20,
				\     "runner": "vimproc",
				\     'hook/time/enable' : 1
				\   },
				\   'tex':{
				\     'command' : 'latexmk',
				\     'cmdopt': '-pv',
				\     'exec': ['%c %o %s']
				\   },
				\ }
endfunction

" texのconcealを無効化
let g:tex_conceal=''

" vimのlua機能が使える時だけ以下のVimプラグインをインストールする
if has('lua')
    " コードの自動補完
    NeoBundle 'Shougo/neocomplete.vim'
    " スニペットの補完機能
    NeoBundle "Shougo/neosnippet"
    " スニペット集
    NeoBundle 'Shougo/neosnippet-snippets'
endif

call neobundle#end()

" ファイルタイプ別のVimプラグイン/インデントを有効にする
filetype plugin indent on

" 未インストールのVimプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
NeoBundleCheck

" Installation check.
if neobundle#exists_not_installed_bundles()
	echomsg 'Not installed bundles : ' .
				\ string(neobundle#get_not_installed_bundle_names())
	echomsg 'Please execute ":NeoBundleInstall" command.'
	"finish
endif
""--------------------------------------------------------------------------


if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle/'))
    NeoBundleFetch 'Shougo/neobundle.vim'
  
    NeoBundle "Shougo/neosnippet"
    NeoBundle "Shougo/neosnippet-snippets"
    NeoBundle "honza/vim-snippets"
    
    NeoBundle 'thinca/vim-quickrun'
    NeoBundle 'scrooloose/nerdtree'
    
    NeoBundle 'git://github.com/kien/ctrlp.vim.git' 
    NeoBundle 'git://github.com/hotchpotch/perldoc-vim'
    NeoBundle 'tpope/vim-fugitive.git'

    NeoBundle 'https://github.com/motemen/git-vim'
    
    NeoBundle 'https://github.com/leafgarland/typescript-vim.git'
    NeoBundle 'Shougo/neocomplcache'
    NeoBundle 'https://github.com/jason0x43/vim-js-indent.git'
    NeoBundle 'https://github.com/kien/rainbow_parentheses.vim.git'

    NeoBundle 'https://github.com/vim-scripts/nginx.vim.git'
    
    NeoBundle 'git://github.com/edsono/vim-matchit'
    NeoBundle 'https://github.com/Lokaltog/vim-powerline.git'

  call neobundle#end()
endif

syntax on
set nocp
set number
set nowrap
set backspace=2
set shiftwidth=4
set ts=4
set expandtab
set nolist
set smartindent 
" 横線の表示
"set cursorline
" 縦線の表示
""set cursorcolumn
"" ステータスラインを常に表示（編集中のファイル名が常に確認できるようになる）
set laststatus=2
"" 検索結果文字列のハイライトを有効にする
set hlsearch
"" 括弧入力時の対応する括弧を表示
set showmatch
"--------------------------------------------------------------------------------
" Use case insensitive search, except when using capital letters
" 検索時に大文字・小文字を区別しない。ただし、検索後に大文字小文字が
" 混在しているときは区別する
set ignorecase
set smartcase

" " コマンドライン補完を便利に
set wildmenu
" " タイプ途中のコマンドを画面最下行に表示
set showcmd
"
" 画面最下行にルーラーを表示する
set ruler
"

" Enable use of the mouse for all modes
" " 全モードでマウスを有効化
" set mouse=a

""jjでインサート/コマンドモード
inoremap <silent> jj <ESC>

colorscheme desert
"colorscheme wombat
"source $HOME/.bundle/vim-matchit/plugin/matchit.vim

""全角スペース
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

filetype on
au BufRead,BufNewFile *.pl,*.cgi,*.pm,*.psgi,*.t setfiletype perl
au BufRead,BufNewFile *.conf setfiletype nginx 
au BufRead,BufNewFile *.lua setfiletype lua 
au BufRead,BufNewFile *.js setfiletype javascript
au BufRead,BufNewFile *.tt,*.tt2 setfiletype html

autocmd FileType pl,perl,cgi,pm,psgi,t :compiler perl
autocmd FileType html,htm set ts=4 sw=4
autocmd FileType rb  :compiler ruby
autocmd Bufenter *.js,*.tt set ts=4 sw=4
au BufRead,BufNewFile *.ts setfiletype typescript

let g:Powerline_symbols = 'fancy'
set guifont='SourceCodePro-Regular-Powerline'

set nocompatible               " be iMproved
filetype off

"-------------------------------------------------------------------------
let g:neosnippet#snippets_directory = '~/.vim/mysnippets'
let g:neosnippet#enable_snipmate_compatibility = 1

imap <C-a> <Plug>(neosnippet_expand_or_jump)
smap <C-a> <Plug>(neosnippet_expand_or_jump)
imap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
set clipboard+=unnamed,autoselect
au BufRead,BufNewFile *.ts setfiletype javascript

"-------------------------------------------------------------------------
"前に開いたときのカーソル位置
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

"diffの色
hi DiffAdd    ctermfg=black ctermbg=2
hi DiffChange ctermfg=black ctermbg=3
hi DiffDelete ctermfg=black ctermbg=6
hi DiffText   ctermfg=black ctermbg=7

"--------------------syntastic JSのシンタックスチェッカー-----------------------
"NeoBundle 'https://github.com/scrooloose/syntastic.git'
"let g:syntastic_javascript_checkers = 'jshint'
""let g:syntastic_javascript_checkers=['jsxhint'] "ためしにこっちつかう
"let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'
"let g:syntastic_enable_signs=1
"let g:syntastic_auto_loc_list=2
"    "jsの保存時
"let g:syntastic_mode_map = {
"\ "mode" : "active",
"\ "active_filetypes" : ["javascript", "json"],
"\}
"let g:syntastic_enable_perl_checker = 1
"let g:syntastic_perl_checkers = ['perl', 'podchecker']
"   "ライブラリの指定
"let g:syntastic_perl_lib_path = ['/Users/fushiminaoto/wanon2/lib','/Users/fushiminaoto/mainecoon/lib' , '/Users/fushiminaoto/mainecoon/t/' ]
"   "syntasticの除外設定
"let g:syntastic_ignore_files=['\.tt$', '\.pl$', '\.t$', '\.react\.ts$']
"let g:syntastic_quiet_messages = { "level": "warnings",
"                                     \ "type":  "style",
"                                     \ "regex": '\m\[C03\d\d\]',
"                                     \ }
"let syntastic_debug = 1
"let g:syntastic_check_on_open = 0

"----------------------------------------------------------------------------------------
" " <C-L>で検索後の強調表示を解除する
nnoremap <C-L]] > :nohl<CR><C-L]] >  
"Ctl + Pで起動,Ctrl+t新しいタブで開く　Ctrl+v   垂直分割して開く　
""vimdiff出すやつ
"NeoBundle 'tpope/vim-fugitive.git'

"tmpフォルダはバックアップしない
set backupskip=/tmp/*,/private/tmp/*

"ナードツリーショートカット
nmap <silent> <C-e>      :NERDTreeToggle<CR>
vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
omap <silent> <C-e>      :NERDTreeToggle<CR>
imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
cmap <silent> <C-e> <C-u>:NERDTreeToggle<CR>
let g:NERDTreeMapActivateNode="r"

"ctagsを保存時に生成 通常は:Ctagsでつかう
"NeoBundle 'soramugi/auto-ctags.vim'
"保存時ctag
"let g:auto_ctags = 1

"オリジナルキーバインド
nnoremap lc :lclose<CR>
nnoremap tn :<C-u>tabnew<CR>
nnoremap ty gt
nnoremap tr gT
nnoremap syn :SyntasticToggleMode

"I love typescript
"NeoBundle 'https://github.com/leafgarland/typescript-vim.git'
""-----------------------------------------------------------------------------------
"NeoBundle 'Shougo/neocomplcache'
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 2
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 1
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "<CR>"
inoremap <expr><C-e>  neocomplcache#close_popup()
"-----------------------------------------------------------------------------------
"NeoBundle 'https://github.com/jason0x43/vim-js-indent.git'

"リターンキーで挿入モードにならずに改行
"noremap <CR> o<ESC>

syntax on

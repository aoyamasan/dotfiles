set nu
set expandtab
  set shiftwidth=4
  set softtabstop=4
  set tabstop=4
set autoindent
set nowrap
set nobackup
set showmatch
set tags=/home/niwavideo/tags

"call togglebg#map("<f5>")
set t_Co=256
let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
colorscheme desert
set background=dark

highlight ZenkakuSpace ctermbg=cyan guibg=cyan
set encoding=utf-8
set fileencodings=utf-8


""" vundle
set nocompatible
filetype off
set rtp+=~/.vim/vundle
call vundle#rc('~/.vim/bundle')

" 使うプラグインを指定
Bundle 'petdance/vim-perl'
Bundle 'hotchpotch/perldoc-vim'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle 'thinca/vim-quickrun'
Bundle 'hrsh7th/vim-versions'
Bundle 'Shougo/unite.vim'

filetype plugin indent on


""" neocomplcache
let g:neocomplcache_enable_at_startup=1
"
" 辞書の登録
let g:neocomplcache_dictionary_filetype_lists = {
\ 'default' : '',
\ 'php' : $HOME.'/.vim/dict/php.dict',
\ }


""" quickrun
augroup QuickRunPHPUnit
  autocmd!
  autocmd BufWinEnter,BufNewFile *Test.php set filetype=php.unit
  autocmd BufWinEnter,BufNewFile *test.php set filetype=php.unit
augroup END

let g:quickrun_config = {}
let g:quickrun_config['php.unit'] = {}
let g:quickrun_config['php.unit'] = {
                        \ 'command' : 'phpunit',
                        \ 'outputter/buffer/into' : 1}

""" php-doc.vim
inoremap <C-D> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-D> :call PhpDocSingle()<CR>
vnoremap <C-D> :call PhpDocRange()<CR>


""" unite.vim
" 入力モードで開始
let g:unite_enable_start_insert=1
" Uniteを開く時、垂直分割で開く
let g:unite_enable_split_vertically=1
" 幅40に設定
let g:unite_winwidth=30 
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部のせ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q


""" neosnippet
" plugin key-mapping
imap <C-k>   <Plug>(neosnippet_expand_or_jump)
smap <C-k>   <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('nonceal')
         set conceallevel=2 concealcursor=i
endif         

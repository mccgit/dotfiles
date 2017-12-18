" --- Vundle Begin ---
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle/plugin')
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-ruby/vim-ruby'
Plugin 'elixir-editors/vim-elixir'
Plugin 'Shougo/neocomplete'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mileszs/ack.vim'
call vundle#end()            " required
filetype plugin indent on    " required
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve r
" --- Vundle End ---
" -> nerdtree begin
let g:NERDTreeWinSize = 32
" -> neocomplete begin
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
" Select by CR
noremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" -> vim-airline begin
let g:airline_theme='simple'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
" <- Plugins End
set number
set ts=2
set sts=2
set sw=2
set colorcolumn=128
set expandtab
set mouse=v
set nowrap
set hlsearch incsearch
set showmode showmatch
set autoindent
set smartindent

highlight ColorColumn ctermbg=7

syntax enable
syntax on
let mapleader=','

inoremap <c-f> <Right><esc>
vnoremap <c-f> <esc>
nnoremap <c-f> <esc>
imap     <c-c> <c-f>
inoremap <c-d> <esc>ddi
inoremap <c-p> <esc>pi
nnoremap <c-n> :NERDTree<cr>
inoremap <c-w> <esc><c-w>
nnoremap ; :
nnoremap <C-u> 8zh
inoremap <C-u> <left>
nnoremap <C-p> 8zl
inoremap <C-l> <right>
inoremap <C-j> <down>
inoremap <C-k> <up>
nnoremap <leader>a :set mouse=a<cr>
nnoremap <leader>e :source $MYVIMRC<cr>
nnoremap <leader>h <c-w>4+
nnoremap <leader>l :set list<cr>
nnoremap <leader>nh <c-w>4-
nnoremap <leader>nl :set nolist<cr>
nnoremap <leader>np :set nopaste<cr>
nnoremap <leader>nt :set noexpandtab<cr>
nnoremap <leader>nw <c-w>8<
nnoremap <leader>p :set paste<cr>
nnoremap <leader>t :set expandtab<cr>
nnoremap <leader>v :set mouse=v<cr>
nnoremap <leader>s :%s###gc<left><left><left><left>
nnoremap <leader>w <c-w>8>
inoremap <leader>m <esc>d0i<bs><del>
inoremap <leader>k <cr><up><esc>ddp<up>i
vnoremap // y/<c-r>"<cr>

" scripts using
augroup filetype_scripts
  autocmd!
  autocmd FileType python,ruby,sh noremap <leader>c I#<space><esc>
  autocmd FileType cpp,php,javascript noremap <leader>c I//<space><esc>
  autocmd FileType sql,lua noremap <leader>c I--<space><esc>
  autocmd FileType erlang noremap <leader>c I%<space><esc>
augroup END

" cursor using
augroup my_cursor
  autocmd!
  autocmd InsertEnter,InsertLeave * set cuc!
augroup END

" NerdTreeGit symbol using
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
let g:NERDTreeGlyphReadOnly = '[RO]'

" plugins

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" ycm
Plug 'ycm-core/YouCompleteMe'

" gruvbox
Plug 'morhetz/gruvbox'

" fzf fuzzy search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" tpope surround
Plug 'tpope/vim-surround'

" quick-scope
Plug 'unblevable/quick-scope'

" goyo
Plug 'junegunn/goyo.vim'

" Initialize plugin system
call plug#end()

" indentation
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" turn hybrid line numbers on
set number relativenumber

" set leader to space
let mapleader=" "

" copy and paste to clipboard with leader
noremap <Leader>y "+y
noremap <Leader>p "+p

" splits position
set splitbelow
set splitright

" search
set incsearch

" fzf vim
nnoremap <C-p> :GFiles<CR>
nnoremap <C-l> :Rg<CR>

" ycm
let g:ycm_autoclose_preview_window_after_insertion = 1
nnoremap <silent> <Leader>g :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>r :YcmCompleter GoToReferences<CR>

" quick-scope
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" highlight colors
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END

" goyo callbacks
function! s:goyo_enter()
    noremap <silent> k gk
    noremap <silent> j gj
    noremap <silent> 0 g0
    noremap <silent> $ g$
endfunction

function! s:goyo_leave()
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" colorscheme
colorscheme gruvbox
set background=dark

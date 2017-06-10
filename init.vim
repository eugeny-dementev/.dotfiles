set nocompatible              " be iMproved, required
filetype on

call plug#begin('~/.local/share/nvim/plugged')

" color scheme
Plug 'eugeny-dementev/gruvbox'
" Plug 'morhetz/gruvbox'

" git improvements
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" code style
Plug 'editorconfig/editorconfig-vim' " editor config B)

" language syntax pack 70+
Plug 'sheerun/vim-polyglot' " js, jsx, coffee, cjsx, ...

" javascript improvements
" Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'

" File navigation
Plug 'wincent/command-t', {
  \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
  \ }

" Syntax checker (eslint)
Plug 'neomake/neomake'

call plug#end()

set t_Co=256

colorscheme gruvbox
set background=dark

set tabstop=2
set shiftwidth=2
set expandtab

set ruler

" ======== gitgutter =========
set updatetime=250
let g:gitgutter_sign_column_always = 1

" ======== search =========
" clear search pattern shortcut
nmap <C-C> :let @/=""<CR>
" highlights all words found with search pattern
set hlsearch

" ======== cursor =========
:let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" ======== editorconfig ======== 
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:EditorConfig_exclude_patterns = ['scp://.*']

" ======== command-t ======== 
nmap <C-P> :CommandT<CR>
set wildignore+=*/node_modules

" ======== neomake ======== 
autocmd BufWritePost,BufEnter *.js,*.jsx Neomake
let g:neomke_javascript_eslint_maker = {
    \ 'exe': 'eslint_d',
    \ 'args': ['-f', 'compact'],
    \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
    \ '%W%f: line %l\, col %c\, Warning - %m'
    \ }
let g:neomake_javascript_enabled_makers = ['eslint']

" autowrite all modifed files always
set autowriteall
" autoread file changes outside of vim
set autoread

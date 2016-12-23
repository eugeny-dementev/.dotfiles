set nocompatible              " be iMproved, required
filetype on
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" color scheme
" Plugin 'altercation/vim-colors-solarized'
Plugin 'eugeny-dementev/gruvbox'
" Plugin 'morhetz/gruvbox'

" git improvements
Plugin 'airblade/vim-gitgutter'

" code style
Plugin 'editorconfig/editorconfig-vim' " editor config B)

" language syntax pack 70+
Plugin 'sheerun/vim-polyglot' " js, jsx, coffee, cjsx, ...

Plugin '907th/vim-auto-save'

" javascript improvements
Plugin 'othree/yajs.vim'
Plugin 'othree/javascript-libraries-syntax.vim'


" File navigation
Plugin 'wincent/command-t'

" Syntax checker (eslint)
Plugin 'neomake/neomake'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" set tabstop=4
" set shiftwidth=4
" set expandtab

set t_Co=256
syntax on

colorscheme gruvbox
set background=dark

set tabstop=2
set shiftwidth=2
set expandtab

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

" ======== auto-save ======== 
let g:auto_save = 1

set nocompatible " be iMproved, required
filetype on

call plug#begin('~/.local/share/nvim/plugged')

" color scheme
Plug 'eugeny-dementev/gruvbox'
" Plug 'morhetz/gruvbox'

" git improvements
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Rust autocomplete
Plug 'racer-rust/vim-racer'

" code style
Plug 'editorconfig/editorconfig-vim' " editor config B)

" language syntax pack 70+
Plug 'sheerun/vim-polyglot' " js, jsx, coffee, cjsx, ...
Plug 'flowtype/vim-flow', {
  \ 'autoload': {
  \   'filetypes': 'javascript'
  \ },
  \ 'build': {
  \   'mac': 'npm install -g flow-bin'
  \ }}
  let g:flow#flowpath = '$(npm bin)/flow'

" javascript improvements
Plug 'mvolkmann/vim-js-arrow-function' " convert anonymous function to arrow function

" File navigation
Plug 'wincent/command-t', {
  \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make && gem install neovim && gem install msgpack'
  \ }

" Auto code style formatter
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'branch': 'release/1.x',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'vue',
    \ 'lua',
    \ 'php',
    \ 'python',
    \ 'ruby',
    \ 'html',
    \ 'handlebars',
    \ 'swift' ] }

" Syntax checker (eslint)
Plug 'neomake/neomake'

" Comments toggle
Plug 'tomtom/tcomment_vim'

" Move line up/down
Plug 'matze/vim-move'

" Emment for html
Plug 'mattn/emmet-vim'

call plug#end()

set t_Co=256

colorscheme gruvbox
set background=dark

set tabstop=2
set shiftwidth=2
set expandtab

set ruler

set cursorline
set nobackup
set nowritebackup
set noswapfile

" ======== folding ===========

set foldmethod=syntax
set foldlevel=20

" ======== gitgutter =========
set updatetime=250
set signcolumn=yes

" ======== search =========
" clear search pattern shortcut
nmap <C-C> :let @/=""<CR>
" highlights all words found with search pattern
set hlsearch

" ======== cursor =========
:set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

" ======== editorconfig ======== 
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:EditorConfig_exclude_patterns = ['scp://.*']

" ======== command-t ======== 
nmap <C-P> :CommandT<CR>
let g:CommandTTraverseSCM = 'file'

set wildignore+=*/node_modules

" ======== neomake ======== 
call neomake#configure#automake('nrwi', 500)

" autowrite all modifed files always
autocmd InsertLeave * silent! update
au BufLeave * silent! wall
set autowriteall

" autoread file changes outside of vim
set autoread

" rust autocomplete
set hidden
let g:racer_cmd = "~/.cargo/bin/racer"
let g:racer_experimental_completer = 1

" rust lang configurations
au FileType rust nmap gd <Plug>(rust-def-split)

" prettier configuration
let g:prettier#exec_cmd_async = 1
let g:prettier#config#single_quote = 'true'
let g:prettier#config#arrow_parens = 'always'
let g:prettier#config#trailing_comma = 'es5'

" change vim-move key
let g:move_key_modifier = 'C'

" mouse scroll
set mouse=a " always

" use locally installed flow
let local_flow = finddir('node_modules', '.;') . '/.bin/flow'
if matchstr(local_flow, "^\/\\w") == ''
    let local_flow= getcwd() . "/" . local_flow
endif
if executable(local_flow)
  let g:flow#flowpath = local_flow
endif

let g:javascript_plugin_flow = 1

" remove tralling whitespaces on save
autocmd FileType c,cpp,java,php,js,jsx,ts,py,rs,md autocmd BufWritePre <buffer> %s/\s\+$//e

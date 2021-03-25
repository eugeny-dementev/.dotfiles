set nocompatible " be iMproved, required
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
Plug 'HerringtonDarkholme/yats.vim' " ts

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

" Typescript autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntax checker (eslint)
Plug 'neomake/neomake'

" Comments toggle
Plug 'tomtom/tcomment_vim'

" Move line up/down
Plug 'matze/vim-move'

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

" ======== prettier ==============
let g:prettier#exec_cmd_async = 1
let g:prettier#config#single_quote = 'true'
let g:prettier#config#arrow_parens = 'always'
let g:prettier#config#trailing_comma = 'es5'

" change vim-move key
let g:move_key_modifier = 'C'

" mouse scroll
set mouse=a " always

" remove tralling whitespaces on save
autocmd FileType c,cpp,java,php,js,jsx,ts,py,rs,md autocmd BufWritePre <buffer> %s/\s\+$//e

" ========= coc ============
let g:coc_global_extensions = [ 'coc-tsserver' ]
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" goto code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" remap keys for applying show fixes codeAction to the current line
nmap <leader>sf  <Plug>(coc-codeaction)
" remap keys for applying refactoring to the current cursor position
nmap <leader>lr  <Plug>(coc-refactor)

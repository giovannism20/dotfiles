" Author: Giovanni Martins
" Repo  : https://github.com/GiovanniSM20/dotfiles

" Plugins "

call plug#begin('~/nvim/plugged')

"" oceanic next
Plug 'mhartington/oceanic-next'

"" dracula
Plug 'dracula/vim',{'name':'dracula'}

"" deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

"" neosnippet
Plug 'Shougo/neosnippet'

"" neosnippet-snippets
Plug 'Shougo/neosnippet-snippets'

"" deoplete-flow
Plug 'steelsojka/deoplete-flow'

"" autocomplete-flow
Plug 'wokalski/autocomplete-flow'

"" nvim-typescript
Plug 'mhartington/nvim-typescript'

"" deoplete-ternjs
Plug 'carlitux/deoplete-ternjs'

"" yajs.vim
Plug 'othree/yajs.vim'

"" deol.vim
Plug 'Shougo/deol.nvim'

"" vim-airline
Plug 'vim-airline/vim-airline'

"" asyncomplete.vim
Plug 'prabirshrestha/asyncomplete.vim'

"" vimagit "
Plug 'jreybert/vimagit', {'on_cmd': ['Magit', 'MagitOnly']}

call plug#end()

" System Settings "
let mapleader = ','
set number
set list
set shiftwidth=2
set mouse=a

set list
set tw=60
set colorcolumn=60

" Themes, Commands, etc "
syntax enable
let g:one_allow_italics = 1
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme dracula
"(((

" Map's "(((
nnoremap <leader>sv :source ~/.config/nvim/init.vim<CR>

nnoremap <leader>af <esc>:ALEFix<CR>
nnoremap <leader>as <esc>:ALEFixSuggest<CR>
nnoremap <leader>at <esc>ALEToggle<CR>

nnoremap <leader>v :vsplit<CR>
nnoremap <leader>s :split<CR>
"(((

" Completition "(((
filetype plugin on
set omnifunc=syntaxcomplete#Complete
"(((

" deoplete "(((
let g:deoplete#enable_at_startup = 1
"(((

" air-line "(((
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
"(((

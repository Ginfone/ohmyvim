set exrc " Wont open project .nvimrc without this here

set scrolloff=8
set incsearch
set completeopt=menuone,noinsert,noselect
set number
set cmdheight=2
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set termguicolors
set nohlsearch
set noswapfile
set nowrap
set clipboard=unnamedplus


call plug#begin('~/.vim/plugged')
" telescope config
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

" Eslint
Plug 'dense-analysis/ale'

Plug 'mbbill/undotree'

" Git
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'

Plug 'tpope/vim-commentary'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" FireNvim
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" Svelte
Plug 'leafoftree/vim-svelte-plugin'

call plug#end()

colorscheme gruvbox
set background=dark

let mapleader = " "


nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
tnoremap <Esc> <C-\><C-n>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :Sex!<CR>

nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>


" Fix files with prettier, and then ESLint.
let g:ale_fixers = ['prettier', 'eslint']
let g:ale_fix_on_save = 1

" Svelte
let g:vim_svelte_plugin_load_full_syntax=1


lua require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}
lua require'lspconfig'.svelte.setup{on_attach=require'completion'.on_attach}
lua require'lspconfig'.diagnosticls.setup{}
lua require'lspconfig'.graphql.setup{on_attach=require'completion'.on_attach}
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true }}


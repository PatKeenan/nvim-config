let g:dracula_italic = 0

syntax on

set re=0
set scrolloff=10
set number
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set incsearch
set termguicolors
set signcolumn=yes
set isfname+=@-@
set cmdheight=1
set nowrap
set nu
set noswapfile
set hidden
set nohlsearch
set guicursor=
set noerrorbells
set smartindent
set spell spelllang=en_us




" Maps
let mapleader = " "
nnoremap n nzzzv
nnoremap n Nzzzv
noremap J mzJ'z
nnoremap d "_d
nnoremap <Leader>pv :Vex<CR>
nnoremap <Leader><CR> :so ~/.vimrc<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>f :Files<CR>
inoremap jk <esc>

" Undos
inoremap ! !<c-g>u
inoremap . .<c-g>u
inoremap , ,<c-g>u

" Move line above cursor
noremap <leader>k :m .-2<CR>==
noremap <leader>j :m .+1<CR>==

"Opening a new window in explorer
nnoremap <leader>N :Vexplore<CR>
"Plugins
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fz#install()}}
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'honza/vim-snippets'
Plug 'alvan/vim-closetag'
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug  'mattn/emmet-vim'
Plug 'ap/vim-css-color'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
call plug#end()




"Extension settings
let g:coc_global_extensions = [
            \ 'coc-tsserver'
            \ ]
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
    let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
    let g:coc_global_extensions += ['coc-eslint']
endif


"telescope
"" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
lua << EOF
require('telescope').setup{
file_ignore_patterns = { "node_modules" },
defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
        i = {
            -- map actions.which_key to <C-h> (default: <C-/>)
            -- actions.which_key shows the mappings for your picker,
            -- e.g. git_{create, delete, ...}_branch for the git_branches picker
            ["<C-h>"] = "which_key"
            }
        }
    },
pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}
EOF




" Spelling

let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#formatter = 'jsformatter'

 " Prettierconfig

 let g:prettier#autoformat = 0

 autocmd BufWritePre  *.yml,*.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

 let $FZF_DEFAULT_COMMAND='find . ! -path "*node_mdoules*"'
colorscheme dracula

"Emitt snippets setup

let g:user_emmet_settings = {
\  'variables': {'lang': 'en'},
\  'html': {
\    'default_attributes': {
\      'option': {'value': v:null},
\      'textarea': {'id': v:null, 'name': v:null, 'cols': 10, 'rows': 10},
\    },
\    'snippets': {
\      'html:5': "<!DOCTYPE html>\n"
\              ."<html lang=\"${lang}\">\n"
\              ."<head>\n"
\              ."\t<meta charset=\"${charset}\">\n"
\              ."\t<title></title>\n"
\              ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
\              ."</head>\n"
\              ."<body>\n\t${child}|\n</body>\n"
\              ."</html>",
\    },
\  },
\}

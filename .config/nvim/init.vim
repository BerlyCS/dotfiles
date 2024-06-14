" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath=&runtimepath
" source ~/.vimrc

syntax enable
set mouse=a
set number
set numberwidth=2
set clipboard+=unnamedplus
set showcmd
set ruler
set encoding=UTF-8
set showmatch
set relativenumber
set autoindent
set laststatus=4
set sw=4
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set ma
set noshowmode

" -----------------------------------------
" Plugins
"

call plug#begin()
" Themes
Plug 'morhetz/gruvbox'
" Plug 'ellisonleao/gruvbox.nvim'
Plug 'sainnhe/gruvbox-material'
Plug 'EdenEast/nightfox.nvim' " nightFOx
" Plug 'folke/tokyonight.nvim'
Plug 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' }
Plug 'tiagovla/tokyodark.nvim' 
Plug 'Shatur/neovim-ayu'
Plug 'Mofiqul/vscode.nvim'

Plug 'easymotion/vim-easymotion'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons' " Developer Icons
Plug 'tpope/vim-commentary' " For Commenting gcc & gc
Plug 'vim-airline/vim-airline' " Status bar
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs' " Autopairs
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intellisense
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Syntax support
" Plug 'sheerun/vim-polyglot'
 " Indent guides
Plug 'Yggdroot/indentLine'
" Plug 'tribela/vim-transparent'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'mhinz/vim-startify'
Plug 'christoomey/vim-tmux-navigator'
" Copilot
" Plug 'github/copilot.vim'
" React
" Plug 'SirVer/ultisnips'
" Plug 'mlaursen/vim-react-snippets'

"Git graph
Plug 'tpope/vim-fugitive'

"Tabline
Plug 'romgrk/barbar.nvim'
Plug 'nvim-tree/nvim-web-devicons' " OPTIONAL: for file icons

" Plug 'junegunn/rainbow_parentheses.vim'
" Plug 'HiPhish/rainbow-delimiters.nvim'


" Plug 'airblade/vim-gitgutter'
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'tag': 'legacy' }
endif

" Plug 'lervag/vimtex'
" Plug 'lervag/vimtex', { 'tag': 'v2.15' }

call plug#end()


" so ~/.config/nvim/plug-config/treesitter.lua
" so ~/.config/nvim/plug-config/nightfox.lua

" colorscheme gruvbox-material
" let g:deoplete#enable_at_startup = 1
" let g:jsx_ext_required = 0

" Important!!
if has('termguicolors')
    set termguicolors
endif

"" For dark version.

"" For light version.
"" set background=light

"" Available values: 'hard', 'medium'(default), 'soft'
"" This configuration option should be placed before `colorscheme gruvbox-material`.

let g:gruvbox_contrast_dark = "hard"
set background=dark
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_foreground='original'
let g:gruvbox_material_better_performance = 1
let g:gruvbox_material_transparent_background = 1
colorscheme gruvbox-material

" colorscheme gruvbox

"colorscheme moonfly 
" colorscheme vscode

" -----------------------------------------
" Keymaps

let mapleader=" "


" Move line
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" ToggleTerm
tnoremap <Esc> <C-\><C-n> " Exit terminal mode
tnoremap <silent><A-1> <Cmd>exe v:count1 . "ToggleTerm direction=float direction=horizontal size=20"<CR>
tnoremap <silent><A-2> <Cmd>exe v:count1 . "ToggleTerm direction=float direction=vertical size=50"<CR>
tnoremap <silent><A-3> <Cmd>exe v:count1 . "ToggleTerm direction=float"<CR>
nnoremap <A-1> :ToggleTerm direction=horizontal size=10<cr>
nnoremap <A-2> :ToggleTerm direction=vertical size=40<cr>
nnoremap <A-3> :ToggleTerm direction=float<cr>

"Compile cpp
autocmd FileType cpp nnoremap <buffer> <F5> :w<CR>:!make %:r<CR>
"Compile c
autocmd FileType c nnoremap <buffer> <F5> :w<CR>:!gcc -o %< %<CR>
" nnoremap <F5> :w<CR>:make "%<"<CR>
autocmd FileType tex nnoremap <buffer> <F5> :w<CR>:!pdflatex %<CR>:!xdg-open %<.pdf<CR>

nnoremap <C-€> :ToggleTerm direction=float<CR>node "%<"<CR>

"Quit and Save
nnoremap <C-q> :q!<CR>
nnoremap <C-s> :w<CR>

" Easymotion
nmap <Leader>s <Plug>(easymotion-s2)

" NerdTree
nnoremap <C-n> :NERDTreeToggle<CR>

" Split Navigation
map <C-v> <C-W>v
map <C-x> <C-W>s

" GoTo code navigation.
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Remap escape
nnoremap <C-c> <Esc>
"inoremap jk <Esc>
"inoremap kj <Esc>
"inoremap jj <Esc>
"inoremap kk <Esc>

"
"Git graph
" nnoremap <Leader>g 

" -----------------------------------------
" Plugins-Config

" Startify
let g:startify_custom_header =
          \ 'startify#center(startify#fortune#cowsay())'

" ToggleTerm
lua require("toggleterm").setup()

" Coc
" inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

" Seleccionar la sugestión con enter.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'
 
" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

 " Tags rainbow
"let g:rainbow_active = 1
"let g:rainbow#max_level = 16
"let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
"autocmd FileType * RainbowParentheses 


" " This is necessary for VimTeX to load properly. The "indent" is optional.
" " Note that most plugin managers will do this automatically.
" filetype plugin indent on

" " This enables Vim's and neovim's syntax-related features. Without this, some
" " VimTeX features will not work (see ":help vimtex-requirements" for more
" " info).
" " syntax enable

" " Viewer options: One may configure the viewer either by specifying a built-in
" " viewer method:
" let g:vimtex_view_method = 'zathura'

" " Or with a generic interface:
" let g:vimtex_view_general_viewer = 'okular'
" let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" " VimTeX uses latexmk as the default compiler backend. If you use it, which is
" " strongly recommended, you probably don't need to configure anything. If you
" " want another compiler backend, you can change it as follows. The list of
" " supported backends and further explanation is provided in the documentation,
" " see ":help vimtex-compiler".
" " let g:vimtex_compiler_method = 'latexrun'
" let g:vimtex_compiler_method = 'pdflatex'

" " Most VimTeX mappings rely on localleader and this can be changed with the
" " following line. The default is usually fine and is the symbol "\".
" let maplocalleader = ","

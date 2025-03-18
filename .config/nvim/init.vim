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
" set relativenumber
set laststatus=4
set sw=2
set tabstop=6
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smarttab
set ma
set noshowmode
set updatetime=2000

" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
" Plugins
" -----------------------------------------
" -----------------------------------------
" -----------------------------------------

call plug#begin()
" Themes
Plug 'sainnhe/gruvbox-material'
" Plug 'folke/tokyonight.nvim'
" Plug 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' }
" Plug 'tiagovla/tokyodark.nvim' 
" Plug 'Shatur/neovim-ayu'
Plug 'Mofiqul/vscode.nvim'
" Plug 'rainglow/vim' " 250+ themes
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'bluz71/vim-nightfly-colors'
Plug 'rebelot/kanagawa.nvim'

" Utilities
Plug 'easymotion/vim-easymotion'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons' " Developer Icons
Plug 'tpope/vim-commentary' " For Commenting gcc & gc
Plug 'vim-airline/vim-airline' " Status bar
" Plug 'lambdalisue/battery.vim'
" Plug 'vim-airline/vim-airline-themes'
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
" Plug 'tpope/vim-fugitive'

"Tabline
Plug 'romgrk/barbar.nvim'
Plug 'nvim-tree/nvim-web-devicons' " OPTIONAL: for file icons

" Plug 'junegunn/rainbow_parentheses.vim'
" Plug 'HiPhish/rainbow-delimiters.nvim'

" Git changes
" Plug 'airblade/vim-gitgutter'
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'tag': 'legacy' }
endif

" Plug 'lervag/vimtex'
Plug 'lervag/vimtex', { 'tag': 'v2.15' }

" use it with gaip see :h
" Plug 'junegunn/vim-easy-align'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }

" Competitive programming helper
Plug 'MunifTanjim/nui.nvim'        " it's a dependency
Plug 'xeluxee/competitest.nvim'
call plug#end()

so ~/.config/nvim/plug-config/treesitter.lua


" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
"  Theme
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------

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

" let g:gruvbox_contrast_dark = "medium"
" set background=dark
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_foreground='mix'
let g:gruvbox_material_better_performance = 1
let g:gruvbox_material_transparent_background = 1
colorscheme gruvbox-material

"colorscheme moonfly 

" colorscheme vscode
" colorscheme nightfly
" let g:airline_theme='deus'

" colorscheme catppuccin
" colorscheme kanagawa-wave

" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
" Keymaps
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------

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


" Map F5 to the custom function
inoremap <F5> <Esc>:!make %<<CR>
nnoremap <F5> :!make %<<CR>
  " autocmd FileType cpp nnoremap <buffer> <F5> :!make %<<CR>
" autocmd FileType c nnoremap <buffer> <F5> :!make %<<CR>

" Compile and run cpp
" autocmd FileType cpp nnoremap <buffer> <F5> :w<CR>:!g++ % -o %:r && ToggleTermSendCurrentLine ./%:r<CR>

" Compile and run c
" autocmd FileType c nnoremap <buffer> <F5> :w<CR>:!gcc % -o %:r && ToggleTermSendCurrentLine ./%:r<CR>

" nnoremap <F5> :w<CR>:make "%<"<CR>
autocmd FileType tex nnoremap <buffer> <F5> :w<CR>:!rm main.pdf; pdflatex -quiet %; okular %<.pdf<CR>


"Quit and Save
nnoremap <C-q> :q<CR>
nnoremap <A-q> :q!<CR>
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>

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

" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
" Plugins-Config
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------
" ------------------------------------------------------------------------------

" Startify
" let g:startify_custom_header = 'startify#center(startify#fortune#cowsay())'
" let g:startify_custom_header = startify#pad(split(system('figlet nvim'), '\n'))
"
let banner = [
\ '╔─────────────────────────────────────────────────────────────╗',
\ '│                                                             │',
\ '│  /$$   /$$                                /$$               │',
\ '│ | $$$ | $$                               |__/               │',
\ '│ | $$$$| $$  /$$$$$$   /$$$$$$  /$$    /$$ /$$ /$$$$$$/$$$$  │',
\ '│ | $$ $$ $$ /$$__  $$ /$$__  $$|  $$  /$$/| $$| $$_  $$_  $$ │',
\ '│ | $$  $$$$| $$$$$$$$| $$  \ $$ \  $$/$$/ | $$| $$ \ $$ \ $$ │',
\ '│ | $$\  $$$| $$_____/| $$  | $$  \  $$$/  | $$| $$ | $$ | $$ │',
\ '│ | $$ \  $$|  $$$$$$$|  $$$$$$/   \  $/   | $$| $$ | $$ | $$ │',
\ '│ |__/  \__/ \_______/ \______/     \_/    |__/|__/ |__/ |__/ │',
\ '│                                                             │',
\ '╚─────────────────────────────────────────────────────────────╝'
\ ]

" let g:startify_custom_header = startify#center(banner)
let g:startify_custom_header = 
      \ startify#center(startify#fortune#cowsay('', '═','║','╔','╗','╝','╚'))

let g:startify_custom_footer = 
            \ startify#center(banner)

" \ { 'type': 'files',     'header': ['   MRU']            },                 
let g:startify_lists = [
            \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
            \ { 'type': 'sessions',  'header': ['   Sessions']       },                 
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ { 'type': 'commands',  'header': ['   Commands']       },
            \ ]

let g:startify_bookmarks = [
            \ '~/.config/nvim/init.vim',
            \ '~/Documentos',
            \ '~/.config/fish/config.fish',
            \ '~/.config/sway/config',
            \ '~/.config/waybar/config',
            \ ]

let g:startify_session_dir = '~/.config/nvim/sessions'
" highlight StartifyBracket ctermfg=240
" highlight StartifyFooter  ctermfg=240
" highlight StartifyHeader  ctermfg=114
" highlight StartifyNumber  ctermfg=215
" highlight StartifyPath    ctermfg=245
" highlight StartifySlash   ctermfg=240
" highlight StartifySpecial ctermfg=240

"----------------------------------------------------------------------------


" ToggleTerm
lua require("toggleterm").setup()

"----------------------------------------------------------------------------
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
 
"----------------------------------------------------------------------------
" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols see :h airline_customization
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = '󰌾'
let g:airline_symbols.linenr = ''

" let g:airline_left_alt_sep = ' '
let g:airline_left_alt_sep = ''
" let g:airline_left_sep = ' '
let g:airline_left_sep = ''

" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
let g:airline_symbols.maxlinenr = '󰈙'
let g:airline_symbols.colnr = ''

" Airline bar
" let g:airline#extensions#tabline#enabled = 1
" nmap <leader>1 <Plug>AirlineSelectTab1
" nmap <leader>2 <Plug>AirlineSelectTab2
" nmap <leader>3 <Plug>AirlineSelectTab3
" nmap <leader>4 <Plug>AirlineSelectTab4
" nmap <leader>5 <Plug>AirlineSelectTab5
" nmap <leader>6 <Plug>AirlineSelectTab6
" nmap <leader>7 <Plug>AirlineSelectTab7
" nmap <leader>8 <Plug>AirlineSelectTab8
" nmap <leader>9 <Plug>AirlineSelectTab9
" nmap <leader>0 <Plug>AirlineSelectTab0
" nmap <leader>- <Plug>AirlineSelectPrevTab
" nmap <leader>+ <Plug>AirlineSelectNextTab

let g:airline#extensions#disable_rtp_load = 1
"----------------------------------------------------------------------------
" Tags rainbow
" let g:rainbow_active = 1
" let g:rainbow#max_level = 16
" let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
" autocmd FileType * RainbowParentheses 


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
let g:vimtex_view_general_viewer = 'okular'
" let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" " VimTeX uses latexmk as the default compiler backend. If you use it, which is
" " strongly recommended, you probably don't need to configure anything. If you
" " want another compiler backend, you can change it as follows. The list of
" " supported backends and further explanation is provided in the documentation,
" " see ":help vimtex-compiler".
" " let g:vimtex_compiler_method = 'latexrun'
let g:vimtex_compiler_method = 'pdflatex'

" " Most VimTeX mappings rely on localleader and this can be changed with the
" " following line. The default is usually fine and is the symbol "\".
" let maplocalleader = ","
"----------------------------------------------------------------------------

" Move to previous/next
nnoremap <silent>    <C-,> <Cmd>BufferPrevious<CR>
nnoremap <silent>    <C-.> <Cmd>BufferNext<CR>

" " Re-order to previous/next
" nnoremap <silent>    <A-<> <Cmd>BufferMovePrevious<CR>
" nnoremap <silent>    <A->> <Cmd>BufferMoveNext<CR>

" Goto buffer in position...
nnoremap <silent>    <Leader>1 <Cmd>BufferGoto 1<CR>
nnoremap <silent>    <Leader>2 <Cmd>BufferGoto 2<CR>
nnoremap <silent>    <Leader>3 <Cmd>BufferGoto 3<CR>
nnoremap <silent>    <Leader>4 <Cmd>BufferGoto 4<CR>
nnoremap <silent>    <Leader>5 <Cmd>BufferGoto 5<CR>
nnoremap <silent>    <Leader>6 <Cmd>BufferGoto 6<CR>
nnoremap <silent>    <Leader>7 <Cmd>BufferGoto 7<CR>
nnoremap <silent>    <Leader>8 <Cmd>BufferGoto 8<CR>
nnoremap <silent>    <Leader>9 <Cmd>BufferGoto 9<CR>
nnoremap <silent>    <Leader>0 <Cmd>BufferLast<CR>

" " Pin/unpin buffer
" nnoremap <silent>    <A-p> <Cmd>BufferPin<CR>

" " Close buffer
" nnoremap <silent>    <A-c> <Cmd>BufferClose<CR>
" " Restore buffer
" nnoremap <silent>    <A-s-c> <Cmd>BufferRestore<CR>

" " Wipeout buffer
" "                          :BufferWipeout
" " Close commands
" "                          :BufferCloseAllButCurrent
" "                          :BufferCloseAllButVisible
" "                          :BufferCloseAllButPinned
" "                          :BufferCloseAllButCurrentOrPinned
" "                          :BufferCloseBuffersLeft
" "                          :BufferCloseBuffersRight

" " Magic buffer-picking mode
" nnoremap <silent> <C-p>    <Cmd>BufferPick<CR>
" nnoremap <silent> <C-p>    <Cmd>BufferPickDelete<CR>

" " Sort automatically by...
" nnoremap <silent> <Space>bb <Cmd>BufferOrderByBufferNumber<CR>
" nnoremap <silent> <Space>bn <Cmd>BufferOrderByName<CR>
" nnoremap <silent> <Space>bd <Cmd>BufferOrderByDirectory<CR>
" nnoremap <silent> <Space>bl <Cmd>BufferOrderByLanguage<CR>
" nnoremap <silent> <Space>bw <Cmd>BufferOrderByWindowNumber<CR>

" " Other:
" " :BarbarEnable - enables barbar (enabled by default)
" " :BarbarDisable - very bad command, should never be used

"-----------------------------------------------------------------------------

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"-----------------------------------------------------------------------------
"
lua require('competitest').setup() -- to use default configuration

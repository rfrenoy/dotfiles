" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins.
call plug#begin('~/.vim/plugged')

" Show git file changes in the gutter.
Plug 'mhinz/vim-signify'

" New colorscheme
Plug 'morhetz/gruvbox'

" File explorer
Plug 'preservim/nerdtree'

" Asynchronous Lint Engine
Plug 'dense-analysis/ale'

" Shiny status line
Plug 'vim-airline/vim-airline'

" Debugging plugin
Plug 'puremourning/vimspector'

call plug#end()


" -----------------------------------------------------------------------------
" Settings
" -----------------------------------------------------------------------------

" Enabling filetype support provides filetype-specific indenting,
" " syntax highlighting, omni-completion and other useful settings.
filetype plugin indent on
syntax on
set number				" Show line number
set relativenumber			" Show relative line number
set noshowmatch				" Show matching bracket
set wildmenu				" Change completion menu behavior
set wildignore=*.o,*~,*.pyc		" Ignore certain file patterns
set noerrorbells			" No error bells...
set smartcase
set incsearch				" Show all matching patterns in file
set updatetime=50
set backspace=indent,eol,start 		" Make backspace work as it should
set encoding=utf8
set wrap				" Wrap text, does not change buffer
set laststatus=2			" Always show status line
set hidden				" Possibility to have more than one unsaved buffers
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set colorcolumn=80			" Vertical line at char 80
set cursorline				" Horizontal line at cursor line
set scrolloff=3				" Keep 3 lines below and above the cursor
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Spliting below and right when issuing :split and :vsplit
set splitbelow
set splitright


""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""" GRUVBOX """""""""""""""""
""""""""""""""""""""""""""""""""""""""""""
colorscheme gruvbox
set background=dark

let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""" NERDTREE """"""""""""""""
""""""""""""""""""""""""""""""""""""""""""
" Leave Vim when the only buffer open is a NerdTree tab
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


""""""""""""""""""""""""""""""""""""""""""
""""""""""""""" VIMSPECTOR """""""""""""""
""""""""""""""""""""""""""""""""""""""""""
let g:vimspector_enable_mappings = 'HUMAN'
" mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)
" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval
nmap <LocalLeader><F11> <Plug>VimspectorUpFrame
nmap <LocalLeader><F12> <Plug>VimspectorDownFrame


" -----------------------------------------------------------------------------
" Keymaps
" -----------------------------------------------------------------------------

let mapleader = " "
nnoremap <leader>e :NERDTreeToggle<CR>

" Going back to normal mode with jk in insert or visual mode
:inoremap jk <Esc>
:xnoremap jk <Esc>

" Window commands
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>


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

" Show keybindings
Plug 'liuchengxu/vim-which-key'

" Asynchronous completion in neovim
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1
endif

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


" -----------------------------------------------------------------------------
" Keymaps
" -----------------------------------------------------------------------------

let mapleader = " "

" Making leader then nothing show keybindings possibilities
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
call which_key#register('<Space>', "g:which_key_map")
let g:which_key_map = {}

nnoremap <leader>e :NERDTreeToggle<CR>

" Going back to normal mode with jk in insert or visual mode
:inoremap jk <Esc>
:xnoremap jk <Esc>

" Window commands
nnoremap <leader>h :wincmd h<CR>
let g:which_key_map.h = 'Go to left window'
nnoremap <leader>j :wincmd j<CR>
let g:which_key_map.j = 'Go to down window'
nnoremap <leader>k :wincmd k<CR>
let g:which_key_map.k = 'Go to up window'
nnoremap <leader>l :wincmd l<CR>
let g:which_key_map.l = 'Go to right window'
" Make leader+C close buffer without closing window
nnoremap <leader>c :bp<bar>sp<bar>bn<bar>bd<CR>
let g:which_key_map.c = 'Close window'
nnoremap <leader>w :wincmd w<CR>


" VIMSPECTOR
" 'ds' = debug start
let g:which_key_map.d = { 'name' : '+Debug' }
nnoremap <leader>ds :call vimspector#Launch()<CR>
let g:which_key_map.d.s = 'Start debugger'
nnoremap <leader>dq :call vimspector#Reset()<CR>
let g:which_key_map.d.q = 'Quit debugger'
nnoremap <leader>dc :call vimspector#Continue()<CR>
let g:which_key_map.d.c = 'Continue'
nnoremap <leader>dt :call vimspector#ToggleBreakpoint()<CR>
let g:which_key_map.d.t = 'Toggle breakpoint'
nnoremap <leader>dT :call vimspector#ClearBreakpoints()<CR>
let g:which_key_map.d.R = 'Clear breakpoints'
nmap <leader>dk <Plug>VimspectorRestart
let g:which_key_map.d.dk = 'Restart debugger'
nmap <leader>dh <Plug>VimspectorStepOut
nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
" 'di' = 'debug inspect' (pick your own, if you prefer!)
nmap <leader>di <Plug>VimspectorBalloonEval
nmap <leader>dU <Plug>VimspectorUpFrame
nmap <leader>dD <Plug>VimspectorDownFrame


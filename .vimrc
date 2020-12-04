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

" Handle surrounding characters easily
Plug 'tpope/vim-surround'

" Git integration within Vim
Plug 'tpope/vim-fugitive'

" New colorscheme
Plug 'morhetz/gruvbox'

" File explorer
Plug 'preservim/nerdtree'

" Initialize plugin system
call plug#end()


" -----------------------------------------------------------------------------
" Settings
" -----------------------------------------------------------------------------

set nocompatible
set nu
set rnu
set noshowmatch
set wildmenu
set wildignore=*.o,*~,*.pyc
set noerrorbells
set smartcase
set nohlsearch
set incsearch
set magic
syntax enable
set updatetime=50

set termguicolors

set complete+=kspell
set completeopt=menuone,longest
set shortmess+=c

set hidden
set encoding=utf8
set expandtab
set smarttab
set smartindent
set wrap
set laststatus=2

set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

set colorcolumn=80
set cursorline
highlight ColorColumn ctermbg=0 guibg=lightgrey

set splitbelow
set splitright

set scrolloff=3 " Keep 3 lines below and above the cursor

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 50)
augroup END

" Remove trailing white-space
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()

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
"""""""""""""" INDENTATION """""""""""""""
""""""""""""""""""""""""""""""""""""""""""
" Use autocmd as long as we have only few file types, else switch to cleaner
" specific files per filetype, see
" https://stackoverflow.com/questions/158968/changing-vim-indentation-behavior-by-file-type
" https://vim.fandom.com/wiki/Indenting_source_code
set tabstop=4 softtabstop=4
set shiftwidth=4
autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType json setlocal expandtab shiftwidth=4 softtabstop=4

""""""""""""""""""""""""""""""""""""""""""
"""""""""""""" VIM-SURROUND """"""""""""""
""""""""""""""""""""""""""""""""""""""""""
let g:surround_100 = "{{ \r }}"

""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""" NERDTREE """"""""""""""""
""""""""""""""""""""""""""""""""""""""""""
" Leave Vim when the only buffer open is a NerdTree tab
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" -----------------------------------------------------------------------------
" Keymaps
" -----------------------------------------------------------------------------

" Avoid bad reflexes
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

let mapleader = " "

nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>of :Files<CR>
nnoremap <leader>ff :Rg<CR>

nnoremap <leader>e :NERDTreeToggle<CR>

" Window commands
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Auto closing with matching brackets
inoremap ( ()<C-G>U<Left>
inoremap [ []<C-G>U<Left>
inoremap { {}<C-G>U<Left>
inoremap " ""<C-G>U<Left>
inoremap ' ''<C-G>U<Left>

" Vim fugitive mappings
nnoremap <leader>gst :Gstatus<CR>
nnoremap <leader>gci :Gcommit<CR>
nnoremap <leader>gpush :Gpush<CR>
nnoremap <leader>gpull :Gpull<CR>
nnoremap <leader>gf :Gfetch<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>



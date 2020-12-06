" Check Python files with flake8 and pylint.
let b:ale_linters = ['pyls', 'flake8', 'pylint']

" Fix Python files with autopep8 and yapf.
let b:ale_fixers = ['autopep8', 'yapf']

" Integration with vim-airline plugin
let g:airline#extensions#ale#enabled = 1

" Navigation between ALE errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Remapping fixes
nnoremap <silent> <leader>ff :ALEFix<CR>
nnoremap <silent> <leader>gd :ALEGoToDefinition<CR>

" Enable completion
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1

" Trigger completion with C-x X-o
set omnifunc=ale#completion#OmniFunc

" Trigger information display at cursor
let g:ale_hover_cursor = 1

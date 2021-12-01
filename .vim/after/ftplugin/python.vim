" Install vimspector python gadget if necessary
let g:vimspector_install_gadgets = ['debugpy']

" Check Python files with flake8 and pylint.
let b:ale_linters = ['pyright', 'flake8', 'pylint']

" Fix Python files with autopep8 and yapf.
let b:ale_fixers = ['autopep8', 'yapf']

" Integration with vim-airline plugin
let g:airline#extensions#ale#enabled = 1

" Navigation between ALE errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Remapping ALE actions
nnoremap <silent> <leader>ff :ALEFix<CR>
nnoremap <silent> <leader>ag :ALEGoToDefinition<CR>
nnoremap <silent> <leader>ar :ALERename<CR>
nnoremap <silent> <leader>af :ALEFindReferences<CR>
nnoremap <silent> <leader>at :ALEToggle<CR>
nnoremap <silent> <leader>ah :ALEHover<CR>

" Enable completion
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1

" Trigger completion with C-x C-o
set omnifunc=ale#completion#OmniFunc

" Run current script
nnoremap <leader>R :term python %<CR>

" Run current test file
nnoremap <leader>T :term python -m unittest %<CR>

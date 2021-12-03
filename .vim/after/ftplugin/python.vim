" Install vimspector python gadget if necessary
let g:vimspector_install_gadgets = ['debugpy']

" Check Python files with flake8 and pylint.
let b:ale_linters = ['pyright', 'flake8', 'pylint']

" Fix Python files with autopep8 and yapf.
let b:ale_fixers = ['yapf']

" Integration with vim-airline plugin
let g:airline#extensions#ale#enabled = 1

" Navigation between ALE errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Remapping ALE actions
let g:which_key_map.a = { 'name' : '+ALE' }

nnoremap <silent> <leader>aF :ALEFix<CR>
let g:which_key_map.a.F = 'ALE Fix'

nnoremap <silent> <leader>ag :ALEGoToDefinition<CR>
let g:which_key_map.a.g = 'ALE Go to Definition'

nnoremap <silent> <leader>ar :ALERename<CR>
let g:which_key_map.a.r = 'ALE Rename'

nnoremap <silent> <leader>af :ALEFindReferences<CR>
let g:which_key_map.a.f = 'ALE Find References'

nnoremap <silent> <leader>at :ALEToggle<CR>
let g:which_key_map.a.t = 'ALE Toggle'

nnoremap <silent> <leader>ah :ALEHover<CR>
let g:which_key_map.a.h = 'ALE Hover'

" Enable completion
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
let g:ale_completion_delay = 10

" Trigger completion with C-x C-o
set omnifunc=ale#completion#OmniFunc

" Run current script
nnoremap <leader>R :term python %<CR>

" Run current test file
nnoremap <leader>T :term python -m unittest %<CR>
nnoremap <leader>t :term pytest<CR>


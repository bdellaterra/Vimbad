
" VIMFILER

" Use Vimfiler as the default file explorer.
if !exists('g:vimfiler_as_default_explorer')
    let g:vimfiler_as_default_explorer = 1
endif

" Enter key opens files
if !exists('g:vimfiler_execute_file_list')
    let g:vimfiler_execute_file_list = {}
    let g:vimfiler_execute_file_list['_'] = 'vim'
endif



" Create Gundo help menu.
ANoremenumap &Help.&Plugins 'Gundo: Visualize your Vim undo tree' ''
						\ :help gundo<CR> 

" <Leader>ut: View undo-tree.
ANoremenumap333 &Edit 'Toggle Undo Tree' '<Leader>ut'
                        \ :GundoToggle<CR>


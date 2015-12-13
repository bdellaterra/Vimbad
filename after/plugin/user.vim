" Set the colorscheme
colorscheme greyman

" USER MAPPINGS

" <Leader>wd: Copy working directory to the clipboard
Noremenumap <silent> &Extra 'Copy working directory to clipboard' '<Leader>wd'
						\ :silent! let @+=fnamemodify(bufname(''),':p:h')<CR>

" <Leader>hs: Toggle search pattern highlighting
ANoremenumap &Extra 'Toggle Highlighting of Search Patterns' '<Leader>hs'
						\ :set hlsearch!<CR> 


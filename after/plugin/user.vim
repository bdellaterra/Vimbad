" Set the colorscheme
colorscheme greyman

" USER MAPPINGS

" Copy working directory to the clipboard with mapping '<Leader>wd'
call CreateMenuItem('&Extra',
	\ ":silent! let @+=fnamemodify(bufname(''),':p:h')<CR>",
	\ 'Copy working directory to clipboard', '', ['<Leader>wd'],
	\ 'noremenu <silent>')

" <Leader>hs: Toggle search pattern highlighting
call CreateMenuItem('&Extra', ':set hlsearch!<CR>', 'Toggle Highlighting of Search Patterns', '', ['<Leader>hs'], 'anoremenu')


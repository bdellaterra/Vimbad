
" FUGITIVE

" Create help menu.
call conviction#CreatePluginHelpMenuItem(
						\ 'fugitive',
						\ 'Fugitive: A Git wrapper so awesome, it should be illegal'
						\ )

" Here is a list of mappings for the Fugitive plugin:
let s:FugitiveMaps = [
						\ [ ':Git ', '<leader>g' ],
						\ [ ':Gcd ', '<leader>gd' ],
						\ [ ':Gread<CR>', '<leader>grd' ],
						\ [ ':Gwrite<CR>', '<leader>gw' ],
						\ [ ':Gstatus<CR>', '<leader>gs' ],
						\ [ ':Gcommit<CR>', '<leader>gc' ],
						\ [ ':Ggrep ', '<leader>gg' ],
						\ [ ':Glog<CR>', '<leader>gl' ],
						\ [ ':Gedit ', '<leader>ge' ],
						\ [ ':Gsplit ', '<leader>gsp' ],
						\ [ ':Gvsplit ', '<leader>gvs' ],
						\ [ ':Gdiff<CR>', '<leader>gdf' ],
						\ [ ':Gvdiff<CR>', '<leader>gvd' ],
						\ [ ':Gsdiff<CR>', '<leader>gsd' ],
						\ [ ':Gremove<CR>', '<leader>grm' ],
						\ [ ':Gblame<CR>', '<leader>gbl' ],
						\ [ ':Gbrowse<CR>', '<leader>gbr' ],
						\ [ ':Gwq<CR>', '<leader>gwq' ],
						\ ]

" Create a mapping and menu item for each entry in the dictionary.
for [rhs,lhs] in s:FugitiveMaps
	call conviction#CreateMenuItem('&Git', rhs, '', '', [lhs], 'nvinoremenu')
endfor


" File:         colorizer.vim
" Description:  Brian Dellaterra's Personal Vim Configuration
" Author:       Brian Dellaterra <github.com/bdellaterra>
" Version:      0.1.1
" License:      Copyright 2015 Brian Dellaterra. This file is part of Vimbad.
"               Distributed under the terms of the GNU Lesser General Public License. See the file LICENSE or <http://www.gnu.org/licenses/>.


" Visual CSS Colors
NVIONoremenumap &Edit.&Color\ Codes.&Colorizer '&Toggle Colors' '<leader>tc'
						\ :ColorToggle<CR>
NVIONoremenumap &Edit.&Color\ Codes.&Colorizer '&Enable Colors' '<leader>ec'
						\ :ColorHighlight()<CR>
NVIONoremenumap &Edit.&Color\ Codes.&Colorizer '&Disable Colors' '<leader>dc'
						\ :ColorClear<CR>


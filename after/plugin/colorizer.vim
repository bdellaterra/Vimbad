" File:         colorizer.vim
" Description:  Brian Dellaterra's Personal Vim Configuration
" Author:       Brian Dellaterra <github.com/bdellaterra>
" Version:      0.1.1
" License:      Copyright 2015-2017 Brian Dellaterra. This file is part of Vimbad.
"               Distributed under the terms of the GNU Lesser General Public License. See the file LICENSE or <http://www.gnu.org/licenses/>.


" Visual CSS Colors

" <Leader>cct: Toggle Colors
NVIONoremenumap &Edit.&Color\ Scheme.&Color\ Codes '&Toggle Colors' '<leader>cct'
						\ :ColorToggle<CR>

" <Leader>cce: Enable Colors
NVIONoremenumap &Edit.&Color\ Scheme.&Color\ Codes '&Enable Colors' '<leader>cce'
						\ :ColorHighlight<CR>

" <Leader>ccd: Disable Colors
NVIONoremenumap &Edit.&Color\ Scheme.&Color\ Codes '&Disable Colors' '<leader>ccd'
						\ :ColorClear<CR>


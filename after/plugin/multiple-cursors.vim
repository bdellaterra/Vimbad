" File:			after/plugin/multiple-cursors.vim
" Description:	Brian Dellaterra's Personal Vim Configuration
" Author:		Brian Dellatera <github.com/bdellaterra>
" Version:		0.1.1
" License:      Copyright 2015 Brian Dellaterra. This file is part of Vimbad.
" 				Distributed under the terms of the GNU Lesser General Public License.
"				See the file LICENSE or <http://www.gnu.org/licenses/>.


" Create help menu.
ANoremenu &Help.&Plugins 'Multiple-Cursors: True Sublime Text style multiple selections for Vim' ''
						\ :help multiple-cursors<CR> 

" Multi-Cursor Selections
NVOIMenu &Edit.Multiple\ &Cursors '&New/Next Selection' 'Ctrl+n'
						\ <C-n>
NVIOMenu &Edit.Multiple\ &Cursors '&Previous Selection' 'Ctrl+p'
						\ <C-p>
NVIOMenu &Edit.Multiple\ &Cursors '&Skip Selection' 'Ctrl+x'
						\ <C-x>
NVIOMenu &Edit.Multiple\ &Cursors '&Quit Multi-Cursor Selection' 'Escape'
						\ <Esc>
NVIONoremenumap &Edit.Multiple\ &Cursors 'Multi-Cursor Regex Search' '<Leader>mc'
                        \ :MultipleCursorsFind 


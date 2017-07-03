" File:			after/plugin/gundo.vim
" Description:	Brian Dellaterra's Personal Vim Configuration
" Author:		Brian Dellatera <github.com/bdellaterra>
" Version:		0.1.1
" License:      Copyright 2015-2017 Brian Dellaterra. This file is part of Vimbad.
" 				Distributed under the terms of the GNU Lesser General Public License.
"				See the file LICENSE or <http://www.gnu.org/licenses/>.

" Create help menu.
ANoremenu &Help.&Plugins 'Gundo: Visualize your Vim undo tree' ''
						\ :help gundo<CR> 

" <Leader>tu: View undo-tree.
NVIONoremenumap 333 &Edit 'Undo &History' '<Leader>tu'
                        \ :GundoToggle<CR>


" File:			after/plugin/vimfiler.vim
" Description:	Brian Dellaterra's Personal Vim Configuration
" Author:		Brian Dellatera <github.com/bdellaterra>
" Version:		0.1.1
" License:      Copyright 2015 Brian Dellaterra. This file is part of Vimbad.
" 				Distributed under the terms of the GNU Lesser General Public License.
"				See the file LICENSE or <http://www.gnu.org/licenses/>.

" VIMFILER

" Create help menu
ANoremenumap &Help.&Plugins 'Vimfiler: A powerful file explorer' ''
						\ :help vimfiler<CR> 

" <leader>fb: Toggle File Browser
ANoremenumap 300 &File 'Toggle File Browser' '<Leader>fb'
                        \ :VimFiler<CR>


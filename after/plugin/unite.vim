" File:			after/plugin/unite.vim
" Description:	Brian Dellaterra's Personal Vim Configuration
" Author:		Brian Dellatera <github.com/bdellaterra>
" Version:		0.1.1
" License:      Copyright 2015 Brian Dellaterra. This file is part of Vimbad.
" 				Distributed under the terms of the GNU Lesser General Public License.
"				See the file LICENSE or <http://www.gnu.org/licenses/>.


" Create help menu.
ANoremenu &Help.&Plugins 'Unite: Unite and create user interfaces' ''
						\ :help unite<CR> 

" <Leader>bb: Toggle buffer browser
NVIONoremenumap 210 &File '&Buffer Browser' '<Leader>bb'
						\ :Unite buffer<CR>


" File:			after/plugin/user.vim
" Description:	Brian Dellaterra's Personal Vim Configuration
" Author:		Brian Dellatera <github.com/bdellaterra>
" Version:		0.1.1
" License:      Copyright 2015 Brian Dellaterra. This file is part of Vimbad.
" 				Distributed under the terms of the GNU Lesser General Public License.
"				See the file LICENSE or <http://www.gnu.org/licenses/>.

" Set the colorscheme
colorscheme greyman

" set the font
set guifont=Liberation\ Mono\ 14

" USER MAPPINGS

" <Leader>wd: Copy working directory to the clipboard
Noremenumap <silent> &Extra 'Copy working directory to clipboard' '<Leader>wd'
						\ :silent! let @+=fnamemodify(bufname(''),':p:h')<CR>

" <Leader>hs: Toggle search pattern highlighting
ANoremenumap &Extra 'Toggle Highlighting of Search Patterns' '<Leader>hs'
						\ :set hlsearch!<CR> 


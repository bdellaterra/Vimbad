" File:			plugin/lvimrc.vim
" Description:	Brian Dellaterra's Personal Vim Configuration
" Author:		Brian Dellatera <github.com/bdellaterra>
" Version:		0.1.1
" License:      Copyright 2015-2017 Brian Dellaterra. This file is part of Vimbad.
" 				Distributed under the terms of the GNU Lesser General Public License.
"				See the file LICENSE or <http://www.gnu.org/licenses/>.


" Ask before sourcing local rc files
let g:localvimrc_ask = 1

" Source local rc files in sandbox mode for better security
let g:localvimrc_sandbox = 0

" Persistently save decisions on which local rc files are sourced
let g:localvimrc_persistent = 1

" Load local vimrc files on BufNewFile and BufRead events
" (In time to define variables for use in filetype skeletons)
let g:localvimrc_event = [ 'BufNewFile', 'BufRead' ]


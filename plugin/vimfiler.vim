" File:			plugin/vimfiler.vim
" Description:	Brian Dellaterra's Personal Vim Configuration
" Author:		Brian Dellatera <github.com/bdellaterra>
" Version:		0.1.1
" License:      Copyright 2015 Brian Dellaterra. This file is part of Vimbad.
" 				Distributed under the terms of the GNU Lesser General Public License.
"				See the file LICENSE or <http://www.gnu.org/licenses/>.


" Use Vimfiler as the default file explorer.
if !exists('g:vimfiler_as_default_explorer')
    let g:vimfiler_as_default_explorer = 1
endif

" Enter key opens files
if !exists('g:vimfiler_execute_file_list')
    let g:vimfiler_execute_file_list = {}
    let g:vimfiler_execute_file_list['_'] = 'vim'
endif


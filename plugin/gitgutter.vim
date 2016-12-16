" File:			plugin/gitgutter.vim
" Description:	Brian Dellaterra's Personal Vim Configuration
" Author:		Brian Dellatera <github.com/bdellaterra>
" Version:		0.1.1
" License:      Copyright 2015 Brian Dellaterra. This file is part of Vimbad.
" 				Distributed under the terms of the GNU Lesser General Public License.
"				See the file LICENSE or <http://www.gnu.org/licenses/>.


" Settings
let g:gitgutter_diff_args = '-w'
let g:gitgutter_sign_column_always = 1
" let g:gitgutter_override_sign_column_highlight = 0

" Awkwardly fix glitchy Sign Column after switching colorschemes
autocmd FileType,ColorScheme * highlight clear SignColumn


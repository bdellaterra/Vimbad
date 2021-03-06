" File:			plugin/gitgutter.vim
" Description:	Brian Dellaterra's Personal Vim Configuration
" Author:		Brian Dellatera <github.com/bdellaterra>
" Version:		0.1.1
" License:      Copyright 2015 Brian Dellaterra. This file is part of Vimbad.
" 				Distributed under the terms of the GNU Lesser General Public License.
"				See the file LICENSE or <http://www.gnu.org/licenses/>.


" Non-default Mappings (All Git commands start with 'g' for consistentcy)
nmap <Leader>ggs <Plug>GitGutterStageHunk
nmap <Leader>ggu <Plug>GitGutterUndoHunk
nmap <Leader>ggp <Plug>GitGutterPreviewHunk

" Settings
let g:gitgutter_diff_args = '-w'
set signcolumn=yes
" let g:gitgutter_override_sign_column_highlight = 0

" Awkwardly fix glitchy Sign Column after switching colorschemes
autocmd FileType,ColorScheme * highlight clear SignColumn


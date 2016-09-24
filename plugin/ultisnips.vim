" File:			plugin/ultisnips.vim
" Description:	Brian Dellaterra's Personal Vim Configuration
" Author:		Brian Dellatera <github.com/bdellaterra>
" Version:		0.1.1
" License:      Copyright 2015 Brian Dellaterra. This file is part of Vimbad.
" 				Distributed under the terms of the GNU Lesser General Public License.
"				See the file LICENSE or <http://www.gnu.org/licenses/>.


" Directory where personal snippets are stored
let g:UltiSnipsSnippetsDir = '~/.snippets/vim'

" Define triggers
let g:UltiSnipsExpandTrigger        =  "<S-Enter>"
let g:UltiSnipsListSnippets         =  "<C-Enter>"

" Undefine triggers
" NOTE: These are combo-mapped to <Tab> and <S-Tab> in after/neocomplete.vim
let g:UltiSnipsJumpForwardTrigger = "<nop>"
let g:UltiSnipsJumpBackwardTrigger = "<nop>"
let g:UltiSnipsMappingsToIgnore = ["JumpTabOrComplete", "JumpBackSTabOrComplete"]



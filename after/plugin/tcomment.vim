" File:			after/plugin/tcomment.vim
" Description:	Brian Dellaterra's Personal Vim Configuration
" Author:		Brian Dellatera <github.com/bdellaterra>
" Version:		0.1.1
" License:      Copyright 2015 Brian Dellaterra. This file is part of Vimbad.
" 				Distributed under the terms of the GNU Lesser General Public License.
"				See the file LICENSE or <http://www.gnu.org/licenses/>.


" Create help menu.
ANoremenu &Help.&Plugins 'TComment: An extensible & universal comment vim-plugin that also handles embedded filetypes' ''
						\ :help tcomment.txt<CR> 

" Comments
NOIMenu &Edit.Commen&ts 'Comment/Uncomment Current &Line' 'gcc'
						\ gcc
VMenu &Edit.Commen&ts 'Comment/Uncomment &Selection' 'gc'
						\ gc


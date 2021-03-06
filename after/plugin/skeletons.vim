" File:			after/plugin/skeletons.vim
" Description:	Brian Dellaterra's Personal Vim Configuration
" Author:		Brian Dellatera <github.com/bdellaterra>
" Version:		0.1.1
" License:      Copyright 2015 Brian Dellaterra. This file is part of Vimbad.
" 				Distributed under the terms of the GNU Lesser General Public License.
"				See the file LICENSE or <http://www.gnu.org/licenses/>.


" Create help menu.
ANoremenu &Help.&Plugins 'Skeletons: Quickly scaffold template files using UltiSnips templates' ''
         \ :help vim-skeletons<CR>     " No Help Available

" Set directory where skeletons are stored
let skeletons#skeletonsDir += ["~/.skeletons/vim"]



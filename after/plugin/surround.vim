" File:			after/plugin/surround.vim
" Description:	Brian Dellaterra's Personal Vim Configuration
" Author:		Brian Dellatera <github.com/bdellaterra>
" Version:		0.1.1
" License:      Copyright 2015 Brian Dellaterra. This file is part of Vimbad.
" 				Distributed under the terms of the GNU Lesser General Public License.
"				See the file LICENSE or <http://www.gnu.org/licenses/>.


" Create help menu.
ANoremenu &Help.&Plugins 'Surround: Quoting/parenthesizing made simple' ''
						\ :help surround<CR> 

" Change Surroundings
NVIOMenu &Edit.Surrounding&s.&Delete "Delete single quotes" "ds'"
						\ ds'
NVIOMenu &Edit.Surrounding&s.&Delete 'Delete double quotes' 'ds"'
						\ ds"
NVIOMenu &Edit.Surrounding&s.&Delete 'Delete parenthesis' 'ds)'
						\ ds)
NVIOMenu &Edit.Surrounding&s.&Delete 'Delete angle brackets' 'ds>'
						\ ds>
NVIOMenu &Edit.Surrounding&s.&Delete 'Delete square brackets' 'ds]'
						\ ds]
NVIOMenu &Edit.Surrounding&s.&Delete 'Delete curly brackets' 'ds}'
						\ ds}
NVIOMenu &Edit.Surrounding&s.&Change.Single\ &Quotes 'Change single quotes to double quotes' "cs'\""
						\ cs'"
NVIOMenu &Edit.Surrounding&s.&Change.&Double\ Quotes 'Change double quotes to single quotes' "cs\"'"
						\ cs"'
NVIOMenu &Edit.Surrounding&s.&Change.&Angle\ Brackets 'Change angle brackets to square brackets' 'cs>]'
						\ cs>]
NVIOMenu &Edit.Surrounding&s.&Change.&Angle\ Brackets 'Change angle brackets to curly brackets' 'cs>}'
						\ cs>}
NVIOMenu &Edit.Surrounding&s.&Change.&Square\ Brackets 'Change square brackets to angle brackets' 'cs]>'
						\ cs]>
NVIOMenu &Edit.Surrounding&s.&Change.&Square\ Brackets 'Change square brackets to curly brackets' 'cs]}'
						\ cs]}
NVIOMenu &Edit.Surrounding&s.&Change.&Curly\ Brackets 'Change curly brackets to angle brackets' 'cs}>'
						\ cs}>
NVIOMenu &Edit.Surrounding&s.&Change.&Curly\ Brackets 'Change curly brackets to square brackets' 'cs}]'
						\ cs}]
VMenu &Edit.Surrounding&s.&Enclose 'Enclose selection in single quotes' "S'"
						\ S'
VMenu &Edit.Surrounding&s.&Enclose 'Enclose selection in double quotes' 'S"'
						\ S"
VMenu &Edit.Surrounding&s.&Enclose 'Enclose selection in parenthesis' 'S)'
						\ S)
VMenu &Edit.Surrounding&s.&Enclose 'Enclose selection in angle brackets' 'S>'
						\ S>
VMenu &Edit.Surrounding&s.&Enclose 'Enclose selection in square brackets' 'S)'
						\ S)
VMenu &Edit.Surrounding&s.&Enclose 'Enclose selection in curly brackets' 'S}'
						\ S}


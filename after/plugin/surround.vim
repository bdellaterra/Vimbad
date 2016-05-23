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
call conviction#CreateMenuItem('&Edit.Surrounding&s.&Delete', "ds'", "Delete single quotes", '', "ds'", 'nimenu')
call conviction#CreateMenuItem('&Edit.Surrounding&s.&Delete', 'ds"', "Delete double quotes", '', 'ds\"', 'nimenu')
call conviction#CreateMenuItem('&Edit.Surrounding&s.&Delete', 'ds)', "Delete parenthesis", '', 'ds)', 'nimenu')
call conviction#CreateMenuItem('&Edit.Surrounding&s.&Delete', 'ds>', "Delete angle brackets", '', 'ds>', 'nimenu')
call conviction#CreateMenuItem('&Edit.Surrounding&s.&Delete', 'ds]', "Delete square brackets", '', 'ds]', 'nimenu')
call conviction#CreateMenuItem('&Edit.Surrounding&s.&Delete', 'ds}', "Delete curly brackets", '', 'ds}', 'nimenu')
call conviction#CreateMenuItem('&Edit.Surrounding&s.&Change.Single &Quotes', "cs'\"", 'Change single quotes to double quotes', '', "cs'\"", 'nmenu')
call conviction#CreateMenuItem('&Edit.Surrounding&s.&Change.&Double Quotes', "cs\"'", 'Change double quotes to single quotes', '', "cs\"'", 'nmenu')
call conviction#CreateMenuItem('&Edit.Surrounding&s.&Change.&Angle Brackets', 'cs>]', 'Change angle brackets to square brackets', '', 'cs>]', 'nmenu')
call conviction#CreateMenuItem('&Edit.Surrounding&s.&Change.&Angle Brackets', 'cs>}', 'Change angle brackets to curly brackets', '', 'cs>}', 'nmenu')
call conviction#CreateMenuItem('&Edit.Surrounding&s.&Change.&Square Brackets', 'cs]>', 'Change square brackets to angle brackets', '', 'cs]>', 'nmenu')
call conviction#CreateMenuItem('&Edit.Surrounding&s.&Change.&Square Brackets', 'cs]}', 'Change square brackets to curly brackets', '', 'cs]}', 'nmenu')
call conviction#CreateMenuItem('&Edit.Surrounding&s.&Change.&Curly Brackets', 'cs}>', 'Change curly brackets to angle brackets', '', 'cs}>', 'nmenu')
call conviction#CreateMenuItem('&Edit.Surrounding&s.&Change.&Curly Brackets', 'cs}]', 'Change curly brackets to square brackets', '', 'cs}]', 'nmenu')
call conviction#CreateMenuItem('&Edit.Surrounding&s.&Enclose', "S'", 'Enclose selection in single quotes', '', "S'", 'vmenu')
call conviction#CreateMenuItem('&Edit.Surrounding&s.&Enclose', 'S"', 'Enclose selection in double quotes', '', 'S"', 'vmenu')
call conviction#CreateMenuItem('&Edit.Surrounding&s.&Enclose', 'S)', 'Enclose selection in parenthesis', '', 'S)', 'vmenu')
call conviction#CreateMenuItem('&Edit.Surrounding&s.&Enclose', 'S>', 'Enclose selection in angle brackets', '', 'S>', 'vmenu')
call conviction#CreateMenuItem('&Edit.Surrounding&s.&Enclose', 'S)', 'Enclose selection in square brackets', '', 'S]', 'vmenu')
call conviction#CreateMenuItem('&Edit.Surrounding&s.&Enclose', 'S}', 'Enclose selection in curly brackets', '', 'S}', 'vmenu')


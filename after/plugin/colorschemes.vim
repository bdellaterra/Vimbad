" File:			after/plugin/colorschemes.vim
" Description:	Brian Dellaterra's Personal Vim Configuration
" Author:		Brian Dellatera <github.com/bdellaterra>
" Version:		0.1.1
" License:      Copyright 2015 Brian Dellaterra. This file is part of Vimbad.
" 				Distributed under the terms of the GNU Lesser General Public License.
"				See the file LICENSE or <http://www.gnu.org/licenses/>.


" (The following borrows from menu.vim in the Vim distribution...)

" Setup the Edit.Color Scheme submenu

" get NL separated string with file names
let s:n = globpath(&runtimepath, "colors/*.vim")

" split at NL, Ignore case for VMS and windows, sort on name
let s:names = sort(map(split(s:n, "\n"), 'substitute(v:val, "\\c.*[/\\\\:\\]]\\([^/\\\\:]*\\)\\.vim", "\\1", "")'), 1)

" define all the submenu entries
let s:idx = 100
for s:name in s:names
  exe "an 20.450." . s:idx . ' &Edit.C&olor\ Scheme.' . s:name . " :colors " . s:name . "<CR>"
  let s:idx = s:idx + 10
endfor
unlet s:name s:names s:n s:idx


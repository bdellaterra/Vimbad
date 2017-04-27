" File:			after/plugin/colorschemes.vim
" Description:	Brian Dellaterra's Personal Vim Configuration
" Author:		Brian Dellatera <github.com/bdellaterra>
" Version:		0.1.1
" License:      Copyright 2015-2017 Brian Dellaterra. This file is part of Vimbad.
" 				Distributed under the terms of the GNU Lesser General Public License.
"				See the file LICENSE or <http://www.gnu.org/licenses/>.


" <Leader>ts: Toggle Syntax Highlighting
NVIONoremenumap &Edit.Color\ Scheme.&Syntax\ Highlighting '&Toggle' '<Leader>ts'
	  \ :exe exists("g:syntax_on")?'syn off':'syn enable'<CR>

" <Leader>es: Enable Syntax Highlighting
NVIONoremenumap &Edit.Color\ Scheme.&Syntax\ Highlighting '&Enable' '<Leader>es'
         \ :syntax enable<CR>

" <Leader>ds: Disable Syntax Highlighting
NVIONoremenumap &Edit.Color\ Scheme.&Syntax\ Highlighting '&Disable' '<Leader>ds'
         \ :syntax off<CR>

" Enhance menu options relating to colorschemes
" (The following borrows from menu.vim in the Vim distribution...)
if has('gui_running')

  " Setup the Edit.Color Scheme submenu
  let s:original_colorschemes = globpath(expand('$VIMRUNTIME'), "colors/*.vim")
  let s:original_names = sort(map(split(s:original_colorschemes, "\n"), 'substitute(v:val, "\\c.*[/\\\\:\\]]\\([^/\\\\:]*\\)\\.vim", "\\1", "")'), 1)
  for s:orig in s:original_names
    exe 'aunmenu Edit.Color\ Scheme.' . s:orig
  endfor

  " get NL separated string with file names
  let s:n = globpath(&runtimepath, "colors/*.vim")

  " split at NL, Ignore case for VMS and windows, sort on name
  let s:names = sort(map(split(s:n, "\n"), 'substitute(v:val, "\\c.*[/\\\\:\\]]\\([^/\\\\:]*\\)\\.vim", "\\1", "")'), 1)

  " define all the submenu entries
  let s:idx = 1000
  for s:name in s:names
    exe "anoremenu 20.450." . s:idx . ' &Edit.C&olor\ Scheme.' . s:name . " :colors " . s:name . "<CR>"
    let s:idx = s:idx + 10
  endfor
  unlet s:name s:names s:n s:idx

endif

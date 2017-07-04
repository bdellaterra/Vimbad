" File:         after/plugin/searchant.vim
" Description:  Brian Dellaterra's Personal Vim Configuration
" Author:       Brian Dellaterra <github.com/bdellaterra>
" Version:      0.1.1
" License:      Copyright 2017 Brian Dellaterra. This file is part of Vimbad.
"               Distributed under the terms of the GNU Lesser General Public License. See the file LICENSE or <http://www.gnu.org/licenses/>.


" Highlight search result under cursor
function! s:CurrentSearchHighlight()
  if &background == 'light'
    highlight SearchCurrent ctermbg=black ctermfg=white guibg=black guifg=white
  else
    highlight SearchCurrent ctermbg=white ctermfg=black guibg=white guifg=black
  endif
endfunction

autocmd ColorScheme * call <SID>CurrentSearchHighlight()

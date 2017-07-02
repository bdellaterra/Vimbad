" File:         after/plugin/man.vim
" Description:  Brian Dellaterra's Personal Vim Configuration
" Author:       Brian Dellaterra <github.com/bdellaterra>
" Version:      0.1.1
" License:      Copyright 2017 Brian Dellaterra. This file is part of Vimbad.
"               Distributed under the terms of the GNU Lesser General Public License. See the file LICENSE or <http://www.gnu.org/licenses/>.


" <Leader>mn: View manpage for word under cursor
NVIONoremenumap 411 &Edit 'View &Manpage of Word under Cursor' '<Leader>mn'
                        \ :Man <cword><CR>


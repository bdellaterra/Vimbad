" File:         after/plugin/wildmenu.vim
" Description:  Brian Dellaterra's Personal Vim Configuration
" Author:       Brian Dellaterra <github.com/bdellaterra>
" Version:      0.1.1
" License:      Copyright 2017 Brian Dellaterra. This file is part of Vimbad.
"               Distributed under the terms of the GNU Lesser General Public License. See the file LICENSE or <http://www.gnu.org/licenses/>.


" <Leader>wm: Open WildMenu
NVIONoremenumap 100 &File 'Console Menu (a\.k\.a\. "&WildMenu")' '<Leader>wm'
         \ :emenu <C-r>=feedkeys("\<Tab>", 'nt') ? '' : ''<CR>

" <F1>: Show help for menu item
cnoremap <expr> <F1> wildmenumode() ? "\<Home>" . repeat("\<Delete>", match(getcmdline(),'menu')) . "\<CR>" : ""



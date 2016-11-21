" File:         after/plugin/vim-colorscheme-switcher.vim
" Description:  Brian Dellaterra's Personal Vim Configuration
" Author:       Brian Dellaterra <github.com/bdellaterra>
" Version:      0.1.1
" License:      Copyright 2015 Brian Dellaterra. This file is part of Vimbad.
"               Distributed under the terms of the GNU Lesser General Public License. See the file LICENSE or <http://www.gnu.org/licenses/>.


" <Leader>nc: Next Colorscheme
NVIONoremenumap 10 &Edit.Color\ Scheme '&Next' '<Leader>nc'
         \ :silent! NextColorScheme<CR>

" <Leader>bc: Previous Colorscheme
NVIONoremenumap 10 &Edit.Color\ Scheme '&Back' '<Leader>bc'
         \ :silent! PrevColorScheme<CR>

" <Leader>rc: Random Colorscheme
NVIONoremenumap 10 &Edit.Color\ Scheme '&Random' '<Leader>rc'
         \ :silent! RandomColorScheme<CR>



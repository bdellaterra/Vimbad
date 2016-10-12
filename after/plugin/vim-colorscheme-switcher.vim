" File:         after/plugin/vim-colorscheme-switcher.vim
" Description:  Brian Dellaterra's Personal Vim Configuration
" Author:       Brian Dellaterra <github.com/bdellaterra>
" Version:      0.1.1
" License:      Copyright 2015 Brian Dellaterra. This file is part of Vimbad.
"               Distributed under the terms of the GNU Lesser General Public License. See the file LICENSE or <http://www.gnu.org/licenses/>.


" <Leader>csn: Next Colorscheme
NVIONoremenumap 10 &Edit.Color\ Scheme '&Next' '<Leader>csn'
         \ :silent! NextColorScheme<CR>

" <Leader>csp: Previous Colorscheme
NVIONoremenumap 10 &Edit.Color\ Scheme '&Previous' '<Leader>csp'
         \ :silent! PrevColorScheme<CR>

" <Leader>csr: Random Colorscheme
NVIONoremenumap 10 &Edit.Color\ Scheme '&Random' '<Leader>csr'
         \ :silent! RandomColorScheme<CR>


" File:         after/plugin/ale.vim
" Description:  Brian Dellaterra's Personal Vim Configuration
" Author:       Brian Dellaterra <github.com/bdellaterra>
" Version:      0.1.1
" License:      Copyright 2015 Brian Dellaterra. This file is part of Vimbad.
"               Distributed under the terms of the GNU Lesser General Public License. See the file LICENSE or <http://www.gnu.org/licenses/>.

" Create help menu.
ANoremenu &Help.&Plugins 'ALE: Asynchronous Lint Engine' ''
						\ :help ale<CR> 

" Map movement through errors without wrapping.
nmap <silent> <Leader>l <Plug>(ale_next_wrap)
nmap <silent> <Leader>L <Plug>(ale_previous_wrap)

" <Leader>l = Next lint warning/error
NVNoremenumap 510 &Extra 'Next &Linter Error' '<Leader>l'
      \ :ALENextWrap<CR>
"
" <Leader>L = Previous lint warning/error
NVNoremenumap 510 &Extra 'Previous &Linter Error' '<Leader>L'
      \ :ALEPreviousWrap<CR>


" File:         after/plugin/ale.vim
" Description:  Brian Dellaterra's Personal Vim Configuration
" Author:       Brian Dellaterra <github.com/bdellaterra>
" Version:      0.1.1
" License:      Copyright 2015 Brian Dellaterra. This file is part of Vimbad.
"               Distributed under the terms of the GNU Lesser General Public License. See the file LICENSE or <http://www.gnu.org/licenses/>.

" Create help menu.
ANoremenu &Help.&Plugins 'ALE: Asynchronous Lint Engine' ''
						\ :help ale<CR> 

" <leader>l = Next lint warning/error
Noremenumap 402 &Tools 'Next &Linter Error' mapleader . 'l'
      \ <Plug>(ale_next_wrap)
" <leader>L = Previous lint warning/error
Noremenumap 402 &Tools 'Previous &Linter Error' mapleader . 'L'
      \ <Plug>(ale_previous_wrap)


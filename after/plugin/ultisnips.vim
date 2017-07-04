" File:         after/plugin/ultisnips.vim
" Description:  Brian Dellaterra's Personal Vim Configuration
" Author:       Brian Dellaterra <github.com/bdellaterra>
" Version:      0.1.1
" License:      Copyright 2015-2017 Brian Dellaterra. This file is part of Vimbad.
"               Distributed under the terms of the GNU Lesser General Public License. See the file LICENSE or <http://www.gnu.org/licenses/>.


" Create help menu.
ANoremenu &Help.&Plugins 'UltiSnips: The ultimate snippet solution for Vim' ''
         \ :help ultisnips<CR>

" If snippet fails to expand, try first candidate from completion menu.
" When you just want the first candidate this saves keystrokes of selecting it.
let g:ulti_expand_res = 0
function! s:Expand()
    call UltiSnips#ExpandSnippet()
    return g:ulti_expand_res
endfunction
function! s:NextCandidate()
    return "\<C-n>"
endfunction
" Closing/Opening popup menu ensures consistent behavior whether popup menu
" was open or not. Checking g:ulti_expand_res to avoid double expansion.
exe "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-r>=<SID>Expand()?'':neocomplete#close_popup().neocomplete#start_manual_complete().<SID>NextCandidate().neocomplete#close_popup()\<CR><C-r>=g:ulti_expand_res?'':UltiSnips#ExpandSnippet()\<CR>"


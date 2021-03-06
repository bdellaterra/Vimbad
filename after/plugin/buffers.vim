" File:         after/plugin/buffers.vim
" Description:  Brian Dellaterra's Personal Vim Configuration
" Author:       Brian Dellaterra <github.com/bdellaterra>
" Version:      0.1.1
" License:      Copyright 2015-2017 Brian Dellaterra. This file is part of Vimbad.
"
"               Distributed under the terms of the GNU Lesser General Public License. See the file LICENSE or <http://www.gnu.org/licenses/>.


" Helper function to control behavior of the equals key:
function! s:EditBufferOrReindent(...)
    let bufNum = get(a:000, 0, '')
    if bufNum == ''
        return "="
    elseif bufNum == 0
        return ":\<C-u>confirm buffer #\<CR>"
    else
        return ":\<C-u>confirm buffer" . bufNum . "\<CR>"
    endif
    return ""
endfunction

" If used after a numeric count the equals key switches to that number buffer.
" Number zero signifies the althernate buffer. (See :help alternate-file)
" Otherwise the default re-indent behavior is used.
noremap <expr>=  <SID>EditBufferOrReindent(v:count)
noremap 0=  :<C-u>confirm buffer #<CR>  " Vim won't pass zero-counts to mappings

" (The following borrows from menu.vim in the Vim distribution...)

" When just starting Vim, schedule buffer menu setup to occur later
if has("vim_starting")
  augroup UserLoadBufferMenu
    au! VimEnter * call <SID>SetBufferMenu()
    au  VimEnter * au! UserLoadBufferMenu
  augroup END
else
  call <SID>SetBufferMenu()
endif


" TODO: Make these non-global. SaveSession should trigger via autocmd.
"
" Next Buffer helper function
function BN( ... )
  let c = get(a:000, 0, '')
  exe "confirm bnext " . (c > 0 ? c : '')
  SaveSession
endfunction
" Previous Buffer helper function
function BP( ... )
  let c = get(a:000, 0, '')
  exe "confirm bprev " . (c > 0 ? c : '')
  SaveSession
endfunction

" Mappings <C-w>: Delete Buffer, <Leader><C-w>: Force-delete Buffer
NVMap <C-w><C-w> :<C-u>confirm bdelete<CR>
NVMap <Leader><C-w><C-w> :<C-u>bdelete!<CR>

" Mappings gb: Next Buffer, gB: Previous Buffer
NVMap gb :<C-u>call BN(v:count)<CR>
NVMap <Tab> gb
NVMap gB :<C-u>call BP(v:count)<CR>
NVMap <S-Tab> gB

" Function to delay buffer menu changes until Vim is done with initial setup
" (Some mappings defined above)
function s:SetBufferMenu()
  " Add menus in gui only. (After Vim populates buffer menu)
  if has('gui_running')
    " <C-w><C-w>: Delete Buffer
    aunmenu Buffers.Delete
    Noremenu 4 &Buffers '&Delete' '<C-w><C-w>'
             \ :<C-u>confirm bdelete<CR>
    " <Leader><C-w><C-w>: Force-delete Buffer
    Noremenu 4 &Buffers '&Force-delete' '<Leader><C-w><C-w>'
             \ :<C-u>bdelete!<CR>
    " <Ctrl-^>: Alternate Buffer
    aunmenu Buffers.Alternate
    Noremenu 5 &Buffers '&Alternate' '0=\ or\ Ctrl-^'
             \ :<C-u>confirm buffer #<CR>
    " gb: Next Buffer
    aunmenu Buffers.Next
    NVNoremenu 1 &Buffers '&Next' '\<Tab>\ or\ gb'
             \ :<C-u>call BN(v:count)<CR>
    " gB: Previous Buffer
    aunmenu Buffers.Previous
    NVNoremenu 1 &Buffers '&Previous' '<S-Tab>\ or\ gB'
             \ :<C-u>call BP(v:count)<CR>
    " <count>=: Select Buffer
    Noremenu 8 &Buffers '&Select' '<count>=\ or\ <count>Ctrl-^' =
  endif
endfunction



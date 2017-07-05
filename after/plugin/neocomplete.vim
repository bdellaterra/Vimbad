" File:			after/plugin/neocomplete.vim
" Description:	Brian Dellaterra's Personal Vim Configuration
" Author:		Brian Dellatera <github.com/bdellaterra>
" Version:		0.1.1
" License:      Copyright 2015-2017 Brian Dellaterra. This file is part of Vimbad.
" 				Distributed under the terms of the GNU Lesser General Public License.
"				See the file LICENSE or <http://www.gnu.org/licenses/>.


" Create help menu.
ANoremenu &Help.&Plugins 'NeoComplete: Next generation completion framework' ''
						\ :help neocomplete<CR> 

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" <Esc>: Abort selection and close menu
inoremap <silent> <Esc> <C-r>=<SID>EscOrConfirm()<CR>
function! s:EscOrConfirm()
	return pumvisible() ? neocomplete#close_popup() . "\<Esc>" : "\<Esc>"
endfunction

" <CR> Inserts a line-break normally

" <C-h> or <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#close_popup()."\<C-h>"

" NOTE: See plugin/ultisnips.vim for related forward/back jump configurations

" Initialize UltiSnips globals to false
let g:ulti_jump_forwards_res = 0
let g:ulti_jump_backwards_res = 0

" Helper functions to attempt jump and return status
function! JumpForwards()
    call UltiSnips#JumpForwards()
    return g:ulti_jump_forwards_res
endfunction
function! JumpBackwards()
    call UltiSnips#JumpBackwards()
    return g:ulti_jump_backwards_res
endfunction

" Helper functions to control tab/shift-tab behavior:
function! s:JumpTabOrComplete()
    if pumvisible() == 1
	return "\<C-n>"
    else
	if col('.') == 1 || search('^\%(\s\|\t\)*\%#','cn')
	    return "\<Tab>"
	else
	    return "\<C-r>=(JumpForwards() > 0)?'':neocomplete#start_manual_complete()\<CR>"
	endif
    endif
endfunction
function! s:JumpBackSTabOrComplete()
    if pumvisible() == 1
	return "\<C-p>"
    else
	if col('.') == 1 || search('^\%(\s\|\t\)*\%#','cn')
	    return "\<Tab>"
	else
	    return "\<C-r>=(JumpBackwards() > 0)?'':neocomplete#start_manual_complete()\<CR>"
	endif
    endif
endfunction

" <Tab>: Navigate forward through list, jump to next snippet location,
"        initate completion, or insert tab(s) at start-of-line.
inoremap <expr><Tab> <SID>JumpTabOrComplete()
" snoremap <Tab> <Esc>:call UltiSnips#JumpForwards()<CR>
snoremap <Tab> <C-r>=(JumpForwards() > 0)?'':"\<Tab>"

" <S-Tab>: Navigate backward through list, jump to previous snippet location,
"          or insert tab(s) at start-of-line.
inoremap <expr><S-Tab> <SID>JumpBackSTabOrComplete()
" snoremap <S-Tab> <Esc>:call UltiSnips#JumpBackwards()<CR>
snoremap <S-Tab> <C-r>=(JumpBackwards() > 0)?'':"\<S-Tab>"

" <Up> <Down> <Left> and <Right>: Same as normal except prevent
" completions from happening as a result of cursor movement.
inoremap <expr><Up>   pumvisible()
						\ ? neocomplete#close_popup() . "\<Up>"
						\ : "\<Up>" . neocomplete#close_popup()
inoremap <expr><Down>   pumvisible()
						\ ? neocomplete#close_popup() . "\<Down>"
						\ : "\<Down>" . neocomplete#close_popup()
inoremap <expr><Right>   pumvisible()
						\ ? neocomplete#close_popup() . "\<Right>"
						\ : "\<Right>" . neocomplete#close_popup()
inoremap <expr><Left>   pumvisible()
						\ ? neocomplete#close_popup() . "\<Left>"
						\ : "\<Left>" . neocomplete#close_popup()



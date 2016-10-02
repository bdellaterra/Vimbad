" File:			after/plugin/neocomplete.vim
" Description:	Brian Dellaterra's Personal Vim Configuration
" Author:		Brian Dellatera <github.com/bdellaterra>
" Version:		0.1.1
" License:      Copyright 2015 Brian Dellaterra. This file is part of Vimbad.
" 				Distributed under the terms of the GNU Lesser General Public License.
"				See the file LICENSE or <http://www.gnu.org/licenses/>.


" Create help menu.
ANoremenu &Help.&Plugins 'NeoComplete: Next generation completion framework' ''
						\ :help neocomplete<CR> 

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" <Esc>: Confirm selection and close menu
inoremap <silent> <Esc> <C-r>=<SID>EscOrConfirm()<CR>
function! s:EscOrConfirm()
	return pumvisible() ? neocomplete#close_popup() : "\<Esc>"
endfunction

" <CR> Inserts a line-break normally

" <C-h> or <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#close_popup()."\<C-h>"

" NOTE: See plugin/ultisnips.vim for related forward/back jump configurations

" Helper function to control tab behavior:
" completion - optional boolean, enables completion if true (default)
function! s:JumpTabOrComplete(...)
	let completion = get(a:000, 0, 1)
	call UltiSnips#JumpForwards()
	if g:ulti_jump_forwards_res == 0
		if pumvisible() == 1
			return "\<C-n>"
		else
			if col('.')==1 || search('^\t*\%#','cn') || !completion
				return "\<Tab>"
			else
				return neocomplete#start_manual_complete()
			endif
		endif
	endif
	return ""
endfunction

" Helper function to control shift-tab behavior:
function! s:JumpBackSTabOrComplete()
	call UltiSnips#JumpBackwards()
	if g:ulti_jump_backwards_res == 0
		if pumvisible() == 1
			return "\<C-p>"
		else
			return "\<S-Tab>"
		endif
	endif
	return ""
endfunction

" <Tab>: Navigate forward through list, jump to next snippet location,
"        initate completion, or insert tab(s) at start-of-line.
inoremap <expr><Tab>  <SID>JumpTabOrComplete()
snoremap <Tab> <Esc>:call <SID>JumpTabOrComplete(0)<CR>

" <S-Tab>: Navigate backward through list, jump to previous snippet location,
"          or insert tab(s) at start-of-line.
inoremap <expr><S-Tab>  <SID>JumpBackSTabOrComplete()
snoremap <S-Tab>  <Esc>:call <SID>JumpBackSTabOrComplete()<CR>

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


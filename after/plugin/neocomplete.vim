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

" <Esc>: Escape from completion menu.
inoremap <expr><Esc>     pumvisible() ? neocomplete#smart_close_popup() . "\<Esc>" : "\<Esc>"

" <CR>: Close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>CRLinebreakOrConfirm()<CR>
function! s:CRLinebreakOrConfirm()
	return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

" <C-h> or <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#close_popup()."\<C-h>"

" Helper function to control tab behavior:
function! s:TabIndentOrComplete()
	if col('.')==1 || search('^\t*\%#','cn')
		return "\<Tab>"
	else
		return neocomplete#start_manual_complete()
	endif
endfunction

" <Tab>: Navigate forward through list, initate completion, or insert tab at start-of-line.
inoremap <expr><Tab>  pumvisible() ? "\<C-n>" : <SID>TabIndentOrComplete()

" <S-Tab>: Navigate backward through list.
inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<S-Tab>"

" <Up> <Down> <Left> <Right>: Same as normal except prevent
" completions from happening as a result of cursor movement.
inoremap <expr><Up>   pumvisible()
						\ ? neocomplete#close_popup() . "\<Up>"
						\ : "\<Up>" . neocomplete#close_popup()
inoremap <expr><Down>   pumvisible()
						\ ? neocomplete#close_popup() . "\<Down>"
						\ : "\<Down>" . neocomplete#close_popup()
inoremap <expr><Left>   pumvisible()
						\ ? neocomplete#close_popup() . "\<Left>"
						\ : "\<Left>" . neocomplete#close_popup()
inoremap <expr><Right>   pumvisible()
						\ ? neocomplete#close_popup() . "\<Right>"
						\ : "\<Right>" . neocomplete#close_popup()

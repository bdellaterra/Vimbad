" File:			plugin/neocomplete.vim
" Description:	Brian Dellaterra's Personal Vim Configuration
" Author:		Brian Dellatera <github.com/bdellaterra>
" Version:		0.1.1
" License:      Copyright 2015 Brian Dellaterra. This file is part of Vimbad.
" 				Distributed under the terms of the GNU Lesser General Public License.
"				See the file LICENSE or <http://www.gnu.org/licenses/>.

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Enable NeoComplete
let g:neocomplete#enable_at_startup = 1

" Use smartcase.
let g:neocomplete#enable_smart_case = 1

" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
	\ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

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

" <Up> and <Down>: Navigate forward/backward through list.
" if completion-menu is open. Otherwise, move cursor down but close the
" completion-menu if it is triggered by the new cursor location.
" (This prevents a shift of context where arrow-based buffer movement might
" suddenly switch into menu selection movement.)
inoremap <expr><Up>  pumvisible() ? "\<C-p>" : "\<Up>" . neocomplete#close_popup()
inoremap <expr><Down>  pumvisible() ? "\<C-n>" : "\<Down>" . neocomplete#close_popup()

" <Left> and <Right>: Same as normal except prevent
" completion menu from showing as a result of cursor movement.
inoremap <expr><Left>   pumvisible()
						\ ? neocomplete#close_popup() . "\<Left>"
						\ : "\<Left>" . neocomplete#close_popup()
inoremap <expr><Right>   pumvisible()
						\ ? neocomplete#close_popup() . "\<Right>"
						\ : "\<Right>" . neocomplete#close_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" NOTE: Heavy omni completion is enabled for various file types in files named
" 'neocomplete.vim' under the 'ftplugin' directory.


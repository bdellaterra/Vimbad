" File:		plugin/neocomplete.vim
" Description:	Brian Dellaterra's Personal Vim Configuration
" Author:	Brian Dellatera <github.com/bdellaterra>
" Version:	0.1.1
" License:      Copyright 2015 Brian Dellaterra. This file is part of Vimbad.
" 		Distributed under the terms of the GNU Lesser General Public License.
"		See the file LICENSE or <http://www.gnu.org/licenses/>.


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

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" NOTE: Heavy omni completion is enabled for various file types in files named
" 'neocomplete.vim' under the 'ftplugin' directory.


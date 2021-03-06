" File:		after/plugin/user.vim
" Description:	Brian Dellaterra's Personal Vim Configuration
" Author:	Brian Dellatera <github.com/bdellaterra>
" Version:	0.1.1
" License:      Copyright 2015-2017 Brian Dellaterra. This file is part of Vimbad.
" 		Distributed under the terms of the GNU Lesser General Public License.
"		See the file LICENSE or <http://www.gnu.org/licenses/>.

" Set the colorscheme
" colorscheme greyman

" Set the font
" set guifont=Liberation\ Mono\ 14
" set guifont=InconsolataForPowerline\ Nerd\ Font\ 16
set encoding=utf8

" Faster updates
set updatetime=1000

" Share system clipboard with unnamed register for copy/paste
set clipboard=unnamed,unnamedplus

" Attempt to auto-add missing extension when navigating to files 
set suffixesadd=.js,.jsx,.json,.html,.css,.h,.hpp,.hxx

" Enable Vim as manpage viewer
runtime! ftplugin/man.vim


" USER MAPPINGS

" <Leader>n: Jump to next occurance of selection
VNoremenumap 421 &Edit 'Jump to &Next Occurance of Selection' '<Leader>n'
    \ y/\V<C-R>=substitute(escape(@", '\'), '\_s', '\\_s\\+', 'g')<CR><CR>

" <Leader>N: Jump to previous occurance of selection
VNoremenumap 421 &Edit 'Jump to &Previous Occurance of Selection' '<Leader>N'
    \ y?\V<C-R>=substitute(escape(@", '\'), '\_s', '\\_s\\+', 'g')<CR><CR>

" <Leader>th: Rebuild help tags
NVIONoremenumap 10 &Help 'Rebuild Help &tag index' '<Leader>th'
						\ :Helptags<CR> 

" call g:winslow#MapEasyModeSwitch()   " Enable persistent easy mode switch
" Easy mode toggle
exe "ANoremenu 10 &Help 'Toggle &Easy Mode' '"
		\ . (exists('g:winslow#easyModeSwitch') ? g:winslow#easyModeSwitch : '')
		\ . "' :silent! call winslow#ToggleEasyMode()<CR>"

" <Leader>wd: Copy working directory to the clipboard
NVIONoremenumap <silent> &Extra 'Copy working &directory to clipboard' '<Leader>wd'
						\ :silent! let @+=fnamemodify(bufname(''),':p:h')<CR>

" <Leader>wf: Copy working file to the clipboard
NVIONoremenumap <silent> &Extra 'Copy working &file to clipboard' '<Leader>wf'
						\ :silent! let @+=fnamemodify(bufname(''),':p')<CR>

" <Leader>wp: Copy relative directory to the clipboard
NVIONoremenumap <silent> &Extra 'Copy relative &directory to clipboard' '<Leader>wp'
						\ :silent! let @+=fnamemodify(bufname(''),':h')<CR>

" <Leader>wr: Copy relative file to the clipboard
NVIONoremenumap <silent> &Extra 'Copy relative &file to clipboard' '<Leader>wr'
						\ :silent! let @+=bufname('')<CR>

" <Leader>ht: Toggle search pattern highlighting
NVIONoremenumap &Extra 'Toggle Highlighting of Search Patterns' '<Leader>th'
						\ :set hlsearch!<CR> 

" <Leader>rf: Refresh the screen
NVIONoremenumap <silent> &Extra 'Refresh Screen' '<Leader>rf'
						\ :windo filetype detect \| call RefreshColorscheme()<CR>

" Make VimProc dll file
NVIONoremenu &Extra 'Make &VimProc dll file' ''
						\ :VimProcInstall<CR> 



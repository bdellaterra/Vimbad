" File:			plugin/unite.vim
" Description:	Brian Dellaterra's Personal Vim Configuration
" Author:		Brian Dellatera <github.com/bdellaterra>
" Version:		0.1.1
" License:      Copyright 2015-2016 Brian Dellaterra. This file is part of Vimbad.
" 				Distributed under the terms of the GNU Lesser General Public License.
"				See the file LICENSE or <http://www.gnu.org/licenses/>.


" Use fuzzy matching on file/buffer targets
call unite#custom#source('file,file/new,buffer,file_rec',
            \ 'matchers', 'matcher_fuzzy')

" Pressing down from insert-mode seems to skip first line
" unless this is disabled
let g:unite_enable_auto_select=0

" Speedup
if executable('ag')
   let g:unite_source_rec_async_command =
            \ ['ag', '--nocolor', '--nogroup',
            \  '--depth', '10', '-g', '']
   " ag is quite fast, so we increase this number
   let g:unite_source_rec_min_cache_files = 1200
endif


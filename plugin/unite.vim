" File:			plugin/unite.vim
" Description:	Brian Dellaterra's Personal Vim Configuration
" Author:		Brian Dellatera <github.com/bdellaterra>
" Version:		0.1.1
" License:      Copyright 2015-2017 Brian Dellaterra. This file is part of Vimbad.
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
   " Use ag (the silver searcher)
   " https://github.com/ggreer/the_silver_searcher
   let g:unite_source_rec_async_command = 'ag --nocolor --nogroup --hidden -g ""'
   let g:unite_source_grep_command = 'ag'
   let g:unite_source_grep_default_opts =
            \ '-i --vimgrep --hidden --ignore ' .
            \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
   let g:unite_source_grep_recursive_opt = ''
   if has('Windows')
      let g:unite_source_rec_async_command =
               \ ['ag', '--nocolor', '--nogroup',
               \  '--depth', '10', '-g', '']
      " ag is quite fast, so we increase this number
      let g:unite_source_rec_min_cache_files = 1200
   endif
elseif executable('pt')
   " Use pt (the platinum searcher)
   " https://github.com/monochromegane/the_platinum_searcher
   let g:unite_source_grep_command = 'pt'
   let g:unite_source_grep_default_opts = '--nogroup --nocolor'
   let g:unite_source_grep_recursive_opt = ''
elseif executable('ack-grep')
   " Use ack
   " http://beyondgrep.com/
   let g:unite_source_grep_command = 'ack-grep'
   let g:unite_source_grep_default_opts =
            \ '-i --no-heading --no-color -k -H'
   let g:unite_source_grep_recursive_opt = ''
elseif executable('hw')
   " Use hw (highway)
   " https://github.com/tkengo/highway
   let g:unite_source_grep_command = 'hw'
   let g:unite_source_grep_default_opts = '--no-group --no-color'
   let g:unite_source_grep_recursive_opt = ''
elseif executable('jvgrep')
   " Use jvgrep
   " https://github.com/mattn/jvgrep
   let g:unite_source_grep_command = 'jvgrep'
   let g:unite_source_grep_default_opts =
            \ '-i --exclude ''\.(git|svn|hg|bzr)'''
   let g:unite_source_grep_recursive_opt = '-R'
endif


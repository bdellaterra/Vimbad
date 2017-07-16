" File:         after/plugin/unite.vim
" Description:  Brian Dellaterra's Personal Vim Configuration
" Author:       Brian Dellatera <github.com/bdellaterra>
" Version:      0.1.1
" License:      Copyright 2015-2017 Brian Dellaterra. This file is part of Vimbad.
"               Distributed under the terms of the GNU Lesser General Public License.
"               See the file LICENSE or <http://www.gnu.org/licenses/>.


" Customize buffer listing to show and sort by buffer number
call unite#custom#source('buffer', 'converters', 'converter_buf_tail_num')
let g:unite_source_buffer_time_format = ''


" Create help menu.
ANoremenu &Help.&Plugins 'Unite: Unite and create user interfaces' ''
         \ :help unite<CR> 

" <Leader>ur: Recent Files (via NeoMRU plugin)
NVIONoremenumap 205 &File '&Recent Files' '<Leader>ur'
         \ :Unite -start-insert file_mru<CR>

" <Leader>ud: Recent Directories (via NeoMRU plugin)
NVIONoremenumap 206 &File 'Recent &Directories' '<Leader>ud'
         \ :Unite -start-insert -buffer-name=files -default-action=lcd neomru/directory<CR>

" <Leader>uf: Files In Current Directory
NVIONoremenumap 207 &File 'Files in &Current Directory' '<Leader>uf'
         \ :Unite -start-insert file<CR>

" <Leader>uu: Files Under Current Directory (recursive)
NVIONoremenumap 208 &File 'Files &Under Current Directory' '<Leader>uu'
         \ :Unite -start-insert file_rec/async<CR>

" <Leader>up or <Leader>ff: Files in Current Project
NVIONoremap <Leader>up
         \ :UniteWithProjectDir -start-insert file_rec/async<CR>
NVIOMap <Leader>ff <Leader>up
NVIOMenu 209 &File 'Files in Current &Project' '<Leader>up\ or\ <Leader>ff' '<Leader>up'

" <Leader>ub: Buffers
NVIONoremenumap 210 &File '&Buffers' '<Leader>ub'
         \ :Unite -start-insert buffer<CR>

" <Leader>ut: Tags (via Unite-Tags plugin)
NVIONoremenumap 322 &Tools '&Tags' '<Leader>ut'
         \ :Unite tags<CR>

" <Leader>ui: Include Tags (via NeoInclude plugin)
NVIONoremenumap 324 &Tools '&Include Tags' '<Leader>ui'
         \ :Unite tags/include<CR>

" <Leader>us: Lines Matching Last Search (via Anzu plugin)
NVIONoremenumap 421 &Edit 'Lines Matching Last &Search' '<Leader>us'
         \ :Unite anzu<CR>

" <Leader>uj: Lines in Current Buffer (mnemonic: "j" for "jump to line")
NVIONoremenumap 422 &Edit 'Lines in &Buffer' '<Leader>uj'
         \ :Unite -start-insert line:all<CR>

" <Leader>ug: Lines Under Current Directory (recursive)
NVIONoremenumap 423 &Edit 'Grep &Under Current Directory' '<Leader>ug'
         \ :silent! Unite -start-insert grep:.<CR>

" <Leader>u/ or <Leader>/: Lines in Current Project
NVIONoremap <Leader>u/
         \ :silent! Unite -start-insert grep/git:/<CR>
NVIOMap <Leader>/ <Leader>u/
NVIOMenu 424 &Edit 'Grep in Current &Project' '<Leader>u/\ or\ <Leader>/' '<Leader>u/'

" <Leader>uo: Outline (via Unite-Outline plugin)
NVIONoremenumap 324 &Tools '&Outline' '<Leader>uo'
         \ :Unite outline<CR>

" <Leader>uy: Yank History (via Unite-Yank plugin)
NVIONoremenumap 361 &Edit 'Paste from &Yank History' '<Leader>uy'
         \ :Unite history/yank<CR>

" <Leader>uq: QuickFix List (via Unite-QuickFix plugin)
NVIONoremenumap 362 &Tools '&QuickFix' '<Leader>uq'
         \ :Unite -no-quit -direction=botright quickfix<CR>

" <Leader>ul: Location List (via Unite-QuickFix plugin)
NVIONoremenumap 364 &Tools '&Location List' '<Leader>ul'
         \ :Unite location_list<CR>

" <Leader>uh: Help (via Unite-Help plugin)
NVIONoremenumap 10 &Help '&Search Help' '<Leader>uh'
         \ :Unite help<CR>

" <Leader>ucs: Colorscheme (via Unite-Colorscheme plugin)
NVIONoremenumap 10 &Edit.Color\ Scheme '&Browse All' '<Leader>ucs'
         \ :Unite -no-quit -keep-focus -direction=botright colorscheme<CR>


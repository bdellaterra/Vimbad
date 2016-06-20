" File:         after/plugin/unite.vim
" Description:  Brian Dellaterra's Personal Vim Configuration
" Author:       Brian Dellatera <github.com/bdellaterra>
" Version:      0.1.1
" License:      Copyright 2015 Brian Dellaterra. This file is part of Vimbad.
"               Distributed under the terms of the GNU Lesser General Public License.
"               See the file LICENSE or <http://www.gnu.org/licenses/>.


" Create help menu.
ANoremenu &Help.&Plugins 'Unite: Unite and create user interfaces' ''
         \ :help unite<CR> 

" <Leader>ur: Recent Files (via NeoMRU plugin)
NVIONoremenumap 205 &File '&Recent Files' '<Leader>ur'
         \ :Unite file_mru<CR>

" <Leader>ud: Recent Directories (via NeoMRU plugin)
NVIONoremenumap 206 &File 'Recent &Directories' '<Leader>ud'
         \ :Unite -buffer-name=files -default-action=lcd neomru/directory<CR>

" <Leader>ub: Buffers
NVIONoremenumap 210 &File '&Buffers' '<Leader>ub'
         \ :Unite buffer<CR>

" <Leader>us: Lines Matching Last Search (via Anzu plugin)
NVIONoremenumap 422 &Edit 'Lines Matching Last &Search' '<Leader>us'
         \ :Unite anzu<CR>

" <Leader>ua: All Lines
NVIONoremenumap 423 &Edit 'All &Lines' '<Leader>ul'
         \ :Unite line:all<CR>

" <Leader>uy: Yank History (via Unite-Yank plugin)
NVIONoremenumap 364 &Edit 'Paste from &Yank History' '<Leader>uy'
         \ :Unite history/yank<CR>

" <Leader>ut: Tags (via Unite-Tags plugin)
NVIONoremenumap 322 &Tools '&Tags' '<Leader>ut'
         \ :Unite tags<CR>

" <Leader>ui: Include Tags (via NeoInclude plugin)
NVIONoremenumap 324 &Tools '&Include Tags' '<Leader>ui'
         \ :Unite tags/include<CR>

" <Leader>uo: Outline (via Unite-Outlin plugin)
NVIONoremenumap 324 &Tools '&Outline' '<Leader>uo'
         \ :Unite outline<CR>

" <Leader>uq: QuickFix List (via Unite-QuickFix plugin)
NVIONoremenumap 362 &Tools '&QuickFix' '<Leader>uq'
         \ :Unite -no-quit -direction=botright quickfix<CR>

" <Leader>ul: Location List (via Unite-QuickFix plugin)
NVIONoremenumap 364 &Tools '&Location List' '<Leader>ul'
         \ :Unite location_list<CR>

" <Leader>uh: Help (via Unite-Help plugin)
NVIONoremenumap 10 &Help '&Search Help' '<Leader>uh'
         \ :Unite help<CR>

" <Leader>uc: Colorscheme (via Unite-Colorscheme plugin)
NVIONoremenumap 10 &Edit.Color\ Scheme '&Browse All' '<Leader>uc'
         \ :Unite -no-quit -keep-focus -direction=botright colorscheme<CR>

" Speedup
if executable('ag')
   let g:unite_source_rec_async_command =
            \ ['ag', '--nocolor', '--nogroup',
            \  '--depth', '10', '-g', '']
   " ag is quite fast, so we increase this number
   let g:unite_source_rec_min_cache_files = 1200
endif


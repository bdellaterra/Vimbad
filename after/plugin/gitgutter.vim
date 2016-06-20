" File:         after/plugin/gitgutter.vim
" Description:  Brian Dellaterra's Personal Vim Configuration
" Author:       Brian Dellatera <github.com/bdellaterra>
" Version:      0.1.1
" License:      Copyright 2015 Brian Dellaterra. This file is part of Vimbad.
"               Distributed under the terms of the GNU Lesser General Public License.
"               See the file LICENSE or <http://www.gnu.org/licenses/>.

" Create help menu.
ANoremenu &Help.&Plugins 'GitGutter: A git diff in the gutter' ''
         \ :help gitgutter<CR> 

" GitGutter Menus
NVIONoremenumap &Git.Git&Gutter '&Toggle GitGutter On/Off' '<leader>ggt'
         \ :GitGutterToggle<CR>
NVIONoremenumap &Git.Git&Gutter 'Toggle GitGutter Sign &Column' '<leader>ggc'
         \ :GitGutterSignsToggle<CR>
NVIONoremenumap &Git.Git&Gutter 'Toggle GitGutter Line &Highlights' '<leader>ggh'
         \ :GitGutterLineHighlightsToggle<CR>
NVIONoremenumap &Git.Git&Gutter '&Refresh Status Indicators' '<leader>ggr'
         \ :GitGutterAll<CR>
NVIOMenu &Git.Git&Gutter 'Jump to &Next Hunk of Changes' ']c'
         \ ]c
NVIOMenu &Git.Git&Gutter 'Jump to &Previous Hunk of Changes' '[c'
         \ [c
NVIOMenu &Git.Git&Gutter 'Stage hunk of changes under cursor' '<leader>ggs'
         \ <leader>ghs
NVIOMenu &Git.Git&Gutter 'Undo hunk of changes under cursor' '<leader>ggu'
         \ <leader>ghu
NVIOMenu &Git.Git&Gutter 'Preview hunk of changes under cursor' '<leader>ggp'
         \ <leader>ghp


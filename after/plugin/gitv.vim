" File:         after/plugin/gitv.vim
" Description:  Brian Dellaterra's Personal Vim Configuration
" Author:       Brian Dellatera <github.com/bdellaterra>
" Version:      0.1.1
" License:      Copyright 2015 Brian Dellaterra. This file is part of Vimbad.
"               Distributed under the terms of the GNU Lesser General Public License.
"               See the file LICENSE or <http://www.gnu.org/licenses/>.

" Create help menu.
ANoremenu &Help.&Plugins 'GitV: Enhanced Git Repo Viewer' ''
         \ :help gitv<CR> 

" GitV Menus
NVIONoremenumap &Git.Git&V 'Browse &All File Logs' '<leader>ga'
         \ :Gitv<CR>
NVIONoremenumap &Git.Git&V 'Browse Logs for &This File Only' '<leader>gt'
         \ :Gitv!<CR>

" Use GitV log display as default
NVIOMap <leader>gl <leader>ga


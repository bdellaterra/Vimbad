" File:         after/plugin/fugitive.vim
" Description:  Brian Dellaterra's Personal Vim Configuration
" Author:       Brian Dellatera <github.com/bdellaterra>
" Version:      0.1.1
" License:      Copyright 2015 Brian Dellaterra. This file is part of Vimbad.
"               Distributed under the terms of the GNU Lesser General Public License.
"               See the file LICENSE or <http://www.gnu.org/licenses/>.

" Create help menu.
ANoremenu &Help.&Plugins 'Fugitive: A Git wrapper so awesome, it should be illegal' ''
                        \ :help fugitive<CR> 

" Here is a list of mappings for the Fugitive plugin:
let s:FugitiveMaps = [
                        \ [ ':Git ', '<leader>g' ],
                        \ [ ':Gcd ', '<leader>gd' ],
                        \ [ ':Gread<CR>', '<leader>grd' ],
                        \ [ ':Gwrite!<CR>', '<leader>gw' ],
                        \ [ ':Gstatus<CR>', '<leader>gs' ],
                        \ [ ':Gcommit<CR>', '<leader>gc' ],
                        \ [ ':Ggrep ', '<leader>gf' ],
                        \ [ ':Glog<CR>', '<leader>gl' ],
                        \ [ ':Gedit ', '<leader>ge' ],
                        \ [ ':Gsplit ', '<leader>gsp' ],
                        \ [ ':Gvsplit ', '<leader>gvs' ],
                        \ [ ':Gdiff<CR>', '<leader>gdf' ],
                        \ [ ':Gvdiff<CR>', '<leader>gvd' ],
                        \ [ ':Gsdiff<CR>', '<leader>gsd' ],
                        \ [ ':Gremove<CR>', '<leader>grm' ],
                        \ [ ':Gblame<CR>', '<leader>gbl' ],
                        \ [ ':Gbrowse<CR>', '<leader>gbr' ],
                        \ [ ':Gwq<CR>', '<leader>gwq' ],
                        \ ]

" Create a mapping and menu item for each entry in the dictionary.
for [rhs,lhs] in s:FugitiveMaps
    call conviction#CreateMenuItem('&Git', rhs, '', '', [lhs], 'nvionoremenu')
endfor


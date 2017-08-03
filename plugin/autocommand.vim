" File:         /home/smooth/.vim/plugin/autocommand.vim
" Description:  Brian Dellaterra's Personal Vim Configuration
" Author:       Brian Dellaterra <github.com/bdellaterra>
" Version:      0.1.1
" License:      Copyright 2017 Brian Dellaterra. This file is part of Vimbad.
"               Distributed under the terms of the GNU Lesser General Public License. See the file LICENSE or <http://www.gnu.org/licenses/>.


" Automatically update copyright notice with current year,
" favoring dash-ranges over comma-seperation. Disabled by default.
" Set either the shell variable $VIM_AUTOUPDATE_COPYRIGHT_YEAR or
" the vim variable g:local.autoupdate_copyright_year to 1 to enable
function! s:UpdateCopyrightYear()
    let isEnabled = $VIM_AUTOUPDATE_COPYRIGHT_YEAR
                \ || (exists('g:local.autoupdate_copyright_year')
                \ && g:local.autoupdate_copyright_year)
    if &modified && isEnabled
        silent! %s#Copyright\v\s+%(\d+([-,]))*\zs(\d+)#\=submatch(2)>=strftime('%Y')?submatch(2):(submatch(1)=='-'?'':submatch(2).(strftime('%Y')-submatch(2)>3?',':'-')).strftime('%Y')#g
        exe "normal \<C-o>"
    endif
endfunction
autocmd BufWritePre * call <SID>UpdateCopyrightYear()


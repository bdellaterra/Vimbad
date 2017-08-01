" File:         plugin/session.vim
" Description:  Brian Dellaterra's Personal Vim Configuration
" Author:       Brian Dellaterra <github.com/bdellaterra>
" Version:      0.1.1
" License:      Copyright 2017 Brian Dellaterra. This file is part of Vimbad.
"               Distributed under the terms of the GNU Lesser General Public License. See the file LICENSE or <http://www.gnu.org/licenses/>.


" Python is required if 'base64' command isn't available (Windows OS)
if executable('base64')
    let s:encodeCmd = 'base64'
    let s:decodeCmd = 'base64 -d'
elseif executable('python')
    let s:encodeCmd = 'python -m base64 -e'
    let s:decodeCmd = 'python -m base64 -e'
else
    finish
endif

function! s:DefaultSessionId()
    return substitute(system(s:encodeCmd, getcwd()), '\_s*$', '', '')
endfunction

function! s:DefaultSessionFile()
    if exists('g:activeSessionFile')
        return g:activeSessionFile
    else
        return g:TmpDir . s:DefaultSessionId() . '.vim'
    endif
endfunction

function! SaveSession(...)
    let sessionFile = get(a:000, 0, s:DefaultSessionFile())
    exe 'mksession! ' . sessionFile
endfunction

function! RestoreSession(...)
    let sessionFile = get(a:000, 0, s:DefaultSessionFile())
    execute 'source ' . sessionFile
endfunction

function! DeleteSession(...)
    let sessionFile = get(a:000, 0, s:DefaultSessionFile())
    call delete(sessionFile)
endfunction

" Create editor commands for the functions
command! -nargs=? SaveSession call SaveSession(<f-args>)
command! -nargs=? RestoreSession call RestoreSession(<f-args>)
command! -nargs=? DeleteSession call DeleteSession(<f-args>)

autocmd BufAdd,BufHidden,FileType * SaveSession
autocmd VimLeave * exists(s:DefaultSessionFile()) && SaveSession

" Restore default session when vim is started with no file argument(s)
function! InitSession()
    if !argc() && filereadable(s:DefaultSessionFile())
        try
            call RestoreSession()
        " Catch all errors for silent start
        catch
        endtry
    endif
endfunction

" Restore default session when vim is started with no file argument(s)
" Reload file to trigger filetype detection / syntax highlighting.
autocmd VimEnter * call InitSession() | silent! edit! %



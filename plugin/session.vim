" File:         plugin/session.vim
" Description:  Brian Dellaterra's Personal Vim Configuration
" Author:       Brian Dellaterra <github.com/bdellaterra>
" Version:      0.1.1
" License:      Copyright 2017 Brian Dellaterra. This file is part of Vimbad.
"               Distributed under the terms of the GNU Lesser General Public License. See the file LICENSE or <http://www.gnu.org/licenses/>.


" Python is required if 'base64' command isn't available
if exists('g:sessionEncodeCmd') && exists('g:sessionDecodeCmd')
    let s:encodeCmd = g:sessionEncodeCmd
    let s:decodeCmd = g:sessionDecodeCmd
elseif executable('base64')
    let s:encodeCmd = 'base64'
    let s:decodeCmd = 'base64 -d'
elseif executable('python')
    let s:encodeCmd = 'python -m base64 -e'
    let s:decodeCmd = 'python -m base64 -e'
else
    finish
endif

function s:DefaultSessionId()
    return substitute(system(s:encodeCmd, getcwd()), '\_s*$', '', '')
endfunction

function s:DefaultSessionFile()
    if exists('g:activeSessionFile')
        return g:activeSessionFile
    else
        return g:TmpDir . s:DefaultSessionId() . '.vim'
    endif
endfunction

function SaveSession(...)
    let sessionFile = get(a:000, 0, s:DefaultSessionFile())
    let saveSessionOptions = &sessionoptions
    set sessionoptions=buffers,curdir,tabpages,winsize
    exe 'mksession! ' . sessionFile
    let &sessionoptions = saveSessionOptions
endfunction

function RestoreSession(...)
    let sessionFile = get(a:000, 0, s:DefaultSessionFile())
    execute 'source ' . sessionFile
endfunction

function DeleteSession(...)
    let sessionFile = get(a:000, 0, s:DefaultSessionFile())
    call delete(sessionFile)
endfunction

" Create editor commands for the functions
command -nargs=? -complete=file SaveSession call SaveSession(<f-args>)
command -nargs=? -complete=file RestoreSession call RestoreSession(<f-args>)
command -nargs=? -complete=file DeleteSession call DeleteSession(<f-args>)

autocmd BufAdd,BufHidden,BufLeave,FileType * SaveSession
autocmd VimLeave * if exists(s:DefaultSessionFile()) | SaveSession | endif

function InitSession()
    if !argc() && filereadable(s:DefaultSessionFile())
        try
            call RestoreSession()
        " Catch all errors for silent start
        catch
        endtry
    endif
endfunction

" Restore default session when vim is started with no file argument(s)
autocmd VimEnter * call InitSession()
" Use 'refresh' mapping to fix filetypes and colorscheme
autocmd VimEnter * call feedkeys(mapleader . 'rf')



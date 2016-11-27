" File:         autoload/unite/filters/converter_buf_tail_num.vim
" Description:  Brian Dellaterra's Personal Vim Configuration
" Author:       Brian Dellaterra <github.com/bdellaterra>
" Version:      0.1.1
" License:      Copyright 2015 Brian Dellaterra. This file is part of Vimbad.
"               Distributed under the terms of the GNU Lesser General Public License. See the file LICENSE or <http://www.gnu.org/licenses/>.


" Code from Petobens and Shougo in the discussion at
" https://github.com/Shougo/unite.vim/issues/722

let s:save_cpo = &cpo
set cpo&vim

function! unite#filters#converter_buf_tail_num#define()
return s:converter
endfunction

let s:converter = {
    \ 'name' : 'converter_buf_tail_num',
    \ 'description' : 'converts abbr to buffer number plus tail of filename',
    \}

function! s:converter.filter(candidates, context)
for candidate in a:candidates
    let abbr = fnamemodify(get(candidate, 'action__path', candidate.word), ':t')
    let buf_num = bufnr(abbr)
    let candidate.abbr = buf_num . ':' . abbr
endfor
return unite#util#sort_by(a:candidates, 'v:val.action__buffer_nr')
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo


" File:         plugin/ale.vim
" Description:  Brian Dellaterra's Personal Vim Configuration
" Author:       Brian Dellaterra <github.com/bdellaterra>
" Version:      0.1.1
" License:      Copyright 2015 Brian Dellaterra. This file is part of Vimbad.
"               Distributed under the terms of the GNU Lesser General Public License. See the file LICENSE or <http://www.gnu.org/licenses/>.

" Use eslint
let g:ale_linters = {'javascript': ['eslint']}

" Set eslint executable
if executable('eslint_d')
  let g:ale_javascript_eslint_executable = 'eslint_d'
endif
if executable('eslintme')
  let g:ale_javascript_eslint_executable = 'eslintme'
endif
let g:ale_javascript_eslint_use_global = 0

" Options can be passed to eslint like this:
" let g:ale_javascript_eslint_options = '--quiet'

" Set signs for sign column
let g:ale_sign_error = '●'
let g:ale_sign_warning = '•'

" Set hilight groups for signs
let g:ale_set_highlights = 1
highlight clear ALEErrorSign
highlight clear ALEWarningSign
highlight link ALEErrorSign ErrorMsg
highlight link ALEWarningSign Comment

" Linting occurs on save/enter
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_enter = 1

" Always keep sign column open
let g:ale_sign_column_always = 1


" File:         colorschemes.vim
" Description:  Brian Dellaterra's Personal Vim Configuration
" Author:       Brian Dellaterra <github.com/bdellaterra>
" Version:      0.1.1
" License:      Copyright 2015 Brian Dellaterra. This file is part of Vimbad.
"               Distributed under the terms of the GNU Lesser General Public License. See the file LICENSE or <http://www.gnu.org/licenses/>.


" Switch back to default colorscheme before running new colorscheme
" (Helps avoid glitchy behavior when switching through colorschemes)
function! FixColorScheme()
  let s:colors_name = exists('g:colors_name') ? g:colors_name : 'default'
  if s:colors_name != 'default'
    let colors_name = s:colors_name
    unlet s:colors_name
    colorscheme default
    exe 'colorscheme ' . colors_name
  endif
endfunction

" Auto-fix colors on ColorScheme event. Also on FileType to
" better support filetype-specific colorschemes
autocmd FileType,ColorScheme * call FixColorScheme()

" Refresh the screen when changing buffers
autocmd BufWinEnter * exe "normal \<C-l>"

function! DynamicColorScheme( opt, ... )
  " Set Defaults
  let colorscheme = exists('g:colors_name') ? g:colors_name : 'default'
  let options = {
        \ 'gui_dark': 'ron',
        \ 'gui_light': 'default',
        \ 'term_dark': 'ron',
        \ 'term_light': 'default',
        \ 'term16_dark': 'ron',
        \ 'term16_light': 'default',
        \ }
  let bg_var = 'g:local.background_pref'
  let bg = get( a:000, 0, exists(bg_var) ? eval(bg_var) : &background )
  " Provided options override defaults
  if type(a:opt) == type('')
    let colorscheme = a:opt
  elseif type(a:opt) == type({})
    call extend(options, a:opt, 'force')
  endif
  " If filetype-specific colorschemes are enabled...
  if get(g:local, 'filetype_colors', 0)
    " Assume at least a 16-color terminal
    let prefix = 'term16'
    " Detect if vim is running in gui or a better terminal
    if has('gui_running')
      let prefix = 'gui'
    elseif &t_Co >= 256
      let prefix = 'term'
    endif
    " Set designated colorscheme if it exists in option, otherwise use default
    let colorscheme = get( options, prefix . '_' . bg, colorscheme )
  endif
  exe 'colorscheme ' . colorscheme
endfunction

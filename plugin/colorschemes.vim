" File:         colorschemes.vim
" Description:  Brian Dellaterra's Personal Vim Configuration
" Author:       Brian Dellaterra <github.com/bdellaterra>
" Version:      0.1.1
" License:      Copyright 2015 Brian Dellaterra. This file is part of Vimbad.
"               Distributed under the terms of the GNU Lesser General Public License. See the file LICENSE or <http://www.gnu.org/licenses/>.

let s:debug = 0
if s:debug  " {{{

augroup EventLogging
  autocmd BufNewFile * call s:Log('BufNewFile')
  autocmd BufReadPre * call s:Log('BufReadPre')
  autocmd BufRead * call s:Log('BufRead')
  autocmd BufReadPost * call s:Log('BufReadPost')
  " autocmd BufReadCmd * call s:Log('BufReadCmd')
  autocmd FileReadPre * call s:Log('FileReadPre')
  autocmd FileReadPost * call s:Log('FileReadPost')
  autocmd FileReadCmd * call s:Log('FileReadCmd')
  autocmd FilterReadPre * call s:Log('FilterReadPre')
  autocmd FilterReadPost * call s:Log('FilterReadPost')
  autocmd StdinReadPre * call s:Log('StdinReadPre')
  autocmd StdinReadPost * call s:Log('StdinReadPost')
  autocmd BufWrite * call s:Log('BufWrite')
  autocmd BufWritePre * call s:Log('BufWritePre')
  autocmd BufWritePost * call s:Log('BufWritePost')
  autocmd BufWriteCmd * call s:Log('BufWriteCmd')
  autocmd FileWritePre * call s:Log('FileWritePre')
  autocmd FileWritePost * call s:Log('FileWritePost')
  autocmd FileWriteCmd * call s:Log('FileWriteCmd')
  autocmd FileAppendPre * call s:Log('FileAppendPre')
  autocmd FileAppendPost * call s:Log('FileAppendPost')
  autocmd FileAppendCmd * call s:Log('FileAppendCmd')
  autocmd FilterWritePre * call s:Log('FilterWritePre')
  autocmd FilterWritePost * call s:Log('FilterWritePost')
  autocmd BufAdd * call s:Log('BufAdd')
  autocmd BufCreate * call s:Log('BufCreate')
  autocmd BufDelete * call s:Log('BufDelete')
  autocmd BufWipeout * call s:Log('BufWipeout')
  autocmd BufFilePre * call s:Log('BufFilePre')
  autocmd BufFilePost * call s:Log('BufFilePost')
  autocmd BufEnter * call s:Log('BufEnter')
  autocmd BufLeave * call s:Log('BufLeave')
  autocmd BufWinEnter * call s:Log('BufWinEnter')
  autocmd BufWinLeave * call s:Log('BufWinLeave')
  autocmd BufUnload * call s:Log('BufUnload')
  autocmd BufHidden * call s:Log('BufHidden')
  autocmd BufNew * call s:Log('BufNew')
  autocmd SwapExists * call s:Log('SwapExists')
  autocmd FileType * call s:Log('FileType')
  autocmd Syntax * call s:Log('Syntax')
  autocmd EncodingChanged * call s:Log('EncodingChanged')
  autocmd TermChanged * call s:Log('TermChanged')
  autocmd VimEnter * call s:Log('VimEnter')
  autocmd GUIEnter * call s:Log('GUIEnter')
  autocmd GUIFailed * call s:Log('GUIFailed')
  autocmd TermResponse * call s:Log('TermResponse')
  autocmd QuitPre * call s:Log('QuitPre')
  autocmd VimLeavePre * call s:Log('VimLeavePre')
  autocmd VimLeave * call s:Log('VimLeave')
  autocmd FileChangedShell * call s:Log('FileChangedShell')
  autocmd FileChangedShellPost * call s:Log('FileChangedShellPost')
  autocmd FileChangedRO * call s:Log('FileChangedRO')
  autocmd ShellCmdPost * call s:Log('ShellCmdPost')
  autocmd ShellFilterPost * call s:Log('ShellFilterPost')
  autocmd FuncUndefined * call s:Log('FuncUndefined')
  autocmd SpellFileMissing * call s:Log('SpellFileMissing')
  " autocmd SourcePre * call s:Log('SourcePre')
  " autocmd SourceCmd * call s:Log('SourceCmd')
  autocmd VimResized * call s:Log('VimResized')
  autocmd FocusGained * call s:Log('FocusGained')
  autocmd FocusLost * call s:Log('FocusLost')
  autocmd CursorHold * call s:Log('CursorHold')
  autocmd CursorHoldI * call s:Log('CursorHoldI')
  autocmd CursorMoved * call s:Log('CursorMoved')
  autocmd CursorMovedI * call s:Log('CursorMovedI')
  autocmd WinEnter * call s:Log('WinEnter')
  autocmd WinLeave * call s:Log('WinLeave')
  autocmd TabEnter * call s:Log('TabEnter')
  autocmd TabLeave * call s:Log('TabLeave')
  autocmd CmdwinEnter * call s:Log('CmdwinEnter')
  autocmd CmdwinLeave * call s:Log('CmdwinLeave')
  autocmd InsertEnter * call s:Log('InsertEnter')
  autocmd InsertChange * call s:Log('InsertChange')
  autocmd InsertLeave * call s:Log('InsertLeave')
  autocmd InsertCharPre * call s:Log('InsertCharPre')
  autocmd TextChanged * call s:Log('TextChanged')
  autocmd TextChangedI * call s:Log('TextChangedI')
  autocmd ColorScheme * call s:Log('ColorScheme')
  autocmd RemoteReply * call s:Log('RemoteReply')
  autocmd QuickFixCmdPre * call s:Log('QuickFixCmdPre')
  autocmd QuickFixCmdPost * call s:Log('QuickFixCmdPost')
  autocmd SessionLoadPost * call s:Log('SessionLoadPost')
  autocmd MenuPopup * call s:Log('MenuPopup')
  autocmd CompleteDone * call s:Log('CompleteDone')
  autocmd User * call s:Log('User')
augroup END

function! s:Log(eventName) abort
  silent execute '!echo '.a:eventName.' -- '.&ft.' -- '.get(g:,'colors_name', '').' >> log'
endfunction

endif  " }}}

" Switch back to default colorscheme then run new colorscheme
" (Helps avoid glitchy behavior when switching through colorschemes)
function! FixColorScheme()
  if g:colors_name != 'default'
    colorscheme default
    exe 'colorscheme ' . g:colors_name
  endif
endfunction

" Establish default filetype for files where none is detected
let g:local.default_filetype = exists('g:local.default_filetype')
      \ ? g:local.default_filetype
      \ : 'text'
function! DefaultFiletype()
  let ft = exists('b:did_filetype') ? b:did_filetype : g:local.default_filetype
  if exists('b:did_filetype') ||
        \ (expand('%:e') == '' && &buftype == '' &&  &filetype == '')
    exe 'setfiletype ' . ft
    exe 'set syntax=' . &filetype
    let b:did_filetype = &filetype
  endif
endfunction

autocmd BufNewFile,BufEnter * call DefaultFiletype()
autocmd FileType * call SetColorScheme()
autocmd ColorScheme * call FixColorScheme()
autocmd BufWinEnter * exe "normal \<C-l>"
autocmd BufLeave * let g:last_colorscheme = len(g:cs) - 1

" Build a hierarchy of colorscheme preferences based on
" filetype-specific configurations
function! DynamicColorScheme( opt, ... )
  let index = get(g:, 'last_colorscheme', -1)
  let g:cs = exists('g:cs') ? g:cs : []
  if type(a:opt) == type({})
    let g:cs += [a:opt]
  else
    let g:cs = g:cs[0:index]
  endif
endfunction

function! SetColorScheme()
  " Set Defaults
  let bg_var = 'g:local.background_pref'  " Set in vimrc to establish preference
  let bg = get( a:000, 0, exists(bg_var) ? eval(bg_var) : &background )
  let default_opts = {
        \ 'gui_dark': 'ron',
        \ 'gui_light': 'default',
        \ 'term_dark': 'ron',
        \ 'term_light': 'default',
        \ 'term16_dark': 'ron',
        \ 'term16_light': 'default',
        \ }
  if exists('g:local.default_colorscheme')
    let default_cs = g:local.default_colorscheme
  else
    let default_cs =
          \ bg == 'dark'
          \ ? default_opts['term16_dark'] 
          \ : default_opts['term16_light']
  endif
  " Consolidate colorscheme preferences across filetype hierarchy
  let opts = default_opts
  for i in g:cs
    call extend(opts, i, 'force')
  endfor
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
    " Set designated colorscheme if it exists in options
    " and editing a normal buffer (not help, quickfix, etc.)
    let cs = get( opts, prefix . '_' . bg, default_cs )
    if &buftype == '' && cs != g:colors_name
      exe 'colorscheme ' . cs
    endif
  endif
endfunction


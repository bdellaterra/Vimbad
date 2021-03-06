" File:         after/plugin/ranger.vim
" Description:  Brian Dellaterra's Personal Vim Configuration
" Author:       Brian Dellaterra <github.com/bdellaterra>
" Version:      0.1.1
" License:      Copyright 2017 Brian Dellaterra. This file is part of Vimbad.
"               Distributed under the terms of the GNU Lesser General Public License. See the file LICENSE or <http://www.gnu.org/licenses/>.


" Add Ranger as a file explorer in Vim
" Ref: https://github.com/ranger/ranger/blob/master/examples/vim_file_chooser.vim
function! RangeChooser(...)
      " Open at path if provided
      let path = get(a:000, 0, '')
      let temp = tempname()
      " The option "--choosefiles" was added in ranger 1.5.1. Use the next line
      " with ranger 1.4.2 through 1.5.0 instead.
      "exec 'silent !ranger --choosefile=' . shellescape(temp)
      let choosefiles = '--choosefiles=' . shellescape(temp)
      if has("gui_running")
	    exec 'silent !xterm -e ranger ' . choosefiles . ' ' . path
      else
	    exec 'silent !ranger ' . choosefiles . ' ' . path
      endif
      if !filereadable(temp)
	    redraw!
	    " Nothing to read.
	    return
      endif
      let names = readfile(temp)
      if empty(names)
	    redraw!
	    " Nothing to open.
	    return
      endif
      " Edit the first item.
      exec 'edit ' . fnameescape(names[0])
      " Add any remaning items to the arg list/buffer list.
      for name in names[1:]
	    exec 'argadd ' . fnameescape(name)
      endfor
      redraw!
endfunction
command! -nargs=? -complete=file -bar RangerChooser call RangeChooser(<f-args>)


" Set Ranger as file-explorer on console Vim
if !has('gui_running')
      " <Leader>fe or <Leader>e: File Explorer
      NVONoremap <Leader>fe :RangerChooser<CR>
      NVOMap <Leader>e <Leader>fe
      " <Leader>f. or <Leader>.: File Explorer
      NVONoremap <Leader>f. :exe 'RangerChooser ' . fnamemodify(expand('%'), ':h')<CR>
      NVOMap <Leader>. <Leader>f.
else
      " Fallback keymaps for GVim
      NVOMap <Leader>fe <Leader>fb
      NVOMap <Leader>e <Leader>fb
      NVONoremap <Leader>f. :exe 'VimFiler ' . fnamemodify(expand('%'), ':h')<CR>
      NVOMap <Leader>. <Leader>f.
endif
NVOMenu 301 &File '&Explore Files' '<Leader>fe\ or\ <Leader>e' '<Leader>fe'
NVOMenu 302 &File 'Explore &Near Current File' '<Leader>f\.\ or\ <Leader>\.' '<Leader>f.'



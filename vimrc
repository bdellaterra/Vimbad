" File:			vimrc
" Description:	Brian Dellaterra's Personal Vim Configuration
" Author:		Brian Dellatera <github.com/bdellaterra>
" Version:		0.1.1
" License:      Copyright 2015 Brian Dellaterra. This file is part of Vimbad.
" 				Distributed under the terms of the GNU Lesser General Public License.
"				See the file LICENSE or <http://www.gnu.org/licenses/>.

" NOTE: A custom vimrc in the $HOME directory should source this one.
"       (See :help vimrc and :help source)

" Don't try to be compatible with Vim's ancestor Vi
set nocompatible

" Ensure Vim is running in a compatible environment.
if !( has('Unix') || has('Win32') )
	throw "This configuration is only intended for Unix or Windows systems."
endif


" PATHS

" The convention is that all directory paths will end in a slash
" and all slashes will be forward slashes. This is established by
" the following function:
function s:SetSlashes(path)
	return substitute(a:path, '[^/\\]\@<=$\|\\', '/', 'g')
endfunction

" Directory where Vim configuration is stored.
if !exists('g:VimfilesDir') 
	if has('Unix')
		let g:VimfilesDir = s:SetSlashes($HOME) . '.vim/'
	elseif has('Windows')
		let g:VimfilesDir = s:SetSlashes($HOME) . 'vimfiles/'
	endif
endif


" Pathogen

" Use bundle directory for Pathogen itself.
runtime bundle/vim-pathogen/autoload/pathogen.vim

" Have Pathogen manage bundled plugins.
call pathogen#infect()

" Set directory where temporary files can be stored.
if !exists('g:TmpDir') 
	if has('Unix')
		if exists('$TMPDIR') 
			let g:TmpDir = s:SetSlashes($TMPDIR) . 'vim/'
		else
			let g:TmpDir = '/var/tmp/vim/'
		endif
	elseif has('Windows') && exists('$TEMP') 
		let g:TmpDir = s:SetSlashes($TEMP) . 'vim/'
	else
		let g:TmpDir = './.vim/tmp/'
	endif
	" Create directory if it doesn't exist.
	if !isdirectory(g:TmpDir)
		try | call mkdir(g:TmpDir) | endtry
	endif
endif

" Set directory where backup files are stored.
if !exists('g:BackupDir') 
	let g:BackupDir = g:TmpDir . 'backup/'
	" Create directory if it doesn't exist.
	if !isdirectory(g:BackupDir)
		try | call mkdir(g:BackupDir) | endtry
	endif
endif

" Set directory where swap files are stored.
if !exists('g:SwapDir') 
	let g:SwapDir = g:TmpDir . 'swap/'
	" Create directory if it doesn't exist
	if !isdirectory(g:SwapDir)
		try | call mkdir(g:SwapDir) | endtry
	endif
endif

" Set directory where persistent undo files can be stored.
if !exists('g:UndoDir') 
	let g:UndoDir = g:TmpDir . 'undo/'
	" Create directory if it doesn't exist.
	if !isdirectory(g:UndoDir)
		try | call mkdir(g:UndoDir) | endtry
	endif
endif

" Specify path where Unix executables can be found.
if !exists('g:UnixBinDir') 
	let g:UnixBinDir = '/bin/'
endif

" Specify delimiter used to separate multiple entries in the
" system PATH variable.
let g:SysPathSep = ':'


" GENERAL SETTINGS

" NOTE: These can be overridden in an "after" directory, (See :help after)

" Specify the mapleader for Vim mappings.
let mapleader = ','

" This loads some good default configurations written
" by Bram Moolenaar. (Creator of Vim)
source $VIMRUNTIME/vimrc_example.vim

" Disable backwards-compatibility with Vi. (ancestor of Vim)
set cpoptions&vim

" Allow backspacing over everything.
set backspace=indent,eol,start

" Display most of a last line that doesn't fit in the window.
set display=lastline

" Default to opening new splits below and to the right.
set splitbelow
set splitright

" Use undo-persistence.
set undofile

" Auto-save when opening/changing buffers.
set autowriteall

" Keep swap/backup/undo files from cluttering the working directory.
" NOTE: Adding an extra slash because '//' at the end creates
" unique filenames built from the full file path. (See :help directory)
exe 'set backupdir=' . g:BackupDir . '/'
exe 'set directory=' . g:SwapDir . '/'
exe 'set undodir='   . g:UndoDir . '/'

" Disable beep and visual flash alerts.
autocmd VimEnter * set vb t_vb=

" Clear the screen so there are no initial status messages.
autocmd VimEnter * silent! redraw!

" Don't automatically wrap lines.
set formatoptions-=t

" Ignore case in searches using only lowercase letters.
set ignorecase smartcase

" Keep a long command history.
set history=100

" Have all folds open when a new file is loaded.
set foldlevelstart=999

" Prevent "Hit enter to continue" message.
set shortmess+=T
" Further reduce prompts by increasing the height of the command line.
set cmdheight=1

" Set tabbing behavior.
set shiftwidth=4
set tabstop=4
set expandtab

" Always show status line
set laststatus=2

" Don't show the toolbar/icons
set guioptions-=T


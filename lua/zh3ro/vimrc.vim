
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Jan 26
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc
"
" Showing numbers and setting to relative numbers showing
set number
set relativenumber

"From thoughtbot speech on VIM
set nocompatible
syntax enable
filetype plugin on

" Search down into subfolder
" Provides ta-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" To always use clipboard for all operations
set clipboard+=unnamedplus


command! MakeTags !ctags -R .
"
" TWEAKS FOR BROWSING -- SETTING NETWR UP PROPERLY
"
let g:netrw_banner=0		"disable annoying banner
"let g:netrw_browse_split=4	"open in prior window
"let g:netrw_altv=1		"open splits to the right
let g:netrw_liststyle=3		"tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

"Now we can:
"
" :edit a folder to open a file browser
" <CR>/v/t to open in an h-split/v-split/tab


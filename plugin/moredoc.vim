"----------------------------------------------------------------------------------
" Project Name      - vimconfig/plugin/moredoc.vim
" Started On        - Mon  5 Mar 17:21:01 GMT 2018
" Last Change       - Mon  5 Mar 22:23:59 GMT 2018
" Author E-Mail     - terminalforlife@yahoo.com
" Author GitHub     - https://github.com/terminalforlife
"----------------------------------------------------------------------------------
" Display helpful screen information; good for code. Use <leader>more to toggle.
" Use VIM as a standard text editor, for non-code. Use with <leader>doc to toggle.
"----------------------------------------------------------------------------------

if(len(&statusline) == 0)
	set statusline=\ %F%m%r%h%w\ \ FF=%{&ff}\ \ T=%Y\ \ A=\%03.3b\ \ H=\%02.2B\ \ POS=%04l,%04v\ \ %p%%\ \ LEN=%L
endif

func! TFL_DocMode()
	if(exists("g:docmodestate") == 0)
		set linebreak
		set wrap
		syntax off

		let g:docmodestate="true"
		echo "Document Mode is enabled."
	elseif(g:docmodestate == "true")
		set nolinebreak
		set nowrap
		syntax on

		unlet g:docmodestate
		echo "Document Mode is disabled."
	endif
endfunc

func! TFL_MoreMode()
	if(exists("g:moremodestate") == 0)
		if(&showmatch == 0)
			set showmatch
		endif

		set ruler
		set cursorline
		set norelativenumber
		set number
		set colorcolumn=84
		set laststatus=2

		let g:moremodestate="true"
		echo "More mode is enabled."
	elseif(g:moremodestate == "true")
		if(&showmatch == 1)
			set noshowmatch
		endif

		set noruler
		set nocursorline
		set norelativenumber
		set nonumber
		set colorcolumn=0
		set laststatus=1

		unlet g:moremodestate
		echo "More mode is disabled."
	endif
endfunc

if(&filetype == "vim")
	silent call TFL_MoreMode()
endif

noremap <silent> <leader>more :call TFL_MoreMode()<CR>
noremap <silent> <leader>doc :call TFL_DocMode()<CR>

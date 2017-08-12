" Write history on idle, for sharing among different sessions
autocmd MyAutoCmd CursorHold * if exists(':rshada') | rshada | wshada | endif

" Search and use environments specifically made for Neovim.
" if isdirectory($VARPATH.'/venv/neovim2')
	" let g:python_host_prog = $VARPATH.'/venv/neovim2/bin/python'
let g:python_host_prog = '/usr/local/bin/python2'
" endif
" if isdirectory($VARPATH.'/venv/neovim3')
	" let g:python3_host_prog = $VARPATH.'/venv/neovim3/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
" endif

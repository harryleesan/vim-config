let g:vim_markdown_conceal = 0
set conceallevel=0
set number

augroup remember_folds
  autocmd!
  au BufWinLeave ?* mkview 1
  au BufWinEnter ?* silent! loadview 1
augroup END

" au BufWritepost *.php silent! !eval '[ -f ".git/hooks/ctags" ] && .git/hooks/ctags' &

" Function to create buffer local mappings
fun! AsciidoctorMappings()
	nnoremap <buffer> <leader>ah :Asciidoctor2HTML<CR>
	nnoremap <buffer> <leader>ap :Asciidoctor2PDF<CR>
	nnoremap <buffer> <leader>ax :Asciidoctor2DOCX<CR>
endfun

" Call AsciidoctorMappings for all `*.adoc` and `*.asciidoc` files
augroup asciidoctor
	au!
	au BufEnter *.adoc,*.asciidoc call AsciidoctorMappings()
augroup END

let g:asciidoctor_folding = 1
let g:asciidoctor_fold_options = 1
let g:asciidoctor_img_paste_command = 'pngpaste %s%s'
let g:asciidoctor_img_paste_pattern = 'img_%s_%s.png'

" command! PadawanStart call deoplete#sources#padawan#StartServer()
" command! PadawanStop call deoplete#sources#padawan#StopServer()
" command! PadawanRestart call deoplete#sources#padawan#RestartServer()
" command! PadawanInstall call deoplete#sources#padawan#InstallServer()
" command! PadawanUpdate call deoplete#sources#padawan#UpdatePadawan()
" command! -bang PadawanGenerate call deoplete#sources#padawan#Generate(<bang>0)

" copy to attached terminal using the yank(1) script:
" https://github.com/sunaku/home/blob/master/bin/yank
function! Yank(text) abort
  let escape = system('yank', a:text)
  if v:shell_error
    echoerr escape
  else
    call writefile([escape], '/dev/tty', 'b')
  endif
endfunction
noremap <silent> <Leader>y y:<C-U>call Yank(@0)<CR>

" https://github.com/weirongxu/plantuml-previewer.vim
au FileType plantuml let g:plantuml_previewer#plantuml_jar_path = get(
    \  matchlist(system('cat `which plantuml` | grep plantuml.jar'), '\v.*\s[''"]?(\S+plantuml\.jar).*'),
    \  1,
    \  0
    \)

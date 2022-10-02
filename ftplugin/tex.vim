" Set indentation to 4
set sw=4

" Enable spellcheck
set spell
set spelllang=en

" Set the maximum textwidth to 80
set textwidth=80

" Enable spell fixing with CTRL+s
" <c-g>u make undo block, lasts untill next <c-g>u, exit insert mode, 
" [s go to last misspelled word
" 1z= replace with first suggestion, `] go to the end of the last changed text
imap <c-s> <c-g>u<Esc>[s1z=`]a<c-g>u
" in normal mode:
" ms set mark s on current line and column
" [s go to last misspelled word
" 1z= replace with first suggestion
" `s go to mark s in current file
nmap <c-s> ms[s1z=`s

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimtex
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable folding based on chapters
let g:vimtex_fold_enabled = 1

" Set pdf viewer
let g:vimtex_view_method = 'skim'

let g:vimtex_compiler_latexmk = {
 			\ 'options' : [
 				\   '-verbose',
 				\   '-file-line-error',
 				\   '-synctex=1',
 				\   '-interaction=nonstopmode',
 				\ ],
 				\}
" Create mapping to toggle compiling with shell escape or not
nnoremap <F12> :call ShellEscape()<CR>
function! ShellEscape()
    if g:vimtex_compiler_latexmk.options[0] ==# '-shell-escape'
        call remove(g:vimtex_compiler_latexmk.options, 0)
        "echo "shell escape disabled"
		echo g:vimtex_compiler_latexmk
    else
        call insert(g:vimtex_compiler_latexmk.options, '-shell-escape', 0)
        "echo "shell escape enabled"
		echo g:vimtex_compiler_latexmk
    endif
    VimtexReload
endfunction
" " Create mapping to toggle compiling with shell escape or not
" nnoremap <F12> :call ShellEscape()<CR>
" let g:shell_escape_is_on = 0
" function! ShellEscape()
"     if g:shell_escape_is_on
"         let g:vimtex_compiler_latexmk = {
"                     \ 'options' : [
"                         \   '-verbose',
"                         \   '-file-line-error',
"                         \   '-synctex=1',
"                         \   '-interaction=nonstopmode',
"                         \ ],
"                         \}
"         echo "shell escape disabled"
"         let g:shell_escape_is_on = 0
"     else
"         let g:vimtex_compiler_latexmk = {
"                     \ 'options' : [
"                         \   '-shell-escape',
"                         \   '-verbose',
"                         \   '-file-line-error',
"                         \   '-synctex=1',
"                         \   '-interaction=nonstopmode',
"                         \ ],
"                         \}
"         let g:shell_escape_is_on = 1
" 		echo "shell escape enabled"
"     endif
" 	VimtexReload
" endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => vim-latex
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Set pdfviewer to skim 
"let g:Tex_ViewRule_pdf = 'open -a Skim'

"" Compile pdf
"let g:Tex_DefaultTargetFormat = 'pdf'

"" Compile as many times as needed when compiling pdf
"let g:Tex_MultipleCompileFormats = 'dvi,pdf'

"" Set compile rule.
"let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode $*'

"" Create mapping to toggle compiling with shell escape or not
"nnoremap <F12> :call ShellEscape()<CR>
"function! ShellEscape()
"  if g:Tex_CompileRule_pdf == 'pdflatex -interaction=nonstopmode $*'
"    let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode -shell-escape $*'
"    echo "shell escape enabled"
"  else
"    let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode $*'
"    echo "shell escape disabled"
"  endif
"endfunction


"" Set bibliography backend to biber (default is bibtex)
"let g:Tex_BibtexFlavor = 'biber'

"" Set leaderkey to §, (was originally ` (backtick))
"let g:Tex_Leader = '§'

"" Enable alt-key bindings in vim latex.
"let g:Tex_AdvancedMath = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tex-conceal
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Conceal fractions (½ ⅓ ⅔ ¼ ⅕ ⅖ ⅗ ⅘ ⅙ ⅚ ⅛ ⅜ ⅝ ⅞)
let g:tex_conceal_frac = 1

set conceallevel=2
let g:tex_conceal="abdgm"

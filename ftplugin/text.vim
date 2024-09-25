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

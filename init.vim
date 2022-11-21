"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')

" add all your plugins here 
" Plug 'monkey/bananas' is shorthand for 
" Plug 'https://github.com/monkey/bananas'

" Autocomplete
Plug 'Shougo/deoplete.nvim'
    " display function signatures
Plug 'Shougo/echodoc.vim'
    " Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" For easier commenting
Plug 'tpope/vim-commentary'
" surroundings, brackets quotes etc
Plug 'tpope/vim-surround'
" Mark end of line whitespace
Plug 'csexton/trailertrash.vim'
" Smooth scroll
Plug 'terryma/vim-smooth-scroll'

" Syntax error checking. 
    " Note that ale needs external checkers
Plug 'dense-analysis/ale'

" Python stuff
    " No BS code folding for python
Plug 'tmhedberg/SimpylFold'
    " Better python indentation
Plug 'Vimjas/vim-python-pep8-indent'
    " Auto pep8
Plug 'tell-k/vim-autopep8'
    " Python Syntax highlighting
Plug 'vim-python/python-syntax'
    " Python deoplete completion
Plug 'deoplete-plugins/deoplete-jedi'

" Haskell stuff
    " Syntax highlighting and indentation for haskell
Plug 'neovimhaskell/haskell-vim'
    " Concealment for haskell
Plug 'enomsg/vim-haskellConcealPlus'
    " Haskell deoplete completion
Plug 'eagletmt/neco-ghc'

" Clang stuff
    " C/C++ deoplete completion
Plug 'Shougo/deoplete-clangx'

" Latex stuff
    " The one and only
"Plug 'vim-latex/vim-latex'
Plug 'lervag/vimtex'
    "concealment <3"
"Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}

    " Git commands
Plug 'tpope/vim-fugitive'


" Color schemes
Plug 'nanotech/jellybeans.vim'
Plug 'jnurmine/Zenburn'
Plug 'morhetz/gruvbox'
Plug 'ciaranm/inkpot'
Plug 'xiaody/thornbird.vim'
Plug 'sjl/badwolf'
Plug 'joshdick/onedark.vim'
Plug 'challenger-deep-theme/vim'

    " Rainbow parenthesis
Plug 'luochen1990/rainbow'


" All of your Plugins must be added before the following line
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history (i.e. typed commands) VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to automatically reload when a file is changed from the outside (and it hasn't been
" modified)
set autoread

" Set leader (this is the default)
let mapleader = '\'

" Set encoding
set encoding=utf-8

" set python provider
let g:python3_host_prog = '~/miniconda3/envs/neovim_env/bin/python3'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set n lines to the cursor - when moving vertically using j/k
set scrolloff=3

" Set n characters to the cursor when moving right and left
set sidescrolloff=5

"Always show current position
set ruler

" Set row numbers and relative numbers
set number
set relativenumber

" Height of the command bar
set cmdheight=1

" Show commands as they are typed
set showcmd

" Always show tabline
set showtabline=2

" Display command line’s tab complete options as a menu.
set wildmenu

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Incremental search
set incsearch

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Make code look pretty
let python_highlight_all=1
syntax on

" Set colorscheme
"colorscheme my_challenger_deep
colorscheme challenger_deep

" Let challenger_deep do italics even in terminal
let g:challenger_deep_terminal_italics = 1

" Options for haskell concealing
let hscouptions="s𝐌"

" Rainbow parentheses
let g:rainbow_active = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Statusline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show statusline
set laststatus=2

" Get current git branch
function! GitBranch(git)
  if a:git == ""
    return '-'
  else
    return a:git
  endif
endfunction

" If file is a tex file, run texcount on save and output to statusline
let g:wordcount=""
augroup wcstatus
	" v this thing clears all commands that was previously in this group (hopefully none)
    autocmd!

    " Whenever a tex file is written, Read or entered (e.g. when switching to
    " tab) count the words
    autocmd BufWritePost,BufRead,BufEnter *.tex :let g:wordcount=GetTexWC()." words"
    " Whenever tex file is left, do not display a wordcount
    autocmd BufLeave *.tex :let g:wordcount=""

    " Whenever a txt file is written, Read or entered (e.g. when switching to
    " tab) count the words
    autocmd BufWritePost,BufRead,BufEnter *.txt :let g:wordcount=GetTxtWC()." words"
    " Whenever tex file is left, do not display a wordcount
    autocmd BufLeave *.txt :let g:wordcount=""
augroup END

" Get the texcount wordcount for current file
function! GetTexWC()
    let l:tmp=system("texcount"." ".expand('%'))
    let l:tmp1=system("grep 'Words in text'", l:tmp)
    let l:tmp2=system("awk '{print $4}'", l:tmp1)
    let l:tmp3=system("tr -d '\n'", l:tmp2)
    return l:tmp3
endfunction
" Get the wc wordcount for current file
function! GetTxtWC()
    let l:tmp=system("wc -w ".expand('%')." | awk '{print $1}'")
    let l:tmp1=system("tr -d '\n'", l:tmp)
	return l:tmp1
endfunction


" Define some highlight groups to display nice colors
hi link Base Normal
"hi ColCol ctermbg=235 ctermfg=245
" hi SepCol ctermbg=238 ctermfg=39 cterm=bold gui=bold guibg=#444444 guifg=#00afff
hi FileName ctermfg=208 guifg=#ff8700
hi SepCol ctermfg=39 cterm=bold gui=bold guifg=#00afff
hi GitCol ctermfg=35 guifg=#00af5f

" Create the statusline
set statusline=%#Base#
set statusline+=%#LineNr#
set statusline+=%3c
set statusline+=%#SepCol#%{'\ «\ '}%#FileName#
set statusline+=%t      " Filename
set statusline+=%1m     " Modified flag
set statusline+=%1r     " Read-Only flag
set statusline+=%#SepCol#%{'\ »\ \ \ '}%#Base#

set statusline+=%= " Left - Right separation
set statusline+=%{g:wordcount} " Latex wordcount
set statusline+=%#SepCol#%{'\ \ \ «\ '}%#Base#
set statusline+=%#GitCol#
set statusline+=\ 
" The five means that if the current head is detached, display the first five
" chars of the commit hash
set statusline+=%{FugitiveHead(5)}
set statusline+=\ 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" When pressing tab or indenting with >>
" add a \t character and make it look like it takes up four spaces
set noexpandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Be smart when using tabs ;)
set smarttab

set autoindent "Auto indent
filetype plugin indent on
set wrap "Wrap lines

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with spacebar
nnoremap <space> za

"Let enter make empty line below and shift enter empty line above
map <Enter> o<ESC>
map <S-Enter> O<ESC>

" Let backspace remove indents and eols
set backspace=indent,eol,start

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Deoplete customization
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring=1

" This makes ultisnips show up higher in the list of suggestions
call deoplete#custom#source('ultisnips', 'rank', 1000)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Echodoc customization
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:echodoc#enable_at_startup=1
let g:echodoc#type = 'floating'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ALE customization
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <F9> <Plug>(ale_detail)
nmap <leader>n <Plug>(ale_next)
nmap <leader>p <Plug>(ale_previous)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UltiSnips customization
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

let g:UltiSnipsSnippetDirectories=["UltiSnips", "MySnippets"]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-autopep8
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable show diff window
let g:autopep8_disabe_show_diff=1

" Map it to the f8 key
augroup Autopep8cmds
    autocmd!
    autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>
augroup END

" Do not format on save 
let g:autopep8_on_save = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => smooth scroll customization
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 10, 1)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 10, 1)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 10, 1)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 10, 1)<CR>

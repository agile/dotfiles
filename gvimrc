let loaded_matchparen = 1
set nocompatible
set nospell
set nofen
set bs=2
syntax on
filetype on
filetype plugin on
filetype indent on
colorscheme brookstream
set nowrap
set nobackup
set ts=2
set sw=2
"set noet
set et
set ai
set nosi
set tw=0
set nonumber
set incsearch
set nohls
set vb
set backupcopy=yes
set ignorecase
"set swb=split
set wildmenu
set wildmode=list:longest,full
set mouse=a
set ballooneval

" last-position-jump
" Jump to the last known cursor position in the file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif


map <F1> :set gfn=<CR>:colorscheme brookstream<CR>
" projector friendly setup 
map <F2> :set gfn=Courier\ 10\ Pitch\ 20<CR>:colorscheme github256<CR>
map <F3> :!cheat<SPACE>
" set what the make program should run when using the rubyunit compiler
"let testrb='rake'

" Quote motions for operators: da" will delete a quoted string. 
omap i" :normal vT"ot"<CR>
omap a" :normal vF"of"<CR>
omap i' :normal vT'ot'<CR>
omap a' :normal vF'of'<CR>

"tab mappings to switch tabs using alt-[1-9], Create a new tab using Alt-t, and close a tab using Alt-w
map <A-1> 1gt
map <A-2> 2gt
map <A-3> 3gt
map <A-4> 4gt
map <A-5> 5gt
map <A-6> 6gt
map <A-7> 7gt
map <A-8> 8gt
map <A-9> 9gt
map <A-t> :tabnew<CR>
map <A-w> :tabclose<CR>


" Diff the current buffer with file, use diffoff to leave diff mode
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  " new | r # | normal 1Gdd - for horizontal split
  vnew | r # | normal 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! Diff call s:DiffWithSaved() 

function! s:DiffWithSvn()
  let filetype=&ft
  let cmd="svn diff " . %
  " new | r # | normal 1Gdd - for horizontal split
  vnew | r `cmd` "| normal 1Gdd
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! Svn call s:DiffWithSvn() 



" Highlight crazy characters
hi SpecialKey term=bold gui=bold,inverse ctermfg=yellow guifg=yellow 

set laststatus=2
" The status bar of the active window
hi statusline   term=inverse,bold cterm=inverse,bold gui=bold ctermfg=darkblue ctermbg=white    guifg=black guibg=darkcyan
" the status bar of the inactive window
hi statuslinenc term=inverse,bold cterm=inverse,bold gui=bold ctermfg=darkblue ctermbg=darkblue guifg=darkblue guibg=gray
" Various Colors 
hi User1 term=inverse,bold cterm=inverse,bold gui=bold ctermfg=darkblue ctermbg=darkyellow  guifg=darkblue guibg=yellow
hi User2 term=inverse,bold cterm=inverse,bold gui=bold ctermfg=darkblue ctermbg=darkcyan    guifg=black guibg=cyan
hi User3 term=inverse,bold cterm=inverse,bold gui=bold ctermfg=darkblue ctermbg=darkmagenta guifg=white guibg=darkmagenta
hi User4 term=inverse,bold cterm=inverse,bold gui=bold ctermfg=darkblue ctermbg=darkgreen   guifg=white guibg=darkgreen
hi User5 term=inverse,bold cterm=inverse,bold gui=bold ctermfg=darkblue ctermbg=darkblue    guifg=white guibg=darkblue
hi User6 term=inverse,bold cterm=inverse,bold gui=bold ctermfg=darkblue ctermbg=darkred     guifg=white guibg=darkred
hi User7 term=inverse,bold cterm=inverse,bold gui=bold ctermfg=darkblue ctermbg=black       guifg=black guibg=darkgray
"let g:StatusLines{0}='%*[%n]%6*[%l,%v]%*[%{&ff}]%5*%y%2*%F%1*%m%r%h%w%* %=[%{strlen(&enc)?&enc:"is not set"}][ASC=%03.3b][HEX=%02.2B][%l/%L][%p%%]%*'
"let &statusline='%*[%n]%6*[%l,%v]%*[%{&ff}]%5*%y%2*%F%1*%m%r%h%w%* %=[%{strlen(&enc)?&enc:"is not set"}][ASC=%03.3b][HEX=%02.2B][%l/%L][%p%%]%*'
let &statusline='%*[%n]%6*[%l,%v]%*[%{&ff}]%5*%y%2*%F%1*%m%r%h%w%* %=[%l/%L][%p%%]%*'

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
"set ballooneval

"map Q to something useful
noremap Q gq
 
"make Y consistent with C and D
nnoremap Y y$

" cool for the console, which I never use, but f's up the gui.. I should
" really have separate configs
"if $COLORTERM == 'gnome-terminal'
"    set term=gnome-256color
"    colorscheme brookstream
"else
"    colorscheme brookstream
"endif 

"jump to last cursor position when opening a file
"dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal g`\""
        endif
    end
endfunction


map <F1> :set gfn=<CR>:colorscheme brookstream<CR>
map <F2> :set gfn=Courier\ 10\ Pitch\ 20<CR>:colorscheme default<CR>
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

" Highlight crazy characters
hi SpecialKey term=bold gui=bold,inverse ctermfg=yellow guifg=yellow 

" Status Bar stuffs.(below)...........................................................
set laststatus=2

fu! Percent()
  let byte = line2byte( line( "." ) ) + col( "." ) - 1
  let size = (line2byte( line( "$" ) + 1 ) - 1)
  return (byte * 100) / size
endf

let g:StatusLines{0}='%5* %*->%7*[%*%1*%n%*%7*]%* %= %7*[%*%1*FILE%* %*%2*%t%*%7*]%* %7*[%*%1*FT%* %3*%4{strlen(&ft)?&ft:"none"}%*%7*]%* %7*:%* %7*[%*%4*%8l%*%7*/%*%4*%8L%* %7*=%* %1*%3p%%%*%7*]%*'
let g:StatusLines{1}='%5* %*->%7*[%*%1*%n%*%7*]%* %= %7*[%*%2*%03bD%* %7*|%* %2*%5(0x%02BH%)%*%7*]%* %7*[%*%3*%8oC%*%7*=%*%1*%3{Percent()}%%%*%7*]%* %7*[%*%4*%8c%*%7*]%* %7*:%* %7*[%*%4*%8l%*%7*/%*%4*%8L%* %7*=%* %1*%3p%%%*%7*]%*'
let g:StatusLines{2}='%5* %*->%7*[%*%1*%n%*%7*]%* %= %7*[%*%1*ENC%* %2*%10{strlen(&enc)?&enc:"is not set"}%*%7*]%* %7*[%*%1*FENC%* %3*%10{strlen(&fenc)?&fenc:"is not set"}%*%7*]%* %7*[%*%1*FT%* %3*%4{strlen(&ft)?&ft:"none"}%*%7*]%* %7*[%*%1*FF%* %4*%4{&ff}%*%7*]%*'
let g:StatusLinesCurrent=-1

fu! SetStatusLineColors()
	" The status bar of the active window
  hi statusline   term=inverse,bold cterm=inverse,bold gui=bold ctermfg=darkblue ctermbg=white    guifg=black guibg=cyan
	" the status bar of the inactive window
  hi statuslinenc term=inverse,bold cterm=inverse,bold gui=bold ctermfg=darkblue ctermbg=darkblue guifg=black guibg=gray

	" Colors 
  hi User1 term=inverse,bold cterm=inverse,bold gui=bold ctermfg=darkblue ctermbg=darkyellow  guifg=darkblue guibg=yellow
  hi User2 term=inverse,bold cterm=inverse,bold gui=bold ctermfg=darkblue ctermbg=darkcyan    guifg=black    guibg=darkcyan
  hi User3 term=inverse,bold cterm=inverse,bold gui=bold ctermfg=darkblue ctermbg=darkmagenta guifg=white    guibg=darkmagenta
  hi User4 term=inverse,bold cterm=inverse,bold gui=bold ctermfg=darkblue ctermbg=darkgreen   guifg=white    guibg=darkgreen
  hi User5 term=inverse,bold cterm=inverse,bold gui=bold ctermfg=darkblue ctermbg=darkblue    guifg=white    guibg=darkblue
  hi User6 term=inverse,bold cterm=inverse,bold gui=bold ctermfg=darkblue ctermbg=darkred     guifg=white    guibg=darkred
  hi User7 term=inverse,bold cterm=inverse,bold gui=bold ctermfg=darkblue ctermbg=black       guifg=white    guibg=darkgray
endf

fu! ToggleStatusLine()
  call SetStatusLineColors()
  let g:StatusLinesCurrent=g:StatusLinesCurrent+1
  if (!exists("g:StatusLines" . g:StatusLinesCurrent))
    let g:StatusLinesCurrent=0
  endif
  let &statusline=g:StatusLines{g:StatusLinesCurrent}
endf

call ToggleStatusLine()

"Notice: Next two lines do not work at all.
"Hint:   Run `stty stop ^~ ; stty start ^~' first
map  <C-S>      :call ToggleStatusLine()<CR>
imap <C-S> <C-O>:call ToggleStatusLine()<CR>

" Status Bar stuff.(above)...........................................................
"
" Fuzzy Finder stuff..
let g:FuzzyFinderOptions = { 'Base':{}, 'Buffer':{}, 'File':{}, 'Dir':{}, 'MruFile':{}, 'MruCmd':{}, 'FavFile':{}, 'Tag':{}, 'TaggedFile':{}}
let g:FuzzyFinderOptions.Base.ignore_case = 1
let g:FuzzyFinderOptions.Base.abbrev_map  = {
      \   '\C^VR' : [
      \     '$VIMRUNTIME/**',
      \     '~/.vim/**',
      \     '$VIM/.vim/**',
      \     '$VIM/vimfiles/**',
      \   ],
      \ }
let g:FuzzyFinderOptions.MruFile.max_item = 200
let g:FuzzyFinderOptions.MruCmd.max_item = 200
nnoremap <silent> <C-n>      :FuzzyFinderBuffer<CR>
nnoremap <silent> <C-m>      :FuzzyFinderFile <C-r>=expand('%:~:.')[:-1-len(expand('%:~:.:t'))]<CR><CR>
nnoremap <silent> <C-j>      :FuzzyFinderMruFile<CR>
nnoremap <silent> <C-k>      :FuzzyFinderMruCmd<CR>
nnoremap <silent> <C-p>      :FuzzyFinderDir <C-r>=expand('%:p:~')[:-1-len(expand('%:p:~:t'))]<CR><CR>
nnoremap <silent> <C-f><C-d> :FuzzyFinderDir<CR>
nnoremap <silent> <C-f><C-f> :FuzzyFinderFavFile<CR>
nnoremap <silent> <C-f><C-t> :FuzzyFinderTag!<CR>
nnoremap <silent> <C-f><C-g> :FuzzyFinderTaggedFile<CR>
noremap  <silent> g]         :FuzzyFinderTag! <C-r>=expand('<cword>')<CR><CR>
nnoremap <silent> <C-f>F     :FuzzyFinderAddFavFile<CR>
nnoremap <silent> <C-f><C-e> :FuzzyFinderEditInfo<CR>


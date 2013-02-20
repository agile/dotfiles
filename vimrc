"set noballooneval
set nocompatible
set nospell
let loaded_matchparen = 1
set nofen
set bs=2
syntax on
filetype on
filetype plugin on
filetype indent on
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
"set vb
set backupcopy=yes
set ignorecase
"set swb=split
set wildmenu
set wildmode=list:longest,full
" this will allow you to use the mouse in console mode, but at the cost of
" losing the ability to copy/paste it seems..
set mouse=a

" popup balloons
"set ballooneval

" One of my most common typos
iabbrev conifg config
iabbrev Conifg Config
iabbrev CONIFG CONFIG

"map Q to something useful
noremap Q gq
 
"make Y consistent with C and D
nnoremap Y y$

if has("gui_running")
  " default mode
  map <F1> :set gfn=<CR>:colorscheme brookstream<CR>
  " projector mode
  map <F2> :set gfn=Courier\ 10\ Pitch\ 20<CR>:colorscheme default<CR>

  " this does the pop up reference window from the rails plugin
  " set ballooneval
else
endif
colorscheme brookstream

" re https://wincent.com/blog/running-rspec-specs-from-inside-vim
function! RunSpec(command)
  if a:command == ''
    let dir = 'spec'
  else
    let dir = a:command
  endif
  "cexpr system("spec -r ~/.vim/support/vim_spec_formatter.rb -f Spec::Runner::Formatter::VimFormatter " . dir)"a:command)
  cexpr system("spec -r spec/vim_formatter.rb -f Spec::Runner::Formatter::VimFormatter " . dir)"a:command)
  cw
endfunction
command! -nargs=? -complete=file Spec call RunSpec(<q-args>)
map <leader>s :Spec<space>

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

" Fuzzy Finder stuff..
"let g:FuzzyFinderOptions = { 'Base':{}, 'Buffer':{}, 'File':{}, 'Dir':{}, 'MruFile':{}, 'MruCmd':{}, 'FavFile':{}, 'Tag':{}, 'TaggedFile':{}}
"let g:FuzzyFinderOptions.Base.ignore_case = 1
"let g:FuzzyFinderOptions.Base.abbrev_map  = {
"      \   '\C^VR' : [
"      \     '$VIMRUNTIME/**',
"      \     '~/.vim/**',
"      \     '$VIM/.vim/**',
"      \     '$VIM/vimfiles/**',
"      \   ],
"      \ }
"let g:FuzzyFinderOptions.MruFile.max_item = 200
"let g:FuzzyFinderOptions.MruCmd.max_item = 200
"nnoremap <silent> <C-n>      :FuzzyFinderBuffer<CR>
"nnoremap <silent> <C-m>      :FuzzyFinderFile <C-r>=expand('%:~:.')[:-1-len(expand('%:~:.:t'))]<CR><CR>
"nnoremap <silent> <C-j>      :FuzzyFinderMruFile<CR>
"nnoremap <silent> <C-k>      :FuzzyFinderMruCmd<CR>
"nnoremap <silent> <C-p>      :FuzzyFinderDir <C-r>=expand('%:p:~')[:-1-len(expand('%:p:~:t'))]<CR><CR>
"nnoremap <silent> <C-f><C-d> :FuzzyFinderDir<CR>
"nnoremap <silent> <C-f><C-f> :FuzzyFinderFavFile<CR>
"nnoremap <silent> <C-f><C-t> :FuzzyFinderTag!<CR>
"nnoremap <silent> <C-f><C-g> :FuzzyFinderTaggedFile<CR>
"noremap  <silent> g]         :FuzzyFinderTag! <C-r>=expand('<cword>')<CR><CR>
"nnoremap <silent> <C-f>F     :FuzzyFinderAddFavFile<CR>
"nnoremap <silent> <C-f><C-e> :FuzzyFinderEditInfo<CR>

" Status Bar
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
"set noballooneval
"

" Copy and paste short cuts
imap <C-V> <ESC>"+gPa
vmap <C-C> "+y


" Vim color file
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2001 May 21

" This color scheme uses a dark grey background.

" First remove all existing highlighting.
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "metacosm"

hi Normal ctermbg=black ctermfg=White guifg=White guibg=grey20

" Groups used in the 'highlight' and 'guicursor' options default value.
hi ErrorMsg term=standout ctermbg=DarkRed ctermfg=White guibg=Red guifg=White
hi IncSearch term=reverse cterm=reverse gui=reverse
hi ModeMsg term=bold cterm=bold gui=bold
hi StatusLine term=reverse,bold cterm=reverse,bold gui=reverse,bold
hi StatusLineNC term=reverse cterm=reverse gui=reverse
hi VertSplit term=reverse cterm=reverse gui=reverse
hi Visual term=reverse cterm=reverse gui=reverse guifg=Grey guibg=fg
hi VisualNOS term=underline,bold cterm=underline,bold gui=underline,bold
hi DiffText term=reverse cterm=bold ctermbg=Red gui=bold guibg=Red
hi Cursor guibg=Green guifg=Black
hi lCursor guibg=Cyan guifg=Black
hi Directory term=bold ctermfg=LightCyan guifg=Cyan
hi MoreMsg term=bold ctermfg=LightGreen gui=bold guifg=SeaGreen
hi NonText term=standout ctermbg=darkgrey ctermfg=black guibg=black guifg=darkgrey
hi Question term=standout ctermfg=LightGreen gui=bold guifg=Green
hi Search term=reverse ctermbg=Yellow ctermfg=Black guibg=Yellow guifg=Black
hi SpecialKey term=standout ctermbg=black ctermfg=darkgrey guibg=black guifg=darkgrey
hi Title term=bold ctermfg=LightMagenta gui=bold guifg=Magenta
hi WarningMsg term=standout ctermfg=LightRed guifg=Red
hi WildMenu term=standout ctermbg=Yellow ctermfg=Black guibg=Yellow guifg=Black
hi Folded term=standout ctermbg=darkgrey ctermfg=black guibg=black guifg=darkgrey
hi LineNr term=standout ctermbg=darkgrey ctermfg=black guibg=black guifg=darkgrey
hi FoldColumn term=standout ctermbg=LightGrey ctermfg=DarkBlue guibg=Grey guifg=DarkBlue
hi DiffAdd term=bold ctermbg=DarkBlue guibg=DarkBlue
hi DiffChange term=bold ctermbg=DarkMagenta guibg=DarkMagenta
hi DiffDelete term=bold ctermfg=Blue ctermbg=DarkCyan gui=bold guifg=Blue guibg=DarkCyan

" Groups for syntax highlighting
hi Constant term=underline ctermfg=Magenta guifg=#ffa0a0 guibg=grey5
hi Special term=bold ctermfg=LightRed guifg=Orange guibg=grey5
if &t_Co > 8
  hi Statement term=bold cterm=bold ctermfg=Yellow guifg=#ffff60 gui=bold
endif
hi Ignore ctermfg=darkgrey guifg=grey20

" vim: sw=2

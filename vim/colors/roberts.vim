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

let colors_name = "roberts"

hi Normal guifg=black guibg=lightgrey

" Groups used in the 'highlight' and 'guicursor' options default value.
hi ErrorMsg guibg=Red guifg=black
hi IncSearch gui=reverse
hi ModeMsg gui=bold
hi StatusLine gui=reverse,bold
hi StatusLineNC gui=reverse
hi VertSplit gui=reverse
hi Visual guifg=yellow guibg=fg
hi VisualNOS gui=underline,bold
hi DiffText gui=bold guibg=Red
hi Cursor guibg=Green guifg=Black
hi lCursor guibg=Cyan guifg=Black
hi Directory guifg=Cyan
hi LineNr guifg=white guibg=darkgrey
hi MoreMsg gui=bold guifg=SeaGreen
hi NonText gui=bold guifg=LightBlue guibg=darkgrey
hi Question gui=bold guifg=Green
hi Search guibg=Yellow guifg=Black
hi SpecialKey guifg=Orange
hi Title gui=bold guifg=Magenta
hi WarningMsg ctermfg=LightRed guifg=Red
hi WildMenu guibg=Yellow guifg=Black
hi Folded guibg=LightGrey guifg=DarkBlue
hi FoldColumn guibg=Grey guifg=DarkBlue
hi DiffAdd guibg=DarkBlue
hi DiffChange guibg=DarkMagenta
hi DiffDelete gui=bold guifg=Blue guibg=DarkCyan

" Groups for syntax highlighting
hi Constant guifg=black guibg=grey
hi Special guifg=orange guibg=grey
if &t_Co > 8
    hi Statement guifg=black gui=bold
endif
hi Ignore guifg=black
hi Comment guifg=blue
hi Identifier guifg=blue gui=bold

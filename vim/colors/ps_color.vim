" Vim colour file
" Maintainer:	Pan Shizhu <dicpan@hotmail.com>
" Last Change:	8 April 2004
" Version:	2.0
"
"	Please choose good title when writing e-mail to me, or it will be
"	automatically treated as spam and removed. 
"
"	There've been great enhancement since this version, so I'd choose to
"	bump the version number to 2. This version comes with Vim online help,
"	if you had installed ps_color.txt, you can see for details in :h
"	pscolor

" The Initialization:
"
if !exists("g:psc_style")
  let psc_style = 'cool'
endif
if !exists("g:psc_fontface")
  let psc_fontface = 'plain'
endif
if !exists("g:psc_inversed_todo")
  let psc_inversed_todo = 0
endif
if !exists("g:psc_use_default_for_cterm")
  let psc_use_default_for_cterm = 0
endif
if exists("statement_different_from_type") " This is for backward compatibility
  let psc_statement_different_from_type = 1
elseif !exists("g:psc_statement_different_from_type")
  let psc_statement_different_from_type = 0
endif

if !has("gui_running")
  if psc_style=='warm'
    let psc_style = 'cool'	" Forces 'cool' style when gui is not present
                                " Since the 'warm' style for terminal is still
                                " under construction.
  endif
  if psc_use_default_for_cterm==1
    let psc_style = 'default'
  elseif psc_use_default_for_cterm==2
    let psc_style = 'defdark'
  endif
endif

let s:other_style = 0
if psc_style=='warm'
  set background=light
elseif psc_style=='cool'
  set background=dark
elseif psc_style=='default'
  set background=light
elseif psc_style=='defdark'
  set background=dark
else
  let s:other_style = 1
  execute "runtime colors/".psc_style.".vim"
endif

if s:other_style==0
  hi clear

  if exists("syntax_on")
    syntax reset
  endif
  " PS means: PostScript, PhotoShop, PerSonal, .. or anything you can imagine
  let g:colors_name = 'ps_color'
endif

" Hardcoded Colours Comment:
" #aabbcc = Red aa, Green bb, Blue cc
" we must use hard-coded colours to get more 'tender' colours
"
" Grey Scales :
" #b0b0b0 = Grey 11/16	#d0d0d0 = Grey 13/16	#e0e0e0 = Grey 7/8 (=14/16)
" #404040 = Grey 1/4	#808080 = Grey 1/2	Black	= Grey 0
"
" Red & Magenta Scales:
" #800000 = Blood Red	#e0c060 = Tender Orange	#f08060 = Bright Red
" #f0c0f0 = Tender Pink	#800080 = Purple
"
" Green & Yellow Scales:
" #00f000 = Cursor	#d0d090 = Rice Yellow	#c0e080 = Tree Green
" #60f080 = Bright Green
"
" Blue & Cyan Scales:
" #80c0e0 = Sea Blue	#6080f0 = Gem Blue	#000080 = Indigo Blue
" #a6caf0 = Sky Cyan	#b0d0f0 = Bright Cyan	#c0d8f8 = Br. Cyan Variant
"


" GUI:
"
if psc_style=='warm'
  highlight Normal		guifg=Black	guibg=#d0d0d0
  highlight Search		guifg=#902000	guibg=#e0e0e0
  highlight Visual		guifg=Black	guibg=#a6caf0
  highlight Cursor		guifg=#e0e0e0	guibg=#008000
  " The idea of CursorIM is pretty good, however, the feature is buggy in
  " the current version (Vim 6.2)
  " highlight CursorIM		guifg=#e0e0e0	guibg=#800080
  highlight Special		guifg=#806000	guibg=#d0d0d0
  highlight Comment		guifg=#505000	guibg=#d0d0d0
  highlight Number		guifg=#806000	guibg=#d0d0d0
  highlight Constant		guifg=#006860	guibg=#d0d0d0
  highlight String		guifg=#006860	guibg=#d0d0d0
  highlight StatusLine		guifg=Black	guibg=#a6caf0
  highlight LineNr		guifg=#202020	guibg=#d0d0d0
  highlight Question		guifg=Black	guibg=#d0d090
  highlight PreProc		guifg=#008020	guibg=#d0d0d0
  if psc_statement_different_from_type==1
    highlight Statement		guifg=#002090	guibg=#d0d0d0
  else
    highlight Statement		guifg=#205898	guibg=#d0d0d0
  endif
  highlight Type		guifg=#105090	guibg=#d0d0d0
  if psc_inversed_todo==1
    highlight Todo		guifg=#d0d090	guibg=#000080
  else
    highlight Todo		guifg=#800000	guibg=#d0d090
  endif
  " NOTE THIS IS IN THE WARM SECTION
  highlight Error		guifg=#902000	guibg=#d0d0d0
  highlight Identifier		guifg=#903090	guibg=#d0d0d0
  highlight ModeMsg		guifg=Black	guibg=#b0b0e0
  highlight VisualNOS		guifg=Black	guibg=#b0b0e0

  highlight SpecialKey		guifg=#105090	guibg=#d0d0d0
  highlight NonText		guifg=#002090	guibg=#d0d0d0
  highlight Directory		guifg=#105090	guibg=#d0d0d0
  highlight ErrorMsg		guifg=Black	guibg=#f0b090
  highlight MoreMsg		guifg=#408000	guibg=#d0d0d0
  highlight Title		guifg=#903090	guibg=#d0d0d0
  highlight WarningMsg		guifg=#902000	guibg=#d0d0d0
  highlight WildMenu		guifg=Black	guibg=#d0d090
  highlight Folded		guifg=Black	guibg=#b0e0b0
  highlight FoldColumn		guifg=Black	guibg=#90e090
  highlight DiffAdd				guibg=#b0b0e0
  highlight DiffChange			guibg=#e0b0e0
  highlight DiffDelete		guifg=#206080	guibg=#b0b0b0
  highlight DiffText		guifg=Black	guibg=#c0e080
  " These three 'gui=NONE' shields gui=reverse
  highlight IncSearch		guifg=Black	guibg=#f0e0e0	gui=NONE
  highlight StatusLineNC	guifg=Black	guibg=#b0b0b0	gui=NONE
  highlight VertSplit		guifg=Black	guibg=#b0b0b0	gui=NONE

elseif psc_style=='cool'
  " ------------------------------------------------------------------------

  highlight Normal		guifg=#d0d0d0	guibg=Black
  highlight Search		guifg=#e0e0e0	guibg=#800000
  highlight Visual		guifg=Black	guibg=#a6caf0
  highlight Cursor		guifg=Black	guibg=#00f000
  " highlight CursorIM		guifg=Black	guibg=#f000f0
  highlight Special		guifg=#e0c060
  highlight Comment		guifg=#d0d090
  highlight Constant		guifg=#80c0e0
  highlight Number		guifg=#e0c060
  highlight String		guifg=#80c0e0
  highlight StatusLine		guifg=Black	guibg=#a6caf0
  highlight LineNr		guifg=#b0b0b0
  highlight Question		guifg=Black	guibg=#d0d090
  highlight PreProc		guifg=#60f080
  if psc_statement_different_from_type==1
    highlight Statement		guifg=#60b0f0
  else
    highlight Statement		guifg=#c0d8f8
  endif
  highlight Type		guifg=#b0d0f0
  if psc_inversed_todo==0
    highlight Todo		guifg=#800000	guibg=#d0d090
  else
    highlight Todo		guifg=#d0d090	guibg=#000080
  endif
  " NOTE THIS IS IN THE COOL SECTION
  highlight Error		guifg=#f08060	guibg=Black
  highlight Identifier		guifg=#f0c0f0	guibg=Black
  highlight ModeMsg		guifg=#d0d0d0	guibg=#000080
  highlight VisualNOS		guifg=#d0d0d0	guibg=#000080
  highlight SpecialKey		guifg=#b0d0f0
  highlight NonText		guifg=#6080f0
  highlight Directory		guifg=#b0d0f0
  highlight ErrorMsg		guifg=#d0d090	guibg=#800000
  highlight MoreMsg		guifg=#c0e080
  highlight Title		guifg=#f0c0f0
  highlight WarningMsg		guifg=#f08060
  highlight WildMenu		guifg=Black	guibg=#d0d090
  highlight Folded		guifg=#d0d0d0	guibg=#004000
  highlight FoldColumn		guifg=#e0e0e0	guibg=#008000
  highlight DiffAdd				guibg=#000080
  highlight DiffChange				guibg=#800080
  highlight DiffDelete		guifg=#80c0e0	guibg=#404040
  highlight DiffText		guifg=Black	guibg=#c0e080
  " for IncSearch, StatusLineNC, VertSplit, defaults are used.
elseif psc_style=='defdark'
  highlight Normal		guifg=#d0d0d0	guibg=Black
endif

" Take NT gui for example, If you want to use a console font such as
" Lusida_Console with font size larger than 14, the font looks already thick,
" and the bold font for that will be too thick, you may not want it be bolded,
" in this case this colour scheme will suit your taste.
"
" I disabled all of the bold font for the same reason: continuously switching
" between bold and plain font hurts consistency and will inevitably fatigue
" your eye!
if psc_fontface=="plain"
  highlight Normal		gui=NONE
  highlight Search		gui=NONE
  highlight Visual		gui=NONE
  highlight Cursor		gui=NONE
  highlight Special		gui=NONE
  highlight Comment		gui=NONE
  highlight Constant		gui=NONE
  highlight Number		gui=NONE
  highlight String		gui=NONE
  highlight StatusLine		gui=NONE
  highlight LineNr		gui=NONE
  highlight Question		gui=NONE
  highlight PreProc		gui=NONE
  highlight Statement		gui=NONE
  highlight Type		gui=NONE
  highlight Todo		gui=NONE
  highlight Error		gui=NONE
  highlight Identifier		gui=NONE
  highlight ModeMsg		gui=NONE
  highlight VisualNOS		gui=NONE
  highlight SpecialKey		gui=NONE
  highlight NonText		gui=NONE
  highlight Directory		gui=NONE
  highlight ErrorMsg		gui=NONE
  highlight MoreMsg		gui=NONE
  highlight Title		gui=NONE
  highlight WarningMsg		gui=NONE
  highlight WildMenu		gui=NONE
  highlight Folded		gui=NONE
  highlight FoldColumn		gui=NONE
  highlight DiffAdd		gui=NONE
  highlight DiffChange		gui=NONE
  highlight DiffDelete		gui=NONE
  highlight DiffText		gui=NONE
endif

" Color Term:

if psc_style=='cool'
  " 16-colour terminal support
  if &t_Co==16
    highlight Normal     ctermfg=LightGrey  ctermbg=Black
    highlight Search     ctermfg=White	    ctermbg=DarkRed
    highlight Visual     ctermfg=Black	    ctermbg=Cyan
    highlight Cursor     ctermfg=Black	    ctermbg=Green
    highlight Special    ctermfg=Brown	    ctermbg=Black
    highlight Comment    ctermfg=Yellow	    ctermbg=Black
    highlight Constant   ctermfg=Blue	    ctermbg=Black
    highlight Number     ctermfg=Brown	    ctermbg=Black
    highlight String     ctermfg=Blue	    ctermbg=Black
    highlight StatusLine ctermfg=DarkBlue   ctermbg=White
    highlight LineNr     ctermfg=DarkGrey   ctermbg=Black
    highlight Question   ctermfg=Black	    ctermbg=Cyan
    highlight PreProc    ctermfg=Green	    ctermbg=Black
    highlight Statement  ctermfg=Cyan	    ctermbg=Black
    highlight Type       ctermfg=Cyan	    ctermbg=Black
    if psc_inversed_todo==0
        highlight Todo   ctermfg=DarkRed    ctermbg=Yellow
    else
        highlight Todo   ctermfg=Yellow	    ctermbg=Blue
    endif
    highlight Error      ctermfg=Red	    ctermbg=Black
    highlight Identifier ctermfg=Magenta    ctermbg=Black
    highlight Folded     ctermfg=White	    ctermbg=Green

    if psc_fontface=="plain"
      highlight Normal		cterm=none
      highlight Search		cterm=none
      highlight Visual		cterm=none
      highlight Cursor		cterm=none
      highlight Special		cterm=none
      highlight Comment		cterm=none
      highlight Constant	cterm=none
      highlight Number		cterm=none
      highlight String		cterm=none
      highlight StatusLine	cterm=none
      highlight LineNr		cterm=none
      highlight Question	cterm=none
      highlight PreProc		cterm=none
      highlight Statement	cterm=none
      highlight Type		cterm=none
      highlight Todo		cterm=none
      highlight Error		cterm=none
      highlight Identifier	cterm=none
      highlight Folded		cterm=none
    endif

  else
    " 8 colour terminal support, this assumes 16 colour is available through
    " setting the 'bold' attribute, (will get bright forground colour)
    " if your terminal supports 16 colours, please manually set t_Co=16 in
    " your .vimrc
    highlight Normal     ctermfg=LightGrey  ctermbg=Black	cterm=none
    highlight Search     ctermfg=White	    ctermbg=DarkRed	cterm=bold
    highlight Visual     ctermfg=Grey	    ctermbg=Black	cterm=reverse
    highlight Cursor     ctermfg=Black	    ctermbg=Green	cterm=none
    highlight Special    ctermfg=Brown	    ctermbg=Black	cterm=none
    highlight Comment    ctermfg=Yellow	    ctermbg=Black	cterm=bold
    highlight Constant   ctermfg=Blue	    ctermbg=Black	cterm=bold
    highlight Number     ctermfg=Brown	    ctermbg=Black	cterm=none
    highlight String     ctermfg=Blue	    ctermbg=Black	cterm=bold
    highlight StatusLine ctermfg=DarkBlue   ctermbg=White	cterm=none
    highlight LineNr     ctermfg=DarkGrey   ctermbg=Black	cterm=bold
    highlight Question   ctermfg=Black	    ctermbg=Cyan	cterm=none
    highlight PreProc    ctermfg=Green	    ctermbg=Black	cterm=bold
    highlight Statement  ctermfg=Cyan	    ctermbg=Black	cterm=bold
    highlight Type       ctermfg=Cyan	    ctermbg=Black	cterm=bold
    if psc_inversed_todo==0
        highlight Todo   ctermfg=DarkRed    ctermbg=Yellow	cterm=none
    else
        highlight Todo   ctermfg=Yellow	    ctermbg=Blue	cterm=bold
    endif
    highlight Error      ctermfg=Red	    ctermbg=Black	cterm=bold
    highlight Identifier ctermfg=Magenta    ctermbg=Black	cterm=bold
    highlight Folded     ctermfg=White	    ctermbg=Green	cterm=none
  endif
endif


" Term:
" For console with only 4 colours (term, not cterm), we'll use the default.
" ...
" The default colorscheme is good enough for terms with no more than 4 colours
"



" Links:
" Character must be different from strings because in many languages
" (especially C, C++) a 'char' variable is scalar while 'string' is pointer,
" mistaken a 'char' for a 'string' will cause disaster!
if (psc_style=='cool') || (psc_style == 'warm')
  hi link		Character	Number
  hi link		SpecialChar	LineNr
  " Warning is not a standard hi link, it is used by DrChip's EngSpChk
  hi link		Warning		MoreMsg
endif



" vim:et:nosta:sw=2:ts=8:

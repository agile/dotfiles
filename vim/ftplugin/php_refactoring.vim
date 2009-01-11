" Refactoring tools (php)
" --------------------------------------------------
" Extract Method (still needs some loving)

vmap \em :call ExtractMethod()<cr>
function! ExtractMethod() range
let name = inputdialog("Name of new method:")
'<
exe "normal O\<bs>private function " . name ."()\<cr>{\<esc>"
'>
exe "normal oreturn ;\<cr>}\<esc>k"
s/return/\/\/ return/ge
normal j%
normal kf(
exe "normal yyPi// = \<esc>wdwA;\<esc>"
normal ==
normal j0w
endfunction

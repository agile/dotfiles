" svn commit diff in a window next to commit message
"
" Would be quite the awesome, but the final 2 commands don't happen
" They should switch back the svn log message jump to the top and inter insert mode

if !exists("g:loaded_svn_commit_goodness")
  let g:loaded_svn_commit_goodness = "yep"

  autocmd BufReadPost svn-commit*.tmp
  			\ exe "vnew" |
  			\ exe "set bt=nofile ft=diff" |
  			\ exe "silent r! svn diff" |
  			\ exe "normal gg" |
  			\ exe "normal :wincmd w" |
  			\ exe "normal ggi"
endif

if !exists("g:loaded_git_commit_goodness")
  let g:loaded_git_commit_goodness = "yep"

  autocmd BufReadPost COMMIT_EDITMSG
  			\ exe "vnew" |
  			\ exe "set bt=nofile ft=diff" |
  			\ exe "silent r! git diff --cached" |
  			\ exe "normal gg" |
  			\ exe "normal :wincmd w" |
  			\ exe "normal ggi"
endif

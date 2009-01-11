" php_check_syntax.vim -- Check php syntax when saving or reading a file
" @Author:      Thomas Link (samul@web.de)
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     04-Mai-2005.
" @Last Change: 04-Mai-2005.
" @Revision:    0.2.21-agile
if !exists("g:php_check_syntax")
	let g:php_check_syntax = 1

	if !exists("g:php_check_syntax_cmd")
  	  let g:php_check_syntax_cmd='php5 -l'
	endif

	function! PhpSyntaxCheck()
	    if &filetype == 'php'
	        let t  = @t
	        let mp = &makeprg
	        " let sp = &shellpipe
	        let ef = &errorformat
	        try
	            let &makeprg = g:php_check_syntax_cmd
	            " set shellpipe=> 				
	            " set errorformat=<b>%*[^<]</b>:\ \ %m\ in\ <b>%f</b>\ on\ line\ <b>%l</b><br\ />
	            set errorformat=%EParse\ error\:\ %m\ in\ %f\ on\ line\ %l
	            silent make %
	            redir @t
	            silent clist
	            redir END
	            if @t =~ 'No syntax errors detected in '
	                cclose
	            else
	                copen
	            endif
	        finally
	            let @t = t
	            let &makeprg     = mp
	            " let &shellpipe   = sp
	            let &errorformat = ef
	        endtry
	    endif
	endf
	
	noremap <buffer> <C-F5> :call PhpSyntaxCheck()<cr>
	inoremap <buffer> <C-F5> <esc>:call PhpSyntaxCheck()<cr> 
	"autocmd BufRead,BufWritePost *.php call PhpSyntaxCheck()
	autocmd BufWritePost *.php call PhpSyntaxCheck()
endif



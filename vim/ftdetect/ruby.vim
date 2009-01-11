" Ruby
au BufNewFile,BufRead *.rb,*.rbw,*.gem,*.gemspec	:compiler ruby |set ft=ruby|so /home/mike/.vim/ftplugin/ri.vim
"au BufWritePost *.rb let t=@t|:!ruby -c %|redir @t|silent clist|redir END| if @t =~ 'Syntax OK' cclose else copen endif let @t=t
au BufWritePost *.rb !ruby -c %

" Tests
au BufNewFile,BufRead *_test.rb		compiler rubyunit |set ft=ruby
au BufNewFile,BufRead *_spec.rb 	compiler rubyspec |set ft=ruby

" Ruby on Rails
au BufNewFile,BufRead *.builder,*.rxml,*.rjs		set filetype=ruby

" doing it without the silent will allow you to see all the output, a little noisier
"au BufWritePost */unit/*_test.rb :make test_units |silent clist|copen
"au BufWritePost */functional/*_test.rb :make test_functional |silent clist|copen
au BufWritePost */unit/*_test.rb :make % |silent clist|copen
au BufWritePost */functional/*_test.rb :make % |silent clist|copen
au BufWritePost */test/*test*.rb :make % |silent clist|copen

"au BufWritePost *_spec.rb !spec %
"au BufWritePost *_spec.rb :silent make % |silent clist|copen
"au BufWritePost *_spec.rb :set makeprg=spec|:make % |silent clist|copen

" Rakefile
au BufNewFile,BufRead [rR]akefile,*.rake		set filetype=ruby

" eRuby
au BufNewFile,BufRead *.erb,*.rhtml			:compiler eruby |set filetype=eruby


au BufRead,BufNewFile /etc/nginx/*conf set ft=nginx 
au BufRead,BufNewFile /etc/nginx/conf/* set ft=nginx 
au BufRead,BufNewFile /etc/nginx/sites*/* set ft=nginx 
au BufWritePost /etc/nginx/*,/etc/nginx/sites*/* !nginxcheck %

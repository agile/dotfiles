" Setup for the TagList plugin (http://www.geocities.com/yegappan/taglist)
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
" uncomment line below to automatically open the ctags panel
"let Tlist_Auto_Open = 1 

" The completion dictionary is provided by Rasmus: http://lerdorf.com/funclist.txt
set dictionary-=/home/mike/bin/funclist.txt dictionary+=/home/mike/bin/funclist.txt
" Use the dictionary completion
set complete-=k complete+=k

" Automatic close char mapping
"inoremap  { {<CR>}<C-O>O
"inoremap [ []<LEFT>
"inoremap ( ()<LEFT>
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>

if has("autocmd")
    autocmd BufNewFile,Bufread *.php,*.php3,*.php4,*.inc set keywordprg="help"
endif


" Map <CTRL>-C .. B to run php lint check 
map <C-B> :!php5 -l %<CR>
map <C-P> :!pear package<CR>

" Templates
" --------------------------------------------
" require, require_once
map! =req /**<CR> *  <CR>*  <CR>*  <CR>* @since  <CR>*/<CR><LEFT>require '<RIGHT>;<LEFT><Left>
map! =roq /**<CR> *  <CR>*  <CR>*  <CR>* @since  <CR>*/<CR><LEFT>require_once '<RIGHT>;<LEFT><Left>

" include, include_once
map! =inc /**<CR> *  <CR>*  <CR>*  <CR>* @since  <CR>*/<CR><LEFT>include '<RIGHT>;<Left><Left>
map! =ioc /**<CR> *  <CR>*  <CR>*  <CR>* @since  <CR>*/<CR><LEFT>include_once '<Right>;<Left><Left>

" define
map! =def /**<CR> *  <CR>*  <CR>*  <CR>* @since  <CR>* @access public<CR>*/<CR><LEFT>define ('<Right>, '<Right><Right>;<ESC>?',<CR>i

" class
map! =cla /**<CR> *  <CR>*  <CR>*  <CR>* @since  <CR>*/<CR><LEFT>class  {<CR><ESC>?/\*\*<CR>/ \* <CR>$i

" public/private methods
map! =puf /**<CR> *  <CR>*  <CR>*  <CR>* @since  <CR>* @access public<CR>* @param  <CR>* @return void<CR>*/<CR><LEFT>public function  (<Right><CR>{<CR><ESC>?/\*\*<CR>/ \* <CR>$i
map! =prf /**<CR> *  <CR>*  <CR>*  <CR>* @since  <CR>* @access private<CR>* @param  <CR>* @return void<CR>*/<CR><LEFT>private function _ (<Right><CR>{<CR><ESC>?/\*\*<CR>/ \* <CR>$i

" public/private attributes
map! =pua /**<CR> *  <CR>*  <CR>* @var <CR>* @since  <CR>*/<CR><LEFT>public $ = ;<ESC>?/\*\*<CR>/ \* <CR>$i
map! =pra /**<CR> *  <CR>*  <CR>* @var <CR>* @since  <CR>*/<CR><LEFT>private $_ = ;<ESC>?/\*\*<CR>/ \* <CR>$i

" for loop
map! =for for ($i = 0; $i ; $i++<Right> {<Up><Up><ESC>/ ;<CR>i

" foreach loop
map! =foe foreach ($ as $ => $<Right> {<Up><xHome><ESC>/\ as<CR>i

" while loop
map! =whi while ( <Right> {<Up><Up><ESC>/ )<CR>i

" switch statement
map! =swi switch ($<Right> {<CR>case '<Right>:<CR><CR>break;<CR>default:<CR><CR>break;<Up><Up><Up><Up><Up><Up><Up><xHome><ESC>/)<CR>i

" alternative
map! =if if (<Right> {<Down><xEnd> else {<Up><Up><Up><Up><Up><Up><ESC>/)<CR>i

" Mappings for close char mapping disabled

" require, require_once
"map! =req /**<CR> *  <CR>*  <CR>*  <CR>* @since  <CR>*/<CR><LEFT>require '';<ESC>hi
"map! =roq /**<CR> *  <CR>*  <CR>*  <CR>* @since  <CR>*/<CR><LEFT>require_once '';<ESC>hi

" include, include_once
"map! =inc /**<CR> *  <CR>*  <CR>*  <CR>* @since  <CR>*/<CR><LEFT>include '';<ESC>hi
"map! =ioc /**<CR> *  <CR>*  <CR>*  <CR>* @since  <CR>*/<CR><LEFT>include_once '';<ESC>hi

" define
"map! =def /**<CR> *  <CR>*  <CR>*  <CR>* @since  <CR>* @access public<CR>*/<CR><LEFT>define ('', '');<ESC>?',<CR>i

" class
"map! =cla /**<CR> *  <CR>*  <CR>*  <CR>* @since  <CR>*/<CR><LEFT>class  {<CR><CR>}<CR><ESC>?/\*\*<CR>/ \* <CR>$i

" public/private methods
"map! =puf /**<CR> *  <CR>*  <CR>*  <CR>* @since  <CR>* @access public<CR>* @param  <CR>* @return void<CR>*/<CR><LEFT>public function  ()<CR>{<CR><CR>}<CR><ESC>?/\*\*<CR>/ \* <CR>$i
"map! =prf /**<CR> *  <CR>*  <CR>*  <CR>* @since  <CR>* @access private<CR>* @param  <CR>* @return void<CR>*/<CR><LEFT>private function _ ()<CR>{<CR><CR>}<CR><ESC>?/\*\*<CR>/ \* <CR>$i

" public/private attributes
"map! =pua /**<CR> *  <CR>*  <CR>* @var <CR>* @since  <CR>*/<CR><LEFT>public $ = ;<ESC>?/\*\*<CR>/ \* <CR>$i
"map! =pra /**<CR> *  <CR>*  <CR>* @var <CR>* @since  <CR>*/<CR><LEFT>private $_ = ;<ESC>?/\*\*<CR>/ \* <CR>$i

" for loop
"map! =for for ($i = 0; $i ; $i++) {<CR><CR>}<Up><Up><ESC>/ ;<CR>i

" foreach loop
"map! =foe foreach ($ as $ => $) {<CR><CR>}<Up>

" while loop
"map! =whi while ( ) {<CR><CR>}<Up><Up><ESC>/ )<CR>i

" switch statement
"map! =swi switch ($) {<CR>case '':<CR><CR>break;<CR>default:<CR><CR>break;<CR>}<Up><Up><Up><Up><Up><Up><Up><ESC>/)<CR>i

" alternative
"map! =if if () {<CR><CR>} else {<CR><CR>}<Up><Up><Up><Up><Up><Up><ESC>/)<CR>i


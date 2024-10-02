set nocompatible 			" be iMproved, required
set relativenumber
set ts=4 sw=4
set breakindent 
filetype on 				" required 

" plugins via vim-plug 
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'lervag/vimtex'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips'
call plug#end()

" colorscheme of editor
colorscheme gruvbox 


" link python3 
let g:python3_host_prog = '/opt/anaconda3/bin/python3'

" setup for latex & vimtex 
let g:tex_flavor = 'latex' 
let g:vimtex_quickfix_mode = 0  	" suppress quickfix window (:copen to manually open)

let g:vimtex_delim_toggle_mod_list = [
	\['\left', '\right'],
	\['\bigl', '\bigr'],
	\['\Bigl', '\Bigr'],
	\['\biggl', '\biggr'],
	\['\Biggl', '\Biggr']
	\]

" setup UltiSnips 
let g:UltiSnipsExpandTrigger       = '<Tab>'    " use Tab to expand snippets
let g:UltiSnipsJumpForwardTrigger  = '<Tab>'    " use Tab to move forward through tabstops
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'  " use Shift-Tab to move backward through tabstops
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']  



" simple skim setup 
let g:vimtex_view_method = 'skim' 	" Choose which program to use to view PDF file

" let g:vimtex_view_skim_sync = 1 	" Value 1 allows forward search after every successful compilation
" let g:vimtex_view_skim_activate = 1 	" Value 1 allows change focus to skim after command `:VimtexView` is given
nmap <localleader>v <plug>(vimtex-view)

" this resolves refocusing to editor after reverse select in skim 
function! s:TexFocusVim() abort
  " Replace `TERMINAL` with the name of your terminal application
  " Example: execute "!open -a iTerm"  
  " Example: execute "!open -a Alacritty"
  silent execute "!open -a Alacritty"
  redraw!
endfunction
augroup vimtex_event_focus
  au!
  au User VimtexEventViewReverse call s:TexFocusVim()
augroup END


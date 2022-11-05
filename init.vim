
call plug#begin()

Plug 'SirVer/ultisnips'
Plug 'fatih/vim-go'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'

call plug#end()

augroup vimrc_autocmds
  autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#111111
  autocmd BufEnter * match OverLength /\%78v.*/
augroup END
 
set relativenumber
set path+=**
set termguicolors
set colorcolumn=80
colorscheme slate

" Tabs = 4 spaces
" set tabstop=4
" set softtabstop=0 noexpandtab
" set shiftwidth=4

source /usr/share/doc/fzf/examples/fzf.vim
map <leader>fz :FZF<cr>

" So we can scroll a buffer
set mouse=a 
if !has('nvim')
  set ttymouse=sgr
endif
set textwidth=79


" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" Shortcuts for vim-go
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>i <Plug>(go-info)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>tf <Plug>(go-test-func)
autocmd FileType go nmap <leader>d <Plug>(go-def)
autocmd FileType go nmap <leader>c <Plug>(go-callers)

" Debugging
autocmd FileType go nmap <leader>dt :GoDebugTest<cr>
autocmd FileType go nmap <leader>dc :GoDebugContinue<cr>
autocmd FileType go nmap <leader>da :GoDebugStart<cr>
autocmd FileType go nmap <leader>ds :GoDebugStop<cr>
autocmd FileType go nmap <leader>do :GoDebugStepOut<cr>
autocmd FileType go nmap <leader>de :GoDebugStep<cr>
autocmd FileType go nmap <leader>dn :GoDebugNext<cr>
autocmd FileType go nmap <leader>db :GoDebugBreakpoint<cr>

autocmd FileType go nmap <leader>gr :GoRename<cr>

autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>


" Navigate errors with Ctrl-n and m
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>


let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1

" ultisnips shortcuts
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

let mapleader = ","



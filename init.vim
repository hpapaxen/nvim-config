
call plug#begin()

Plug 'SirVer/ultisnips'
Plug 'fatih/vim-go'

Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'wfxr/minimap.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'

Plug 'jayli/vim-easycomplete'

call plug#end()

" fzf
set rtp+=/usr/local/opt/fzf

" augroup vimrc_autocmds
"   autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#111111
"   autocmd BufEnter * match OverLength /\%78v.*/
" augroup END
  
set relativenumber
set path+=**
set termguicolors
set colorcolumn=80
colorscheme solarized8_light_high

" Tabs = 4 spaces
" set tabstop=4
" set softtabstop=0 noexpandtab
" set shiftwidth=4

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

" vim-go config
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_metalinter_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1
let g:go_auto_type_info = 1
" let g:go_auto_sameids = 1


" general shortcuts
nnoremap <leader>u :ls<cr>:b<space>

" Shortcuts for vim-go
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>i <Plug>(go-info)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>tf <Plug>(go-test-func)
autocmd FileType go nmap <leader>d <Plug>(go-def)
autocmd FileType go nmap <leader>c <Plug>(go-callers)
autocmd FileType go nmap <leader>gr :GoRename<cr>

autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

" Debugging
autocmd FileType go nmap <leader>dt :GoDebugTest<cr>
autocmd FileType go nmap <leader>dc :GoDebugContinue<cr>
autocmd FileType go nmap <leader>da :GoDebugStart<cr>
autocmd FileType go nmap <leader>ds :GoDebugStop<cr>
autocmd FileType go nmap <leader>do :GoDebugStepOut<cr>
autocmd FileType go nmap <leader>de :GoDebugStep<cr>
autocmd FileType go nmap <leader>dn :GoDebugNext<cr>
autocmd FileType go nmap <leader>db :GoDebugBreakpoint<cr>


" Navigate errors with Ctrl-n and m
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" ultisnips shortcuts
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

let mapleader = ","


" minimap
" let g:minimap_auto_start = 1
" let g:minimap_auto_start_win_enter = 1
let g:minimap_width = 10
let g:minimap_git_colors = 1
let g:minimap_highlight_range = 1
let g:minimap_enable_highlight_colorgroup = 1

" vim-airline
let g:airline#extensions#tabline#enabled = 1


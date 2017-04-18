let g:grammarous#use_vim_spelllang = 1
nnoremap <F4> :GrammarousCheck<CR>

autocmd BufEnter *.latex set spell spelllang=en_us

nmap <buffer><C-i> <Plug>(grammarous-open-info-window)

let g:grammarous#hooks = {}
function! g:grammarous#hooks.on_check(errs) abort
    nmap <buffer><C-n> <Plug>(grammarous-move-to-next-error)
    nmap <buffer><M-n> <Plug>(grammarous-move-to-previous-error)
    nmap <buffer><M-f> <Plug>(grammarous-fixit)
    nmap <buffer><C-M-r> <Plug>(grammarous-reset)
endfunction

function! g:grammarous#hooks.on_reset(errs) abort
    nunmap <buffer><C-n>
    nunmap <buffer><M-n>
    nunmap <buffer><M-f>
    nunmap <buffer><C-M-r>
endfunction

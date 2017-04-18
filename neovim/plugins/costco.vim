" use for css and javascript
autocmd FileType javascript,css
      \nnoremap <silent> <Leader>; :call cosco#commaOrSemiColon()<CR>
autocmd FileType javascript,css
      \inoremap <silent> <Leader>; <c-o>:call cosco#commaOrSemiColon()<CR>

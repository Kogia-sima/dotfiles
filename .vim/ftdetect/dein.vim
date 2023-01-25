function! s:CheckPath() abort
  let l:path = expand('%:p')
  if match(l:path, 'dein/[a-zA-Z0-9_]\+\.toml$') != -1
    setlocal ft=dein
  endif
endfunction

autocmd BufNewFile,BufRead *.toml call s:CheckPath()

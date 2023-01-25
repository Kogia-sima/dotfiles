function! s:CheckPath() abort
  let l:path = expand('%:h:t')
  if empty(&filetype) && l:path == 'bin'
    setf sh
  endif
endfunction

autocmd BufNewFile,BufRead * call s:CheckPath()
autocmd BufNewFile,BufRead .envrc setfiletype sh

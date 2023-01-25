" Detect @flow marker in Javascript file and set filetype as flow

function! s:CheckFlowMarker()
  let s:marker_patterns = ['//\s*@flow\%(\s\+[a-z-]\+\)\?\s*$', '/\*\s*@flow\%(\s\+[a-z-]\+\)\?\s*\*/']
  for lnum in range(1, 10)
    let l:line = getline(lnum)
    for marker in s:marker_patterns
      if match(l:line, marker) != -1
        setlocal filetype=flow
        return
      endif
    endfor
  endfor
  setlocal filetype=javascript
endfunction

autocmd! BufRead *.js
autocmd! BufRead *.javascript
autocmd BufReadPost *.js,*.javascript,*.es,*.jsx,*.mjs call s:CheckFlowMarker()
autocmd BufNewFile,BufRead *.flow setf flow

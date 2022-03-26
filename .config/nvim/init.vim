let g:python3_host_prog='/usr/bin/python3'

source ~/.vimrc

set inccommand=nosplit
set fcs=eob:\  " hide end of buffer
tmap <C-l> <C-w>

tnoremap <Esc> <C-\><C-n>

" hide line number in terminal mode
augroup FolowTerm
    au!
    au TermOpen * set nonumber
    au BufRead,BufNewFile * set number
augroup END

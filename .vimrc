if has('win32')
  let $USER_VIM_DIR = $HOME . '/_vim'
else
  let $USER_VIM_DIR = $HOME . '/.vim'
endif

source $USER_VIM_DIR/plugins.vim

let g:tex_conceal=''
" let g:loaded_netrw = 1
" let g:loaded_netrwPlugin = 1
let g:netrw_fastbrowse = 0
let g:loaded_matchit = 1
let g:loaded_2html_plugin = 1

set noswapfile
set encoding=utf-8
set fileencoding=utf-8
set incsearch  "incremental search
set hlsearch  "highlight matched sequences
set wrapscan  "searches wrap around the end of the file
set noignorecase  "case-dependent match by default
"set showmatch
"set wrap
set tabstop=2  "how many spaces inserted with <tab>
set softtabstop=2
set shiftwidth=2  "indent width
set autoread  "warn if target file was changed
set hidden  "allow switching buffer without save
set number  "show line number
set showcmd
set laststatus=2  "status line height
set cmdheight=2
set wildmode=longest,list  "completion in command window
set expandtab  "<tab> key to insert spaces
set whichwrap=b,s,h,l,<,>,~,[,]  "cursor movement
set clipboard+=unnamed,unnamedplus  "integrate with system clipboard
set showtabline=2  "show tabline always
"set completeopt-=preview  "disable preview window appear during completion
set completeopt=menu,noinsert,noselect
set foldmethod=marker  "fold at marker
set cursorline  "highlight cursor line
set cinoptions+=g1,h1
set shortmess+=c  "don't show messages about completion menu
set mouse=a  "enable mouse action in all modes
set scrolloff=1  "set scroll offset to top and bottom
set synmaxcol=300  "Maximum column in which to search for syntax items.
set history=100
set foldenable  "enable code folding
set lazyredraw  "disable redraw while execiting macro, register, or autocmd
set virtualedit=block  "allow block-select after end of line
" set splitbelow  "open new window under the current window by default
" set list  " highlight special chars
" set listchars=tab:>-,trail:~
set backspace=indent,eol,start
set noshowmode
set noruler " for status line

" GUI color settings
if has('termguicolors')
  set termguicolors
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

if !has('nvim') && has('vim_starting')
    " 挿入モード時に非点滅の縦棒タイプのカーソル
    let &t_SI .= "\e[6 q"
    " ノーマルモード時に非点滅のブロックタイプのカーソル
    let &t_EI .= "\e[2 q"
    " 置換モード時に非点滅の下線タイプのカーソル
    let &t_SR .= "\e[4 q"
endif

"backup settings
if !has('win32') && trim(system('id -u')) != 0
  set backup
  set backupcopy=yes " for inotify-dependent tools such as parcel.js
  set writebackup " 取得するバックアップを編集前のファイルとする(無効化する場合は「nowritebackup」)
  set backupdir=/tmp/vim
  au BufWritePre * let &bex = '.' . strftime("%m%d_%H%M%S")
else
  set nobackup
endif

nnoremap r <Nop>
nnoremap rr "_dd
vnoremap r "_d
inoremap <silent> jj <ESC>

nnoremap <S-Up> kkkkk
nnoremap <S-Down> jjjjj
vnoremap <S-Up> kkkkk
vnoremap <S-Down> jjjjj
inoremap <S-Up> <Up><Up><Up><Up><Up>
inoremap <S-Down> <Down><Down><Down><Down><Down>
nnoremap <S-Right> $
nnoremap <S-Left> ^
inoremap <S-Right> <C-o>$
inoremap <S-Left> <C-o>^
noremap <C-Up> <C-w>k
noremap <C-Down> <C-w>j
noremap <C-Left> <C-w>h
noremap <C-Right> <C-w>l

"inoremap {<Enter> {}<Left><CR><ESC><S-o>
"inoremap ( ()<Left>

nnoremap <Home> ^
nnoremap <End> $
inoremap <Home> <C-o>^
inoremap <End> <C-o>$

nnoremap <C-a> ggVG

noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>

vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" cursor movement inside long line
" noremap  <buffer> <silent> <Up>   gk
" noremap  <buffer> <silent> <Down> gj
" noremap  <buffer> <silent> <Home> g<Home>
" noremap  <buffer> <silent> <End>  g<End>
" inoremap <buffer> <silent> <Up>   <C-o>gk
" inoremap <buffer> <silent> <Down> <C-o>gj
" inoremap <buffer> <silent> <Home> <C-o>g<Home>
" inoremap <buffer> <silent> <End>  <C-o>g<End>

inoremap <C-CR> <C-o>$;<CR>

" replace in visual block
" vnoremap : :s/\%V

nmap q: <Nop>

" avoid syntax highlighting for large file
autocmd BufReadPre * if getfsize(expand("%")) > 10000000 | syntax off | endif

autocmd Filetype json setl conceallevel=0
autocmd Filetype markdown setl conceallevel=0
autocmd FileType netrw setl bufhidden=wipe
autocmd FileType tags setl nofoldenable

autocmd BufDelete,BufWipeOut,BufCreate,BufNew,BufNewFile,BufUnload * echo ''

" auto close preview window
autocmd CompleteDone,InsertLeave * if pumvisible() == 0 | pclose | endif

"autocmd BufReadPost * silent exe '!mkdir -p /tmp/vim && cp -f ' . expand('%:p') . ' /tmp/vim/' . substitute(expand('%:p'), '/', '_', 'g')[1:] . ' &'

syntax enable
try
  colorscheme onedark
catch
  colorscheme torte
endtry
set t_Co=256
set background=dark

highlight Normal ctermbg=none guibg=NONE
highlight NonText ctermbg=none guibg=NONE
highlight Folded ctermbg=none guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE
highlight LineNr guifg=#666666
highlight TabLineSel ctermfg=0 ctermbg=119 guifg=#000000 guibg=#87ff5f
highlight TabLine ctermfg=230 ctermbg=240 guifg=#ffffd7 guibg=#555555 cterm=NONE
highlight TabLineFill ctermfg=235 ctermbg=235 guifg=#222222 guibg=#222222
highlight WintabsActiveSepEmpty ctermbg=NONE guibg=NONE
highlight Pmenu ctermfg=245 ctermbg=0 guifg=#dddddd guibg=#555555
highlight PmenuSel ctermbg=124 ctermfg=0 guifg=#000000 guibg=#cf2222
highlight MatchParen cterm=underline gui=underline
highlight Comment ctermfg=243
highlight ALEError ctermbg=88 guibg=#aa0000
highlight ALEWarning ctermbg=130 guibg=#884400

" Avoid issues in PowerShell
highlight clear CursorLine
highlight CursorLine ctermbg=36 guibg=#333333

" Coc highlighting
highlight CocFloating guibg=#000055
highlight CocErrorFloat gui=bold guifg=#ff0000
highlight CocWarningFloat gui=bold guifg=#ff8800
highlight CocErrorHighlight ctermbg=88 guibg=#aa0000
highlight CocWarningHighlight ctermbg=130 guibg=#884400
highlight CocErrorVirtualText ctermfg=9 guifg=#ff0000 guibg=#2b323b
highlight CocWarningVirtualText ctermfg=130 guifg=#ff922b guibg=#2b323b
highlight CocHintSign guifg=#aacc33 guibg=#393939
highlight CocHighlightText gui=underline
highlight Folded ctermbg=242 guibg=#555555 ctermfg=14 guifg=Cyan

function! s:vimrc_local(loc)
  let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction

call s:vimrc_local(getcwd())

" LogAutocmds {{{
" command! LogAutocmds call s:log_autocmds_toggle()
" 
" function! s:log_autocmds_toggle()
"   augroup LogAutocmd
"     autocmd!
"   augroup END
" 
"   let l:date = strftime('%F', localtime())
"   let s:activate = get(s:, 'activate', 0) ? 0 : 1
"   if !s:activate
"     call s:log('Stopped autocmd log (' . l:date . ')')
"     return
"   endif
" 
"   call s:log('Started autocmd log (' . l:date . ')')
"   silent execute '!rm -f /tmp/vim_log_autocommands'
"   augroup LogAutocmd
"     for l:au in s:aulist
"       if stridx(l:au, ' ') >= 0
"         silent execute 'autocmd' l:au 'call s:log(''' . l:au . ''')'
"       else
"         silent execute 'autocmd' l:au '* call s:log(''' . l:au . ''')'
"       endif
"     endfor
"   augroup END
" endfunction
" 
" function! s:log(message)
"   silent execute '!echo "'
"        \ . strftime('%T', localtime()) . ' - ' . a:message . '"'
"        \ '>> /tmp/vim_log_autocommands'
" endfunction
" 
" " These are deliberately left out due to side effects
" " - SourceCmd
" " - FileAppendCmd
" " - FileWriteCmd
" " - BufWriteCmd
" " - FileReadCmd
" " - BufReadCmd
" " - FuncUndefined
" 
" let s:aulist = [
"      \ 'BufNewFile',
"      \ 'BufReadPre',
"      \ 'BufRead',
"      \ 'BufReadPost',
"      \ 'FileReadPre',
"      \ 'FileReadPost',
"      \ 'FilterReadPre',
"      \ 'FilterReadPost',
"      \ 'StdinReadPre',
"      \ 'StdinReadPost',
"      \ 'BufWrite',
"      \ 'BufWritePre',
"      \ 'BufWritePost',
"      \ 'FileWritePre',
"      \ 'FileWritePost',
"      \ 'FileAppendPre',
"      \ 'FileAppendPost',
"      \ 'FilterWritePre',
"      \ 'FilterWritePost',
"      \ 'BufAdd',
"      \ 'BufCreate',
"      \ 'BufDelete',
"      \ 'BufWipeout',
"      \ 'BufFilePre',
"      \ 'BufFilePost',
"      \ 'BufEnter',
"      \ 'BufLeave',
"      \ 'BufWinEnter',
"      \ 'BufWinLeave',
"      \ 'BufUnload',
"      \ 'BufHidden',
"      \ 'BufNew',
"      \ 'SwapExists',
"      \ 'FileType',
"      \ 'Syntax',
"      \ 'EncodingChanged',
"      \ 'TermChanged',
"      \ 'VimEnter',
"      \ 'GUIEnter',
"      \ 'GUIFailed',
"      \ 'TermResponse',
"      \ 'QuitPre',
"      \ 'VimLeavePre',
"      \ 'VimLeave',
"      \ 'FileChangedShell',
"      \ 'FileChangedShellPost',
"      \ 'FileChangedRO',
"      \ 'ShellCmdPost',
"      \ 'ShellFilterPost',
"      \ 'CmdUndefined',
"      \ 'SpellFileMissing',
"      \ 'SourcePre',
"      \ 'VimResized',
"      \ 'FocusGained',
"      \ 'FocusLost',
"      \ 'CursorHold',
"      \ 'CursorHoldI',
"      \ 'CursorMoved',
"      \ 'CursorMovedI',
"      \ 'WinEnter',
"      \ 'WinLeave',
"      \ 'TabEnter',
"      \ 'TabLeave',
"      \ 'CmdwinEnter',
"      \ 'CmdwinLeave',
"      \ 'InsertEnter',
"      \ 'InsertChange',
"      \ 'InsertLeave',
"      \ 'InsertCharPre',
"      \ 'TextChanged',
"      \ 'TextChangedI',
"      \ 'ColorScheme',
"      \ 'RemoteReply',
"      \ 'QuickFixCmdPre',
"      \ 'QuickFixCmdPost',
"      \ 'SessionLoadPost',
"      \ 'MenuPopup',
"      \ 'CompleteDone',
"      \ 'User',
"      \ 'User AirlineModeChanged',
"      \ 'User LanguageClientDiagnosticsChanged'
"      \ ]
"}}}

" toggle quickfix {{{
function! GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      echohl None
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

nmap <silent> <M-3> :call ToggleList("Quickfix List", 'c')<CR>
" }}}

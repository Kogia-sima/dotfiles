source $USER_VIM_DIR/plug.vim
call plug#begin($USER_VIM_DIR . '/plugged')

" ---------- Non-Lazy Plugins ---------- {{{

" fzf {{{
if isdirectory($HOME . '/.fzf')
  Plug '~/.fzf'
  Plug 'junegunn/fzf.vim'
  let g:fzf_history_dir = '~/.local/share/fzf-history'
  nnoremap <C-f> :<C-u>GFiles<CR>
  inoremap <C-f> <C-o>:GFiles<CR>
endif
" }}}

" vim-wintabs {{{
" Plug 'zefei/vim-wintabs'
" Plug 'zefei/vim-wintabs-powerline'
" let g:wintabs_autoclose_vim = 1
" nmap b <Nop>
" nmap bn <Plug>(wintabs_next)
" nmap bp <Plug>(wintabs_previous)
" nmap bd <Plug>(wintabs_close)
" nmap bq :<C-U>q<CR>
" 
" nmap <C-S-PageDown> <Plug>(wintabs_next)
" nmap <C-S-PageUp> <Plug>(wintabs_previous)
" nmap <C-S-W> <Plug>(wintabs_close)
" }}}

Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' } "{{{
" Lua settings can be found below

nnoremap <silent><C-S-PageDown> :BufferLineCycleNext<CR>
nnoremap <silent><C-S-PageUp> :BufferLineCyclePrev<CR>

nmap b <Nop>
nnoremap <silent>bn :BufferLineCycleNext<CR>
nnoremap <silent>bp :BufferLineCyclePrev<CR>
nnoremap <silent>bd :bdelete<CR>
nnoremap bq :<C-U>q<CR>
" }}}

" Plug 'vim-jp/vimdoc-ja' "{{{
" set helplang=ja,en
" }}}

Plug 'dbakker/vim-projectroot' "{{{
let g:rootmarkers = ['.projectroot', '.git', '.hg', '.svn', '.bzr', '_darcs', 'Cargo.lock' ]
" }}}

Plug 'Shougo/neosnippet.vim' "{{{
let g:neosnippet#enable_snipmate_compatibility = 0
let g:neosnippet#enable_completed_snippet = 0
let g:neosnippet#snippets_directory = $HOME . '/.vim/snippets/'
let g:neosnippet#disable_runtime_snippets = {'_': 1}
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
nnoremap <C-n> :belowright split \| NeoSnippetEdit<CR>
" }}}

" Plug 'Yggdroot/indentLine' "{{{
" let g:indentLine_leadingSpaceEnabled = 1
" let g:indentLine_leadingSpaceChar = '.'
" }}}

Plug 'cohama/lexima.vim' "{{{
let g:lexima_enable_basic_rules = 1
let g:lexima_enable_newline_rules = 1
let g:lexima_enable_endwise_rules = 1
autocmd FileType vim let b:lexima_disabled = 1
" }}}

Plug 'ludovicchabant/vim-gutentags' "{{{
let g:gutentags_project_root = [ '.projectroot', '.git', '.svn', '.bzr', 'tags', '.ctags_exclude', '.hg', '_darcs', '.yarn-metadata.json' ]
"let g:gutentags_project_root_finder = 'projectroot#get'
let g:gutentags_add_default_project_roots = 0
let g:gutentags_file_list_command = 'rg --files --color=never --ignore-file .ctags_exclude'
let g:gutentags_exclude_project_root = [ $HOME . '/PG/Rust/3rdparty/rust' ]
" }}}

Plug 'tyru/caw.vim' "{{{
nmap <S-c> <Plug>(caw:hatpos:toggle)
vmap <S-c> <Plug>(caw:hatpos:toggle)
" }}}

Plug 'leafOfTree/vim-matchtag' "{{{
let g:vim_matchtag_files = '*.html,*.xml,*.js,*.jsx,*.vue,*.svelte,*stpl'
" }}}

" Plug 'airblade/vim-gitgutter' "{{{
" set signcolumn=auto
" " }}}

Plug 'lewis6991/gitsigns.nvim', { 'tag': 'v0.6' }

" Plug 'easymotion/vim-easymotion' "{{{
" 
" " Disable default mappings
" let g:EasyMotion_do_mapping = 0
" " Turn on case-insensitive feature
" let g:EasyMotion_smartcase = 1
" 
" nmap s <Plug>(easymotion-bd-f2)
" 
" "}}}

Plug 'phaazon/hop.nvim' "{{{
nnoremap <silent> s :<C-u>HopChar2<CR>
" }}}

Plug '~/PG/Vim/lcsline'
" Plug 'digitaltoad/vim-pug'
Plug 'nikvdp/ejs-syntax'
Plug 'eigenfoo/stan-vim'
Plug 'pangloss/vim-javascript'
Plug 'cespare/vim-toml'
Plug 'joshdick/onedark.vim'
Plug 'gutenye/json5.vim'
" Plug 'dart-lang/dart-vim-plugin'
" Plug 'Kogia-sima/sailfish', {'rtp': 'syntax/vim'}
" Plug 'tiagofumo/dart-vim-flutter-layout'
"Plug 'PProvost/vim-ps1'
Plug 'pantharshit00/vim-prisma'
Plug 'posva/vim-vue'
let g:vue_pre_processors='detect_on_enter'
" Plug 'mhinz/vim-startify'
" Plug 'leafOfTree/vim-vue-plugin'
Plug 'mechatroner/rainbow_csv'
" Plug 'chrisbra/csv.vim'

" Plug 'goerz/jupytext.vim' "{{{
" " セルの区切り文字をVSCode互換の # %% に指定する
" let g:jupytext_fmt = 'py:percent'
" " vimのPython向けシンタックスハイライトを有効にする
" let g:jupytext_filetype_map = {'py': 'python'}
" " }}}

" }}}


" ---------- Lazy Plugins ---------- {{{

Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['c', 'cpp']} "{{{
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_concepts_highlight = 0
" }}}

Plug 'rhysd/vim-gfm-syntax', {'for': ['markdown', 'pandoc.markdown', 'rmd']} "{{{
let g:markdown_fenced_languages = ['cpp', 'rust', 'toml', 'python', 'javascript']
let g:gfm_syntax_highlight_strikethrough = 0
" }}}

Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'} "{{{
nnoremap <silent> <M-1> :<C-u>NERDTreeToggle<CR>
inoremap <silent> <M-1> <C-o>:NERDTreeToggle<CR>
" }}}

Plug 'chrisbra/Colorizer', {'for': ['css', 'html', 'vue']} "{{{
let g:colorizer_auto_filetype='css,html,vue'
" }}}

" Plug '~/PG/Vim/vim-flutter', {'for': ['dart', 'java', 'kotlin']} "{{{
" let g:flutter_show_log_on_run = 1
" }}}

Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python' }

Plug 'puremourning/vimspector', {'for': ['python']} "{{{
let g:vimspector_sidebar_width = 40
let g:vimspector_code_minwidth = 80
let g:vimspector_terminal_maxwidth = 80

nnoremap d <Nop>
nmap dc <Plug>VimspectorContinue
nmap dd <Plug>VimspectorLaunch
nmap dz <Plug>VimspectorStop
nmap dr <Plug>VimspectorRestart
nmap dp <Plug>VimspectorPause
nmap db <Plug>VimspectorToggleBreakpoint
"nmap dB <Plug>VimspectorToggleConditionalBreakpoint
nmap dB <Plug>VimspectorAddFunctionBreakpoint
nmap du <Plug>VimspectorRunToCursor
nmap dn <Plug>VimspectorStepOver
nmap ds <Plug>VimspectorStepInto
nmap df <Plug>VimspectorStepOut
nmap dl <Plug>VimspectorBalloonEval
nnoremap <silent> dq :<C-u>call vimspector#Reset( { 'interactive': v:true } )<CR>
nnoremap <silent> dx :<C-u>call vimspector#ClearBreakpoints()<CR>

function! s:CustomiseUI()
  " Customise the basic UI...

  " Close the output window
  call win_gotoid( g:vimspector_session_windows.output )
  q

  " Close the watches window
  " call win_gotoid( g:vimspector_session_windows.watches )
  " q
endfunction

augroup MyVimspectorCustomistaion
  autocmd!
  autocmd User VimspectorUICreated call s:CustomiseUI()
  autocmd User VimspectorJumpedToFrame setlocal buflisted
augroup END

"}}}

Plug 'Shougo/context_filetype.vim', {'for': ['html', 'vue', 'markdown', 'jsx', 'ejs']} "{{{
" }}}

" Plug 'jupyter-vim/jupyter-vim' "{{{
" let g:jupyter_mapkeys = 0
" nmap J <Nop>
" 
" " Connect to the kernel
" nnoremap <buffer> <silent> JJ :JupyterConnect<CR>
" nnoremap <buffer> <silent> Jd :JupyterDisconnect<CR>
" 
" " Run current file
" nnoremap <buffer> <silent> Jf :JupyterRunFile<CR>
" nnoremap <buffer> <silent> Ji :PythonImportThisFile<CR>
" 
" " Send current cell
" nnoremap <buffer> <silent> Jc :JupyterSendCell<CR>
" " Send current line
" nnoremap <buffer> <silent> Jl :JupyterSendRange<CR>
" " Send a selection
" vmap     <buffer> <silent> J <Plug>JupyterRunVisual <bar> <Esc>
" " Send custom code
" nnoremap <buffer> <silent> Jp :JupyterSendCode 
" 
" " Debugging maps
" nnoremap <buffer> <silent> Jb :PythonSetBreak<CR>
" " }}}

" }}}


" ---------- Neovim Plugins ---------- {{{

if has('nvim')
  " coc.nvim 0.0.82 broke auto import feature
  Plug 'neoclide/coc.nvim', {'tag': 'v0.0.81'} "{{{

  " You will have bad experience for diagnostic messages when it's default 4000.
  set updatetime=300

  let g:coc_start_at_startup = empty($DISABLE_COC_NVIM) ? 1 : 0

  " let $RUSTFLAGS = $RUSTFLAGS .. " -C debug-assertions=no -C debuginfo=0"

  " Use tab for trigger completion with characters ahead and navigate.
  " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ CheckBackspace() ? "\<Tab>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Make <CR> to accept selected completion item or notify coc.nvim to format
  " <C-g>u breaks current undo, please make your own choice
  inoremap <silent><expr> <CR> pumvisible() ? "\<C-y>"
                                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

  " Use `M-c` and `M-` to navigate diagnostics
  nmap <silent> <M-Down> :call CocAction('diagnosticNext')<CR>
  nmap <silent> <M-Up> :call CocAction('diagnosticPrevious')<CR>

  " Remap keys for gotos
  nmap <silent> gd :CocPushd<CR>:call CocAction('jumpDefinition')<CR>
  nmap <silent> gt :CocPushd<CR>:call CocAction('jumpTypeDefinition')<CR>
  nmap <silent> gi :CocPushd<CR>:call CocAction('jumpImplementation')<CR>
  nmap <silent> gr :CocPushd<CR>:call CocAction('jumpReferences')<CR>
  nmap <silent> F :<C-u>call CocAction('format')<CR>
  nmap <silent> gb :CocPopd<CR>

  " Use K to show documentation in preview window
  nnoremap <silent> K :<C-u>call <SID>show_documentation()<CR>
  " Use Ctrl + k to show documentation in split window
  nnoremap <silent> <leader>k :<C-u>call <SID>show_documentation_split()<CR>
  inoremap <silent> <leader>k <C-r>=<SID>show_documentation_split()<CR><C-e>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  function! s:show_documentation_split()
    let l:winid = get(g:, 'coc_last_float_win', -1)
    if l:winid != -1
      let bufnr = winbufnr(l:winid)
      exe 'below sb '.bufnr
      call nvim_win_close(l:winid, v:false)
    endif
    return ''
  endfunction

  " Remap for rename current word
  nmap R <Plug>(coc-rename)
  nmap Q <Plug>(coc-codeaction-cursor)

  " Remap for format selected region
  "vmap <silent> F <Plug>(coc-format-selected)

  " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
  " xmap <leader>a  <Plug>(coc-codeaction-selected)
  " nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Using CocList
  " Show all diagnostics
  nnoremap <L> <Nop>
  nnoremap <silent> Ld  :<C-u>CocList diagnostics<cr>
  " Manage extensions
  nnoremap <silent> Le  :<C-u>CocList extensions<cr>
  " Show commands
  nnoremap <silent> Lc  :<C-u>CocList commands<cr>
  " Find symbol of current document
  nnoremap <silent> Lo  :<C-u>CocList outline<cr>
  " Search workspace symbols
  nnoremap <silent> Ls  :<C-u>CocList -I symbols<cr>

  nnoremap f <Nop>
  nnoremap <nowait><expr> f<Down> coc#float#has_scroll() ? coc#float#scroll(1) : "\<Down>"
  nnoremap <nowait><expr> f<Up> coc#float#has_scroll() ? coc#float#scroll(0) : "\<Up>"
  inoremap <nowait><expr> f<Down> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Down>"
  inoremap <nowait><expr> f<Up> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Up>"

  " filetype specific mapping
  autocmd FileType typescript nnoremap <buffer> gd :CocPushd<CR>:CocCommand tsserver.goToSourceDefinition<CR>
  autocmd FileType rust nnoremap <buffer> E :<C-u>CocCommand rust-analyzer.explainError<cr>

  " progress
  " autocmd User CocStatusChange echo get(g:, 'coc_status', '')

  " code jumps
  let g:jump_locs = []
  function! s:coc_pushd() abort "{{{
    let l:loc = extend([expand('%:p')], getcurpos())
    call add(g:jump_locs, l:loc)
  endfunction "}}}

  function! s:coc_popd() abort "{{{
    if len(g:jump_locs) > 0
      let l:loc = g:jump_locs[-1]
      let l:path = l:loc[0]

      if expand('%:p') !=# l:path || !&modified
        silent exe "e " . l:path
      endif

      call setpos('.', l:loc[1:])
      unlet g:jump_locs[-1]
    endif
  endfunction "}}}

  function! HookSourceCoc() abort "{{{
    augroup mygroup
      autocmd!
      " Highlight symbol under cursor on CursorHold
      autocmd CursorHold * silent call CocActionAsync('highlight')
      " Setup formatexpr specified filetype(s).
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      " Update signature help on jump placeholder
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end
  endfunction "}}}

  autocmd User CocNvimInit call HookSourceCoc()

  command! CocPushd call <SID>coc_pushd()
  command! CocPopd call <SID>coc_popd()
  " }}}

  Plug '~/PG/Vim/3rdparty/coc-pyright', {'for': ['python']}

  Plug 'iamcco/markdown-preview.nvim', {'for': ['markdown', 'pandoc.markdown', 'rmd'], 'do': 'cd app & yarn install' } "{{{
  let g:mkdp_auto_start = 0
  let g:mkdp_auto_close = 0
  let g:mkdp_refresh_slow = 1
  let g:mkdp_command_for_global = 0
  " }}}

  " Plug 'LoipesMas/magma-nvim', { 'branch': 'fix_clear_output', 'do': ':UpdateRemotePlugins', 'on': 'MagmaInit'}
  Plug '~/PG/Vim/3rdparty/magma-nvim', { 'do': ':UpdateRemotePlugins', 'on': 'MagmaInit'} "{{{
  nnoremap <silent><expr> m  nvim_exec('MagmaEvaluateOperator', v:true)
  nnoremap <silent>       mr :MagmaEvaluateLine<CR>
  nnoremap <silent>       ml :MagmaEvaluateLine<CR>
  xnoremap <silent>       m  :<C-u>MagmaEvaluateVisual<CR>
  nnoremap <silent>       mc :MagmaReevaluateCell<CR>
  nnoremap <silent>       md :MagmaDelete<CR>
  nnoremap <silent>       mo :MagmaShowOutput<CR>

  let g:magma_output_window_borders = v:false
  if $VIM_IMAGE_PROVIDER == "kitty"
    let g:magma_image_provider = "kitty"
  else
    let g:magma_image_provider = "ueberzug"
  endif
  " }}}

  Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

endif


" }}}

call plug#end()

" ---------- Lua Settings ---------- {{{
if exists(':lua') && has('nvim')
  lua << EOF
require("bufferline").setup {
  -- options = {
  --   numbers = "none",
  --   -- diagnostics = "coc",
  --   tab_size = 5,
  --   show_buffer_close_icons = false,
  --   show_buffer_default_icon = false,
  --   show_close_icon = false,
  --   show_tab_indicators = false,
  --   separator_style = { "", "" },
  --   -- separator_style = { '▏', '▏' },
  -- },
  -- highlights = {
  --   fill = {
  --     guifg="#000000",
  --     guibg="#000000",
  --   },
  --   buffer_selected = {
  --       guifg = '#EEEEC7',
  --       guibg = '#444444',
  --       gui = "bold,italic"
  --   },
  --   -- modified = {
  --   --     guifg = '#EEEEC7',
  --   --     guibg = '#444444',
  --   -- },
  --   modified_visible = {
  --       guifg = '#EEEEC7',
  --       guibg = '#444444',
  --   },
  --   modified_selected = {
  --       guifg = '#EEEEC7',
  --       guibg = '#444444'
  --   },
  --   indicator_selected = {
  --       guifg = '#EEEEC7',
  --       guibg = '#444444'
  --   },
  -- }
}

require'hop'.setup()

require("toggleterm").setup {
  -- size can be a number or function which is passed the current terminal
  size = 15,
  open_mapping = [[<M-2>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
  shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  persist_size = true,
  persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
  direction = 'horizontal',
  close_on_exit = true, -- close the terminal window when the process exits
  -- shell = vim.o.shell, -- change the default shell
  auto_scroll = true, -- automatically scroll to the bottom on terminal output
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = 'single',
    -- like `size`, width and height can be a number or function which is passed the current terminal
    width = 70,
    height = 10,
    winblend = 3,
  },
  winbar = {
    enabled = false,
    name_formatter = function(term) --  term: Terminal
      return term.name
    end
  }
}

require('gitsigns').setup {
  signcolumn = false,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = true, -- Toggle with `:Gitsigns toggle_numhl`
  max_file_length = 10000, -- Disable if file is longer than this (in lines)
}
EOF

endif

" }}}

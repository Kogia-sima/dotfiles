" -------------------------------------
" Neovide configurations
" c.f. https://github.com/neovide/neovide/wiki/Configuration
" -------------------------------------

if exists('&guifont')
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h9
endif

let g:neovide_remember_window_size = v:true
" let g:neovide_cursor_animation_length = 0
let g:neovide_cursor_trail_length = 0
let g:neovide_cursor_antialiasing=v:false

let g:neovide_cursor_animate_in_insert_mode = v:false
let g:neovide_cursor_animate_command_line = v:false
let g:neovide_scroll_animation_length = 0
let g:neovide_floating_blur = v:false
let g:neovide_position_animation_length = 0

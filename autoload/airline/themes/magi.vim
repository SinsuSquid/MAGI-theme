" vim-airline companion theme for Magi ✨
" Optimized for Senpai's legendary coding sessions! 🚀

let g:airline#themes#magi#palette = {}

" --- Color Palette Definition ---
" [ guifg, guibg, ctermfg, ctermbg ]
let s:orange_primary = [ '#000000', '#ec7420', 232, 208 ] " Normal Mode Main
let s:black_bg       = [ '#ec7420', '#000000', 208, 232 ] " Edges
let s:grey_mid       = [ '#e8e8e8', '#484848', 255, 239 ] " Info segments

let s:green_insert   = [ '#000000', '#50ff10', 232, 82  ] " Insert Mode
let s:cyan_visual    = [ '#000000', '#3cffd0', 232, 86  ] " Visual Mode
let s:red_replace    = [ '#e8e8e8', '#f02020', 255, 196 ] " Replace Mode
let s:yellow_warn    = [ '#000000', '#f4b000', 232, 214 ] " Warnings/Command

" --- Normal Mode ---
let g:airline#themes#magi#palette.normal = airline#themes#generate_color_map(s:orange_primary, s:grey_mid, s:black_bg)

" --- Insert Mode ---
let g:airline#themes#magi#palette.insert = airline#themes#generate_color_map(s:green_insert, s:grey_mid, s:black_bg)

" --- Visual Mode ---
let g:airline#themes#magi#palette.visual = airline#themes#generate_color_map(s:cyan_visual, s:grey_mid, s:black_bg)

" --- Replace Mode ---
let g:airline#themes#magi#palette.replace = airline#themes#generate_color_map(s:red_replace, s:grey_mid, s:black_bg)

" --- Inactive Windows ---
let s:IA = [ '#484848', '#000000', 239, 232 ]
let g:airline#themes#magi#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)

" --- Command Mode (Yellow Flash! ⚡) ---
let g:airline#themes#magi#palette.commandline = airline#themes#generate_color_map(s:yellow_warn, s:grey_mid, s:black_bg)

" --- Accents ---
let g:airline#themes#magi#palette.accents = {
      \ 'red': [ '#f02020', '', 196, '' ]
      \ }

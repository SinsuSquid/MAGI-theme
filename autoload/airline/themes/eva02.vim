" vim-airline companion theme for EVA-02 🔴🧡
" Production Model tactical HUD for Unit-02.

let g:airline#themes#eva02#palette = {}

" --- Color Palette Definition ---
" [ guifg, guibg, ctermfg, ctermbg ]
let s:red_primary    = [ '#281d2d', '#ed2323', 234, 196 ] " Normal Mode Main
let s:orange_edge    = [ '#ed2323', '#281d2d', 196, 234 ] " Edges
let s:orange_mid     = [ '#281d2d', '#f99d52', 234, 215 ] " Info segments

let s:orange_insert  = [ '#281d2d', '#ea8533', 234, 208 ] " Insert Mode
let s:green_visual   = [ '#281d2d', '#8bd450', 234, 113 ] " Visual Mode
let s:white_replace  = [ '#281d2d', '#fbe6e5', 234, 255 ] " Replace Mode
let s:cyan_info      = [ '#281d2d', '#3cffd0', 234, 86  ] " Extra info

" --- Normal Mode ---
let g:airline#themes#eva02#palette.normal = airline#themes#generate_color_map(s:red_primary, s:orange_mid, s:orange_edge)

" --- Insert Mode ---
let g:airline#themes#eva02#palette.insert = airline#themes#generate_color_map(s:orange_insert, s:orange_mid, s:orange_edge)

" --- Visual Mode ---
let g:airline#themes#eva02#palette.visual = airline#themes#generate_color_map(s:green_visual, s:orange_mid, s:orange_edge)

" --- Replace Mode ---
let g:airline#themes#eva02#palette.replace = airline#themes#generate_color_map(s:white_replace, s:orange_mid, s:orange_edge)

" --- Inactive Windows ---
let s:IA = [ '#f99d52', '#281d2d', 215, 234 ]
let g:airline#themes#eva02#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)

" --- Command Mode ---
let g:airline#themes#eva02#palette.commandline = airline#themes#generate_color_map(s:cyan_info, s:orange_mid, s:orange_edge)

" --- Accents ---
let g:airline#themes#eva02#palette.accents = {
      \ 'red': [ '#ed2323', '', 196, '' ]
      \ }

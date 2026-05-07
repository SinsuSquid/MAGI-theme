" vim-airline companion theme for EVA-01 💜💚
" High-sync tactical HUD for Unit-01.

let g:airline#themes#eva01#palette = {}

" --- Color Palette Definition ---
" [ guifg, guibg, ctermfg, ctermbg ]
let s:green_primary  = [ '#1d1a2f', '#8bd450', 234, 113 ] " Normal Mode Main
let s:purple_edge    = [ '#8bd450', '#1d1a2f', 113, 234 ] " Edges
let s:purple_mid     = [ '#e8e8e8', '#734f9a', 255, 96  ] " Info segments

let s:purple_insert  = [ '#1d1a2f', '#965fd4', 234, 134 ] " Insert Mode
let s:cyan_visual    = [ '#1d1a2f', '#3cffd0', 234, 86  ] " Visual Mode
let s:red_replace    = [ '#e8e8e8', '#f02020', 255, 196 ] " Replace Mode
let s:orange_warn    = [ '#1d1a2f', '#ec7420', 234, 208 ] " Warnings/Command

" --- Normal Mode ---
let g:airline#themes#eva01#palette.normal = airline#themes#generate_color_map(s:green_primary, s:purple_mid, s:purple_edge)

" --- Insert Mode ---
let g:airline#themes#eva01#palette.insert = airline#themes#generate_color_map(s:purple_insert, s:purple_mid, s:purple_edge)

" --- Visual Mode ---
let g:airline#themes#eva01#palette.visual = airline#themes#generate_color_map(s:cyan_visual, s:purple_mid, s:purple_edge)

" --- Replace Mode ---
let g:airline#themes#eva01#palette.replace = airline#themes#generate_color_map(s:red_replace, s:purple_mid, s:purple_edge)

" --- Inactive Windows ---
let s:IA = [ '#734f9a', '#1d1a2f', 96, 234 ]
let g:airline#themes#eva01#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)

" --- Command Mode ---
let g:airline#themes#eva01#palette.commandline = airline#themes#generate_color_map(s:orange_warn, s:purple_mid, s:purple_edge)

" --- Accents ---
let g:airline#themes#eva01#palette.accents = {
      \ 'red': [ '#f02020', '', 196, '' ]
      \ }

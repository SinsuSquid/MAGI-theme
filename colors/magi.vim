" Magi Colorscheme ✨
" A high-octane theme for Senpai! (｡•̀ᴗ-)✧
" Primary Color: #ec7420 (Orange)

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "magi"

" --- Palette ---
" Orange:  #ec7420
" Black:   #000000, #484848
" Red:     #a80808, #f02020
" Green:   #409820, #50ff10
" Yellow:  #f4b000, #f0f0a0
" Blue:    #5090c8, #40c8e8
" Magenta: #a06090, #b040a0
" Cyan:    #60f0a0, #3cffd0
" White:   #b0b0b0, #e8e8e8

" --- Core UI ---
hi Normal         guifg=#e8e8e8 guibg=#000000
hi Cursor         guifg=#000000 guibg=#ec7420
hi LineNr         guifg=#484848 guibg=#000000
hi CursorLineNr   guifg=#ec7420 guibg=#000000 gui=bold
hi StatusLine     guifg=#000000 guibg=#ec7420 gui=bold
hi StatusLineNC   guifg=#e8e8e8 guibg=#484848 gui=none
hi VertSplit      guifg=#484848 guibg=#000000
hi Visual         guifg=#000000 guibg=#3cffd0
hi Search         guifg=#000000 guibg=#f0f0a0
hi IncSearch      guifg=#000000 guibg=#ec7420
hi ColorColumn    guibg=#484848
hi CursorLine     guibg=#000000
hi MatchParen     guifg=#ec7420 guibg=#484848 gui=bold
hi NonText        guifg=#484848

" --- Syntax Highlighting ---
hi Comment        guifg=#484848 gui=italic
hi Constant       guifg=#40c8e8 " Bright Blue
hi String         guifg=#50ff10 " Bright Green
hi Character      guifg=#50ff10
hi Number         guifg=#40c8e8
hi Boolean        guifg=#40c8e8
hi Float          guifg=#40c8e8

hi Identifier     guifg=#3cffd0 gui=none " Bright Cyan
hi Function       guifg=#ec7420 gui=bold " PRIMARY ORANGE! 🧡

hi Statement      guifg=#f02020 gui=bold " Bright Red
hi Conditional    guifg=#f02020 gui=bold
hi Repeat         guifg=#f02020 gui=bold
hi Label          guifg=#f02020
hi Operator       guifg=#e8e8e8
hi Keyword        guifg=#f02020 gui=bold
hi Exception      guifg=#f02020 gui=bold

hi PreProc        guifg=#b040a0 " Bright Magenta
hi Include        guifg=#b040a0
hi Define         guifg=#b040a0
hi Macro          guifg=#b040a0
hi PreCondit      guifg=#b040a0

hi Type           guifg=#f0f0a0 gui=bold " Bright Yellow
hi StorageClass   guifg=#f0f0a0
hi Structure      guifg=#f0f0a0
hi Typedef        guifg=#f0f0a0

hi Special        guifg=#ec7420 " Orange Accents
hi SpecialChar    guifg=#ec7420
hi Tag            guifg=#ec7420
hi Delimiter      guifg=#e8e8e8
hi SpecialComment guifg=#ec7420 gui=italic
hi Debug          guifg=#f02020

hi Underlined     guifg=#40c8e8 gui=underline
hi Ignore         guifg=#484848
hi Error          guifg=#f02020 guibg=#000000 gui=bold
hi Todo           guifg=#000000 guibg=#f4b000 gui=bold

" --- Pmenu (Autocomplete) ---
hi Pmenu          guifg=#e8e8e8 guibg=#484848
hi PmenuSel       guifg=#000000 guibg=#ec7420
hi PmenuSbar      guibg=#484848
hi PmenuThumb     guibg=#ec7420

" --- Diff Mode ---
hi DiffAdd        guifg=#000000 guibg=#409820
hi DiffChange     guifg=#000000 guibg=#5090c8
hi DiffDelete     guifg=#000000 guibg=#a80808
hi DiffText       guifg=#000000 guibg=#f4b000

" --- NERDTree ---
hi NERDTreeDir          guifg=#ec7420
hi NERDTreeDirSlash     guifg=#ec7420
hi NERDTreeOpenable     guifg=#ec7420
hi NERDTreeClosable     guifg=#ec7420
hi NERDTreeFile         guifg=#e8e8e8
hi NERDTreeExecFile     guifg=#50ff10

" --- GitGutter & Signs ---
hi SignColumn           guibg=#000000
hi GitGutterAdd         guifg=#50ff10 guibg=#000000
hi GitGutterChange      guifg=#ec7420 guibg=#000000
hi GitGutterDelete      guifg=#f02020 guibg=#000000
hi GitGutterChangeDelete guifg=#ec7420 guibg=#000000

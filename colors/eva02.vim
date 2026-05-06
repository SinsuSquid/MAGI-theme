" EVA-02 Colorscheme 🔴🧡
" A high-sync theme for Senpai! (｡•̀ᴗ-)✧
" Inspired by Evangelion Unit-02

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "eva02"

" --- Palette ---
" Dark Purple:    #281d2d (Background)
" Unit-02 Red:    #ed2323 (Primary Accent)
" Orange:         #ea8533 (Secondary Accent)
" Light Orange:   #f99d52 (UI/Types)
" Peach White:    #fbe6e5 (Foreground)

" --- Core UI ---
hi Normal         guifg=#fbe6e5 guibg=#281d2d
hi Cursor         guifg=#281d2d guibg=#ed2323
hi LineNr         guifg=#f99d52 guibg=#281d2d
hi CursorLineNr   guifg=#ed2323 guibg=#281d2d gui=bold
hi StatusLine     guifg=#281d2d guibg=#ed2323 gui=bold
hi StatusLineNC   guifg=#fbe6e5 guibg=#f99d52 gui=none
hi VertSplit      guifg=#f99d52 guibg=#281d2d
hi Visual         guifg=#281d2d guibg=#ea8533
hi Search         guifg=#281d2d guibg=#ed2323
hi IncSearch      guifg=#281d2d guibg=#fbe6e5
hi ColorColumn    guibg=#f99d52
hi CursorLine     guibg=#281d2d
hi MatchParen     guifg=#ed2323 guibg=#f99d52 gui=bold
hi NonText        guifg=#f99d52

" --- Syntax Highlighting ---
hi Comment        guifg=#f99d52 gui=italic
hi Constant       guifg=#ea8533 
hi String         guifg=#ea8533
hi Character      guifg=#ea8533
hi Number         guifg=#40c8e8
hi Boolean        guifg=#40c8e8
hi Float          guifg=#40c8e8

hi Identifier     guifg=#fbe6e5 gui=none 
hi Function       guifg=#ed2323 gui=bold " UNIT-02 RED! 🔴

hi Statement      guifg=#ea8533 gui=bold " ORANGE! 🧡
hi Conditional    guifg=#ea8533 gui=bold
hi Repeat         guifg=#ea8533 gui=bold
hi Label          guifg=#ea8533
hi Operator       guifg=#fbe6e5
hi Keyword        guifg=#ea8533 gui=bold
hi Exception      guifg=#ea8533 gui=bold

hi PreProc        guifg=#ed2323 
hi Include        guifg=#ed2323
hi Define         guifg=#ed2323
hi Macro          guifg=#ed2323
hi PreCondit      guifg=#ed2323

hi Type           guifg=#f99d52 gui=bold " LIGHT ORANGE
hi StorageClass   guifg=#f99d52
hi Structure      guifg=#f99d52
hi Typedef        guifg=#f99d52

hi Special        guifg=#ed2323 
hi SpecialChar    guifg=#ed2323
hi Tag            guifg=#ed2323
hi Delimiter      guifg=#fbe6e5
hi SpecialComment guifg=#ed2323 gui=italic
hi Debug          guifg=#ed2323

hi Underlined     guifg=#ed2323 gui=underline
hi Ignore         guifg=#f99d52
hi Error          guifg=#ed2323 guibg=#281d2d gui=bold
hi Todo           guifg=#281d2d guibg=#ed2323 gui=bold

" --- GitGutter & Signs ---
hi SignColumn           guibg=#281d2d
hi GitGutterAdd         guifg=#8bd450 guibg=#281d2d
hi GitGutterChange      guifg=#ed2323 guibg=#281d2d
hi GitGutterDelete      guifg=#ed2323 guibg=#281d2d
hi GitGutterChangeDelete guifg=#ea8533 guibg=#281d2d

" --- Pmenu (Autocomplete) ---
hi Pmenu          guifg=#fbe6e5 guibg=#f99d52
hi PmenuSel       guifg=#281d2d guibg=#ed2323
hi PmenuSbar      guibg=#f99d52
hi PmenuThumb     guibg=#ed2323

" --- Diff Mode ---
hi DiffAdd        guifg=#281d2d guibg=#8bd450
hi DiffChange     guifg=#281d2d guibg=#ea8533
hi DiffDelete     guifg=#281d2d guibg=#ed2323
hi DiffText       guifg=#281d2d guibg=#fbe6e5

" --- NERDTree ---
hi NERDTreeDir          guifg=#ed2323
hi NERDTreeDirSlash     guifg=#ed2323
hi NERDTreeOpenable     guifg=#ed2323
hi NERDTreeClosable     guifg=#ed2323
hi NERDTreeFile         guifg=#fbe6e5
hi NERDTreeExecFile     guifg=#8bd450

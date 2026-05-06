" EVA-01 Colorscheme 💜💚
" A high-sync theme for Senpai! (｡•̀ᴗ-)✧
" Inspired by Evangelion Unit-01

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "eva01"

" --- Palette ---
" Midnight Purple: #1d1a2f (Background)
" Neon Green:      #8bd450 (Primary Accent)
" Bright Purple:   #965fd4 (Keywords)
" Muted Purple:    #734f9a (Comments/UI)
" Forest Green:    #3f6d4e (Types/UI)
" Orange:          #ec7420 (Strings/Special)
" Cyan:            #3cffd0 (Identifiers)
" Red:             #f02020 (Errors)

" --- Core UI ---
hi Normal         guifg=#e8e8e8 guibg=#1d1a2f
hi Cursor         guifg=#1d1a2f guibg=#8bd450
hi LineNr         guifg=#734f9a guibg=#1d1a2f
hi CursorLineNr   guifg=#8bd450 guibg=#1d1a2f gui=bold
hi StatusLine     guifg=#1d1a2f guibg=#8bd450 gui=bold
hi StatusLineNC   guifg=#e8e8e8 guibg=#3f6d4e gui=none
hi VertSplit      guifg=#3f6d4e guibg=#1d1a2f
hi Visual         guifg=#1d1a2f guibg=#965fd4
hi Search         guifg=#1d1a2f guibg=#8bd450
hi IncSearch      guifg=#1d1a2f guibg=#ec7420
hi ColorColumn    guibg=#3f6d4e
hi CursorLine     guibg=#1d1a2f
hi MatchParen     guifg=#8bd450 guibg=#734f9a gui=bold
hi NonText        guifg=#3f6d4e

" --- Syntax Highlighting ---
hi Comment        guifg=#734f9a gui=italic
hi Constant       guifg=#ec7420 
hi String         guifg=#ec7420
hi Character      guifg=#ec7420
hi Number         guifg=#3cffd0
hi Boolean        guifg=#3cffd0
hi Float          guifg=#3cffd0

hi Identifier     guifg=#e8e8e8 gui=none 
hi Function       guifg=#8bd450 gui=bold " NEON GREEN! 💚

hi Statement      guifg=#965fd4 gui=bold " BRIGHT PURPLE! 💜
hi Conditional    guifg=#965fd4 gui=bold
hi Repeat         guifg=#965fd4 gui=bold
hi Label          guifg=#965fd4
hi Operator       guifg=#e8e8e8
hi Keyword        guifg=#965fd4 gui=bold
hi Exception      guifg=#965fd4 gui=bold

hi PreProc        guifg=#ec7420 
hi Include        guifg=#ec7420
hi Define         guifg=#ec7420
hi Macro          guifg=#ec7420
hi PreCondit      guifg=#ec7420

hi Type           guifg=#3f6d4e gui=bold " FOREST GREEN
hi StorageClass   guifg=#3f6d4e
hi Structure      guifg=#3f6d4e
hi Typedef        guifg=#3f6d4e

hi Special        guifg=#8bd450 
hi SpecialChar    guifg=#8bd450
hi Tag            guifg=#8bd450
hi Delimiter      guifg=#e8e8e8
hi SpecialComment guifg=#8bd450 gui=italic
hi Debug          guifg=#f02020

hi Underlined     guifg=#8bd450 gui=underline
hi Ignore         guifg=#734f9a
hi Error          guifg=#f02020 guibg=#1d1a2f gui=bold
hi Todo           guifg=#1d1a2f guibg=#8bd450 gui=bold

" --- GitGutter & Signs ---
hi SignColumn           guibg=#1d1a2f
hi GitGutterAdd         guifg=#8bd450 guibg=#1d1a2f
hi GitGutterChange      guifg=#965fd4 guibg=#1d1a2f
hi GitGutterDelete      guifg=#f02020 guibg=#1d1a2f
hi GitGutterChangeDelete guifg=#965fd4 guibg=#1d1a2f

" --- Pmenu (Autocomplete) ---
hi Pmenu          guifg=#e8e8e8 guibg=#3f6d4e
hi PmenuSel       guifg=#1d1a2f guibg=#8bd450
hi PmenuSbar      guibg=#3f6d4e
hi PmenuThumb     guibg=#8bd450

" --- Diff Mode ---
hi DiffAdd        guifg=#1d1a2f guibg=#8bd450
hi DiffChange     guifg=#1d1a2f guibg=#965fd4
hi DiffDelete     guifg=#1d1a2f guibg=#f02020
hi DiffText       guifg=#1d1a2f guibg=#ec7420

" --- NERDTree ---
hi NERDTreeDir          guifg=#8bd450
hi NERDTreeDirSlash     guifg=#8bd450
hi NERDTreeOpenable     guifg=#8bd450
hi NERDTreeClosable     guifg=#8bd450
hi NERDTreeFile         guifg=#e8e8e8
hi NERDTreeExecFile     guifg=#8bd450


set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "ample"

" Vim >= 7.0 specific colors
if version >= 700
  hi CursorLine guibg=#262626
  hi CursorColumn guibg=#292929
  hi MatchParen guifg=#f6f3e8 guibg=#857b6f gui=bold
  hi Pmenu 		guifg=#f6f3e8 guibg=#303030 " Or guibg=#444444
  hi PmenuSel 	guifg=#000000 guibg=#cae682
  hi ColorColumn              guibg=#262626
endif

hi Cursor 		guifg=NONE    guibg=#656565 gui=none
hi Normal 		guifg=#BDBDB3 guibg=#212121 gui=none " ample/fg, ample/bg
hi NonText 		guifg=#808080 guibg=#303030 gui=none
hi LineNr 		guifg=#656565 guibg=#212121 gui=none " *
hi StatusLine 	guifg=#f6f3e8 guibg=#444444 gui=italic
hi StatusLineNC guifg=#857b6f guibg=#444444 gui=none
hi VertSplit 	guifg=#303030 guibg=#444444 gui=none
hi Folded 		guibg=#384048 guifg=#a0a8b0 gui=none
hi Title		guifg=#f6f3e8 guibg=NONE	gui=bold
hi Visual		guifg=#f6f3e8 guibg=#444444 gui=none
hi SpecialKey	guifg=#808080 guibg=#343434 gui=none

hi DiffAdd      guifg=#057F40 guibg=#212121 gui=bold
hi DiffChange   guifg=#5180b3 guibg=#212121 gui=bold
hi DiffDelete   guifg=#9D2512 guibg=#212121 gui=bold

" Syntax
hi Comment 		guifg=#757575 gui=italic " DONE
hi Todo 		guifg=#CD5542 gui=italic
hi Constant 	guifg=#AB75C3 gui=none " DONE
hi String 		guifg=#BDBC61 gui=none " DONE
hi Identifier 	guifg=#BABA36 gui=none " done
hi Function 	guifg=#6AAF50 gui=bold " DONE
hi Type 		guifg=#CD5542 gui=bold " DONE
hi Statement 	guifg=#528FD1 gui=none " DONE
hi Keyword		guifg=#5180b3 gui=bold " DONE
hi PreProc 		guifg=#DF9522 gui=none " OR FF8512
hi Number		guifg=#e5786d gui=none
hi Special		guifg=#e7f6da gui=none


set background=dark
highlight clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "mono"

highlight Normal        cterm=NONE            ctermfg=NONE    ctermbg=NONE
highlight Search        cterm=reverse         ctermfg=NONE    ctermbg=NONE
highlight IncSearch     cterm=reverse,bold,underline  ctermfg=NONE    ctermbg=NONE
highlight! link         Substitute            Search
highlight MatchParen    cterm=bold,underline       ctermfg=NONE    ctermbg=NONE
highlight Cursor        cterm=NONE            ctermfg=NONE    ctermbg=NONE
highlight CursorColumn  cterm=reverse         ctermfg=NONE    ctermbg=NONE
highlight ColorColumn   cterm=NONE            ctermfg=NONE    ctermbg=8
highlight CursorLine    cterm=underline       ctermfg=NONE    ctermbg=NONE
highlight QuickFixLine  cterm=underline       ctermfg=NONE    ctermbg=NONE
highlight EndOfBuffer   cterm=NONE            ctermfg=NONE    ctermbg=NONE
highlight LineNr        cterm=NONE            ctermfg=NONE    ctermbg=NONE
highlight CursorLineNr  cterm=bold            ctermfg=NONE    ctermbg=NONE
highlight Visual        cterm=reverse         ctermfg=NONE    ctermbg=NONE
highlight Whitespace    cterm=NONE            ctermfg=NONE    ctermbg=NONE
highlight Directory     cterm=bold            ctermfg=NONE    ctermbg=NONE
highlight TermCursor    cterm=reverse         ctermfg=NONE    ctermbg=NONE
highlight TermCursorNC  cterm=NONE            ctermfg=NONE    ctermbg=NONE

highlight Pmenu         cterm=NONE            ctermfg=NONE    ctermbg=NONE
highlight PmenuSel      cterm=reverse         ctermfg=NONE    ctermbg=NONE
highlight! link PmenuSbar Normal
highlight PmenuThumb    cterm=reverse         ctermfg=NONE    ctermbg=NONE

highlight StatusLine    cterm=bold,reverse    ctermfg=NONE    ctermbg=NONE
highlight! link         StatusLineTerm        StatusLine
highlight StatusLineNC  cterm=reverse         ctermfg=NONE    ctermbg=NONE
highlight! link         StatusLineTermNC      StatusLineNC
highlight VertSplit     cterm=NONE            ctermfg=NONE    ctermbg=NONE

highlight TabLineFill   cterm=underline       ctermfg=NONE    ctermbg=NONE
highlight TabLine       cterm=underline       ctermfg=NONE    ctermbg=NONE
highlight TabLineSel    cterm=bold,underline  ctermfg=NONE    ctermbg=NONE

highlight Comment       cterm=italic          ctermfg=NONE    ctermbg=NONE
highlight Constant      cterm=NONE            ctermfg=NONE    ctermbg=NONE
highlight Special       cterm=NONE            ctermfg=NONE    ctermbg=NONE
highlight Identifier    cterm=NONE            ctermfg=NONE    ctermbg=NONE
highlight Statement     cterm=NONE            ctermfg=NONE    ctermbg=NONE
highlight PreProc       cterm=NONE            ctermfg=NONE    ctermbg=NONE
highlight Type          cterm=NONE            ctermfg=NONE    ctermbg=NONE
highlight Underlined    cterm=underline       ctermfg=NONE    ctermbg=NONE
highlight Ignore        cterm=NONE            ctermfg=0       ctermbg=NONE
highlight Error         cterm=NONE            ctermfg=NONE    ctermbg=NONE
highlight Todo          cterm=italic,underline ctermfg=NONE    ctermbg=NONE

highlight String        cterm=NONE            ctermfg=NONE    ctermbg=NONE

highlight! link         Character             Constant
highlight! link         Number                Constant
highlight! link         Boolean               Constant
highlight! link         Float                 Number
highlight! link         Function              Identifier
highlight! link         Conditional           Statement
highlight! link         Repeat                Statement
highlight! link         Label                 Statement
highlight! link         Operator              Statement
highlight! link         Keyword               Statement
highlight! link         Exception             Statement
highlight! link         Include               PreProc
highlight! link         Define                PreProc
highlight! link         Macro                 PreProc
highlight! link         PreCondit             PreProc
highlight! link         StorageClass          Type
highlight! link         Structure             Type
highlight! link         Typedef               Type
highlight! link         Tag                   Special
highlight! link         SpecialChar           Special
highlight! link         Delimiter             Special
highlight! link         SpecialComment        Special
highlight! link         Debug                 Special

highlight! link Conceal Normal
highlight! link CursorIM Normal
highlight! link DiffAdd Normal
highlight! link DiffChange Normal
highlight! link DiffDelete Normal
highlight! link DiffText Normal
"highlight! link TermCursor Cursor
"highlight! link TermCursorNC Cursor
highlight! link ErrorMsg Normal
highlight! link FoldColumn Normal
highlight! link Folded Normal
highlight! link SignColumn Normal
highlight! link ModeMsg Normal
highlight! link MsgSeparator Normal
highlight! link MoreMsg Normal
highlight! link NonText Normal
highlight! link NormalNC Normal
highlight! link Question Normal
highlight! link SpecialKey Normal
highlight! link SpellBad Normal
highlight! link SpellCap Normal
highlight! link SpellLocal Normal
highlight! link SpellRare Normal
highlight! link Title Normal
highlight! link VisualNOS Normal
highlight! link WarningMsg Normal
highlight! link WildMenu Normal

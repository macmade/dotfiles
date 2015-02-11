""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" XS-Labs VIM colors
" 
" Jean-David Gadina - www.xs-labs.com
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "xs-labs"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

hi Normal           ctermfg=white       ctermbg=black       cterm=NONE
hi Cursor           ctermfg=white       ctermbg=NONE        cterm=reverse
hi CursorLine       ctermfg=gray        ctermbg=NONE        cterm=reverse
hi MatchParen       ctermfg=white       ctermbg=darkyellow  cterm=NONE

hi StatusLine       ctermfg=white       ctermbg=darkyellow  cterm=bold
hi ColorColumn      ctermfg=white       ctermbg=darkgray    cterm=NONE
hi FoldColumn       ctermfg=white       ctermbg=darkgray    cterm=bold
hi Folded           ctermfg=white       ctermbg=darkgray    cterm=bold
hi LineNr           ctermfg=black       ctermbg=gray        cterm=NONE

hi Error            ctermfg=red         ctermbg=NONE        cterm=NONE
hi ErrorMsg         ctermfg=red         ctermbg=NONE        cterm=NONE
hi WarningMsg       ctermfg=red         ctermbg=NONE        cterm=NONE
hi ModeMsg          ctermfg=yellow      ctermbg=NONE        cterm=NONE

hi Ignore           ctermfg=NONE        ctermbg=NONE        cterm=NONE

hi NonText          ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi PmenuSbar        ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi SpecialKey       ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi StatusLineNC     ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi Title            ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi VertSplit        ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi Visual           ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi WildMenu         ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi Pmenu            ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi PmenuSel         ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi Search           ctermfg=NONE        ctermbg=NONE        cterm=NONE

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax highlighting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

hi Comment          ctermfg=darkgray    ctermbg=NONE        cterm=NONE

hi Keyword          ctermfg=blue        ctermbg=NONE        cterm=NONE
hi Statement        ctermfg=blue        ctermbg=NONE        cterm=NONE
hi Type             ctermfg=blue        ctermbg=NONE        cterm=NONE
hi Conditional      ctermfg=blue        ctermbg=NONE        cterm=NONE
hi Operator         ctermfg=blue        ctermbg=NONE        cterm=NONE
hi Boolean          ctermfg=blue        ctermbg=NONE        cterm=NONE
hi Structure        ctermfg=blue        ctermbg=NONE        cterm=NONE
hi Repeat           ctermfg=blue        ctermbg=NONE        cterm=NONE
hi Label            ctermfg=blue        ctermbg=NONE        cterm=NONE
hi Constant         ctermfg=blue        ctermbg=NONE        cterm=NONE
hi Exception        ctermfg=blue        ctermbg=NONE        cterm=NONE
hi StorageClass     ctermfg=blue        ctermbg=NONE        cterm=NONE
hi Typedef          ctermfg=blue        ctermbg=NONE        cterm=NONE

hi PreProc          ctermfg=magenta     ctermbg=NONE        cterm=NONE
hi Include          ctermfg=magenta     ctermbg=NONE        cterm=NONE
hi Macro            ctermfg=magenta     ctermbg=NONE        cterm=NONE
hi PreCondit        ctermfg=magenta     ctermbg=NONE        cterm=NONE
hi Define           ctermfg=magenta     ctermbg=NONE        cterm=NONE

hi String           ctermfg=red         ctermbg=NONE        cterm=NONE
hi Character        ctermfg=red         ctermbg=NONE        cterm=NONE

hi Number           ctermfg=green       ctermbg=NONE        cterm=NONE
hi Float            ctermfg=green       ctermbg=NONE        cterm=NONE

hi Function         ctermfg=cyan        ctermbg=NONE        cterm=NONE
hi Identifier       ctermfg=cyan        ctermbg=NONE        cterm=NONE

hi Todo             ctermfg=yellow      ctermbg=NONE        cterm=NONE
hi SpecialComment   ctermfg=yellow      ctermbg=NONE        cterm=NONE
hi Debug            ctermfg=yellow      ctermbg=NONE        cterm=NONE

hi Delimiter        ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi Special          ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi SpecialChar      ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi Tag              ctermfg=NONE        ctermbg=NONE        cterm=NONE

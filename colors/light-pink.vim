highlight clear
if exists("syntax_on")
    syntax reset
endif
if has('termguicolors')
    set termguicolors
endif

let g:colors_name = 'light-pink'

function! s:highlight(group, fg, bg, style)
  let gui = a:style == '' ? '' : 'cterm=' . a:style
  let fg = a:fg == '' ? '' : 'guifg=' . a:fg
  let bg = a:bg == '' ? '' : 'guibg=' . a:bg
  exec 'hi ' . a:group . ' ' . bg . ' ' . fg  . ' ' . gui
endfunction

function! s:highlightLink(from, to)
  exec 'hi! link ' . a:from . ' ' . a:to
endfunction

let s:Colors = [
      \ '#BA9AB9', '#F1897F', '#777777', '#E17092',
      \ '#9466AA', '#9D3C5E', '#B08B35', '#1F6E89',
      \ '#FF7AB3', '#F5F5F5', '#D6D1E8', '#736A6D',
      \ '#C46B81', '#F3D5B9', '#555555', '#F2F8FC',
      \ '#93C6D6', '#FFEAEA', '#C73D20', '#B08B35',
      \ '#1F6E89'
      \ ]

let s:highlights = [
      \ { 'group': 'Normal'       ,'fg': ''           ,'bg': s:Colors[9]  ,'style': '' },
      \ { 'group': 'Comment'      ,'fg': s:Colors[0]  ,'bg': ''           ,'style': 'italic' },
      \ { 'group': 'Error'        ,'fg': s:Colors[1]  ,'bg': s:Colors[17] ,'style': '' },
      \ { 'group': 'Operator'     ,'fg': s:Colors[2]  ,'bg': ''           ,'style': '' },
      \ { 'group': 'Keyword'      ,'fg': s:Colors[3]  ,'bg': ''           ,'style': '' },
      \ { 'group': 'PreProc'      ,'fg': s:Colors[3]  ,'bg': ''           ,'style': 'bold' },
      \ { 'group': 'Identifier'   ,'fg': s:Colors[4]  ,'bg': ''           ,'style': '' },
      \ { 'group': 'Type'         ,'fg': s:Colors[4]  ,'bg': ''           ,'style': 'bold' },
      \ { 'group': 'Function'     ,'fg': s:Colors[5]  ,'bg': ''           ,'style': 'bold' },
      \ { 'group': 'Constant'     ,'fg': s:Colors[6]  ,'bg': ''           ,'style': '' },
      \ { 'group': 'String'       ,'fg': s:Colors[7]  ,'bg': ''           ,'style': '' },
      \ { 'group': 'StatusLine'   ,'fg': s:Colors[9]  ,'bg': s:Colors[8]  ,'style': '' },
      \ { 'group': 'SignColumn'   ,'fg': ''           ,'bg': s:Colors[9]  ,'style': '' },
      \ { 'group': 'CursorLine'   ,'fg': ''           ,'bg': s:Colors[10] ,'style': '' },
      \ { 'group': 'LineNr'       ,'fg': s:Colors[11] ,'bg': ''           ,'style': '' },
      \ { 'group': 'CursorLineNr' ,'fg': s:Colors[12] ,'bg': ''           ,'style': '' },
      \ { 'group': 'Search'       ,'fg': ''           ,'bg': s:Colors[13] ,'style': '' },
      \ { 'group': 'VertSplit'    ,'fg': s:Colors[14] ,'bg': s:Colors[9]  ,'style': '' },
      \ { 'group': 'Pmenu'        ,'fg': ''           ,'bg': s:Colors[15] ,'style': '' },
      \ { 'group': 'PmenuSel'     ,'fg': ''           ,'bg': s:Colors[16] ,'style': '' },
      \ { 'group': 'DiffDelete'   ,'fg': s:Colors[18] ,'bg': ''           ,'style': '' },
      \ { 'group': 'DiffChange'   ,'fg': s:Colors[19] ,'bg': ''           ,'style': '' },
      \ { 'group': 'DiffAdd'      ,'fg': s:Colors[20] ,'bg': ''           ,'style': '' },
      \ { 'group': 'DiffAdd'      ,'fg': ''           ,'bg': 'Gray'       ,'style': '' },
      \ { 'group': 'MatchParen'   ,'fg': ''           ,'bg': 'Gray'       ,'style': '' },
      \ { 'group': 'ErrorMsg'     ,'fg': 'Red'        ,'bg': ''           ,'style': '' },
      \ ]

let s:highlightlinks = [
      \ { 'from': 'NonText'      ,'to': 'Comment' },
      \ { 'from': 'Folded'       ,'to': 'Comment' },
      \ { 'from': 'Whitespace'   ,'to': 'Comment' },
      \ { 'from': 'Repeat'       ,'to': 'Conditional' },
      \ { 'from': 'CursorLineNr' ,'to': 'Identifier' },
      \ { 'from': 'Conditional'  ,'to': 'Operator' },
      \ { 'from': 'Macro'        ,'to': 'Function' },
      \ { 'from': 'Statement'    ,'to': 'Keyword' },
      \ { 'from': 'Operator'     ,'to': 'Keyword' },
      \ { 'from': 'Title'        ,'to': 'Keyword' },
      \ { 'from': 'Special'      ,'to': 'Keyword' },
      \ { 'from': 'Label'        ,'to': 'Keyword' },
      \ { 'from': 'StorageClass' ,'to': 'Keyword' },
      \ { 'from': 'Structure'    ,'to': 'Keyword' },
      \ { 'from': 'include'    ,'to': 'Keyword' },
      \ { 'from': 'ColorColumn'  ,'to': 'CursorLine' },
      \ { 'from': 'Visual'       ,'to': 'CursorLine' },
      \ { 'from': 'Number'       ,'to': 'Constant' },
      \ { 'from': 'Wildmenu'     ,'to': 'SignColumn' },
      \ { 'from': 'IncSearch'    ,'to': 'Search' },
      \ { 'from': 'StatusLineNC' ,'to': 'StatusLine' }
      \ ]

for hl in s:highlights
  call s:highlight(hl.group, hl.fg, hl.bg, hl.style)
endfor

for hll in s:highlightlinks
  call s:highlightLink(hll.from, hll.to)
endfor

set background=light
syntax on

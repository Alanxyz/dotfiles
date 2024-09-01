" Vim syntax file
" Language: markdown with wikilinks, bold headers, hashtags, and LaTeX highlighting
syntax clear  

if exists("b:current_syntax")
  finish
endif

syn case match

" Wikilinks: [[Link]]
syn match markdownWikiLink "\[\[.\{-}\]\]" containedin=ALL
hi markdownWikiLink ctermfg=6

" Headers: # Header
syn match markdownHeader "^#\{1,6\} .*"
hi markdownHeader cterm=bold

" Hashtags: #hashtag
syn match markdownHashtag "#\w\+"
hi markdownHashtag ctermfg=5

" LaTeX: $latex$ and $$latex$$, including the content
syn region markdownLaTeX start="\$\$" end="\$\$"
syn region markdownLaTeX start="\$" end="\$"
hi markdownLaTeX ctermfg=3

" Bold text: **bold**
syn match markdownBold "\*\*.\{-}\*\*"
hi def link markdownBold Bold

" Italic text: *italic*
syn match markdownItalic "_.\{-}_"
hi markdownItalic cterm=italic

" Blockquotes: > Quote
syn match markdownBlockquote "^>.*"
hi def link markdownBlockquote Comment

" Code blocks: ``` code ```
syn region markdownCodeBlock start="```" end="```" keepend
hi def link markdownCodeBlock PreProc

" Inline code: `code`
syn match markdownInlineCode "`[^`]\{-}`"
hi def link markdownInlineCode Constant

" Links: [text](url)
syn match markdownLink "\[\zs[^]]\+\ze\](.*)"
hi def link markdownLink Underlined

" Lists: - Item or * Item
" syn match markdownList "^[-*]\s\+"
" hi def link markdownList Special

" Set syntax name
let b:current_syntax = "markdown"


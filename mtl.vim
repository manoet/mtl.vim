" MIT License
"
" Copyright (c) 2020 Marco Giglio
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in all
" copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
" SOFTWARE.

syn clear

syn case match

syn keyword mtlVisibility       public protected private contained
syn keyword mtlTagName          module import contained
syn keyword mtlTagName          template query contained
syn keyword mtlTagName          if then else elseif endif for let in contained
syn keyword mtlTagName          not and or xor contained

syn keyword mtlType             Object String Boolean Integer contained
syn keyword mtlType             Sequence Collection OrderedSet contained

syn keyword mtlConstant         true false contained
syn match mtlConstant           '[^a-zA-Z][0-9][^a-zA-Z]'hs=s+1,he=e-1
syn region mtlString            start=/'/ end=/'/ contained

syn region mtlTag               matchgroup=mtlTagName start='\[' end='[/]\?\]' fold contains=mtlTagName,mtlVisibility,mtlConstant,mtlString,mtlComment,mtlType
syn region mtlTagEnd            matchgroup=mtlTagName start='\[/' end='\]' contains=mtlTagName

" NB: comments must be defined after generic regions in order to gain priority
" and be rendered properly.
syn keyword mtlTodo             NB TODO XXX FIXME contained
syn region mtlComment           start='\[comment[ \s\n]' end='/\]' contains=mtlTodo
syn region mtlComment           start='\[comment\]' end='\[/comment\]' contains=mtlTodo
syn region mtlComment           start='\[\*' end='/\]' contains=mtlTodo
syn region mtlComment           start='/\*' end='\*/' contains=mtlTodo

hi def link mtlTodo             Todo
hi def link mtlComment          Comment
hi def link mtlConstant         Constant
hi def link mtlString           String
hi def link mtlType             Type
hi def link mtlTag              Function
hi def link mtlTagName          Keyword
hi def link mtlVisibility       Keyword

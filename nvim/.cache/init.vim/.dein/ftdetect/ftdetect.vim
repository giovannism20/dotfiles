au BufNewFile,BufRead *.vue,*.wpy setf vue
autocmd BufReadPost *.fugitiveblame setfiletype fugitiveblame
" vint: -ProhibitAutocmdWithNoGroup

autocmd BufRead,BufNewFile *.rs setf rust
autocmd BufRead,BufNewFile Cargo.toml if &filetype == "" | set filetype=cfg | endif

" vim: set et sw=4 sts=4 ts=8:
autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
" Detect syntax file.
autocmd BufNewFile,BufRead *.snip,*.snippets set filetype=neosnippet
" vint: -ProhibitAutocmdWithNoGroup

" don't spam the user when Vim is started in Vi compatibility mode
let s:cpo_save = &cpo
set cpo&vim

" Note: should not use augroup in ftdetect (see :help ftdetect)
au BufRead,BufNewFile *.go setfiletype go
au BufRead,BufNewFile *.s setfiletype asm
au BufRead,BufNewFile *.tmpl setfiletype gohtmltmpl

" remove the autocommands for modsim3, and lprolog files so that their
" highlight groups, syntax, etc. will not be loaded. *.MOD is included, so
" that on case insensitive file systems the module2 autocmds will not be
" executed.
au! BufRead,BufNewFile *.mod,*.MOD
" Set the filetype if the first non-comment and non-blank line starts with
" 'module <path>'.
au BufRead,BufNewFile go.mod call s:gomod()

fun! s:gomod()
  for l:i in range(1, line('$'))
    let l:l = getline(l:i)
    if l:l ==# '' || l:l[:1] ==# '//'
      continue
    endif

    if l:l =~# '^module .\+'
      setfiletype gomod
    endif

    break
  endfor
endfun

" restore Vi compatibility settings
let &cpo = s:cpo_save
unlet s:cpo_save

" vim: sw=2 ts=2 et
" Copyright (c) 2015-present, Facebook, Inc. All rights reserved.

au BufRead,BufNewFile *.re set filetype=reason
au BufRead,BufNewFile *.rei set filetype=reason
au BufNewFile,BufRead .merlin       set ft=merlin
autocmd BufNewFile,BufRead *.json setlocal filetype=json
autocmd BufNewFile,BufRead *.jsonl setlocal filetype=json
autocmd BufNewFile,BufRead *.jsonp setlocal filetype=json
autocmd BufNewFile,BufRead *.geojson setlocal filetype=json
autocmd BufNewFile,BufRead *.template setlocal filetype=json
autocmd BufNewFile,BufRead *.markdown,*.md,*.mdown,*.mkd,*.mkdn,*.mdwn
      \ if &ft =~# '^\%(conf\|modula2\)$' |
      \   set ft=markdown |
      \ else |
      \   setf markdown |
      \ endif
autocmd BufNewFile,BufRead {.,}tmux*.conf set ft=tmux | compiler tmux
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim ftdetect file
"
" Language: JSX (JavaScript)
" Maintainer: Max Wang <mxawng@gmail.com>
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Whether the .jsx extension is required.
if !exists('g:jsx_ext_required')
  let g:jsx_ext_required = 0
endif

" Whether the @jsx pragma is required.
if !exists('g:jsx_pragma_required')
  let g:jsx_pragma_required = 0
endif

let s:jsx_pragma_pattern = '\%^\_s*\/\*\*\%(\_.\%(\*\/\)\@!\)*@jsx\_.\{-}\*\/'

" Whether to set the JSX filetype on *.js files.
fu! <SID>EnableJSX()
  if g:jsx_pragma_required && !exists('b:jsx_ext_found')
    " Look for the @jsx pragma.  It must be included in a docblock comment
    " before anything else in the file (except whitespace).
    let b:jsx_pragma_found = search(s:jsx_pragma_pattern, 'npw')
  endif

  if g:jsx_pragma_required && !b:jsx_pragma_found | return 0 | endif
  if g:jsx_ext_required && !exists('b:jsx_ext_found') | return 0 | endif
  return 1
endfu

autocmd BufNewFile,BufRead *.jsx let b:jsx_ext_found = 1
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.js
  \ if <SID>EnableJSX() | set filetype=javascript.jsx | endif

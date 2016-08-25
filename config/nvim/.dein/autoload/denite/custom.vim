"=============================================================================
" FILE: custom.vim
" AUTHOR: Shougo Matsushita <Shougo.Matsu at gmail.com>
" License: MIT license
"=============================================================================

function! denite#custom#get(source_name) abort "{{{
  let source = copy(denite#custom#get_source_var(a:source_name))
  return extend(source, s:custom._, 'keep')
endfunction"}}}

function! denite#custom#get_source_var(source_name) abort "{{{
  if !exists('s:custom')
    let s:custom = {}
    let s:custom._ = {}
  endif

  if !has_key(s:custom, a:source_name)
    let s:custom[a:source_name] = {}
  endif

  return s:custom[a:source_name]
endfunction"}}}

function! denite#custom#set(source_name, option_name, value) abort "{{{
  for key in split(a:source_name, '\s*,\s*')
    let custom_source = denite#custom#get_source_var(key)
    let custom_source[a:option_name] = a:value
  endfor
endfunction"}}}

" vim: foldmethod=marker

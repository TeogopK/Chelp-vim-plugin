if exists('g:chelp_loaded') || &cp
  finish
endif

let g:chelp_loaded = '0.0.1' " version number
let s:keepcpo = &cpo
set cpo&vim


let g:chelp_headers_to_add = []

if !exists('g:chelp_save_cursor')
	let g:chelp_save_cursor = 1
endif

if !exists('g:chelp_first_header_only')
	let g:chelp_first_header_only = 0
endif


nnoremap <silent> <Plug>(ChelpShow) :<C-U>exe v:count .. "ChelpShow"<cr>
nnoremap <silent> <Plug>(ChelpAddHidden) :<C-U>exe v:count .. "ChelpAddHidden"<cr>

command! -nargs=* -count ChelpShow call chelp#ChelpShow(<count>, <q-args>)
command! -nargs=* -count ChelpAddHidden call chelp#AddHeadersHidden(<count>, <q-args>)


let &cpo = s:keepcpo
unlet s:keepcpo

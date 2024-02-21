scriptversion 4

function! s:getManScript(count, word)
	let number = a:count
	let word = a:word

	if word == ''
		let word = expand('<cword>')
	endif

	let script = "man "

	if number > 0 && number < 10
		let script = script .. number .. " "
	endif

	let script = script .. shellescape(word)

	return script
endfunction

function! s:getManPageAsString(count, word)

	let script = s:getManScript(a:count, a:word)

	return system(script)
endfunction

function! chelp#ChelpShow(count, word)
	let manpage = s:getManPageAsString(a:count, a:word)

	if v:shell_error != 0
		echomsg "Error: " trim(manpage)
		return
	endif

	new | set buftype=nofile filetype=man | call setline(1, split(manpage, '\n'))
endfunction

function! s:getHeadersToAdd(regex, text)

	let g:chelp_headers_to_add = []
	let end_str = 0

	while 1
		let [header, start_str, end_str] = matchstrpos(a:text, a:regex, end_str)

		if end_str < 0
			break
		endif

		call add(g:chelp_headers_to_add, header)

		if g:chelp_first_header_only == 1
			break
		endif
	endwhile

	call uniq(sort(g:chelp_headers_to_add))	
	"exe "%s/" .. a:regex .. "/\=add(g:m, submatch(0))/gn"

endfunction

function! s:addHeaders()
	let count_added = 0

	exe "norm! gg"
	for header in g:chelp_headers_to_add

		if search(header, "Wnc") > 0
			echomsg "skipping" header
			continue
		endif

		echomsg "pasting" header
		call append(line('^'), header)

		let count_added += 1
	endfor	

	if count_added == 0
		echomsg "All header are already added"
	endif


	if g:chelp_save_cursor
		"call setpos('.', save_cursor)
		exec "normal! ``"
	endif

endfunction

function! chelp#AddHeadersHidden(count, word)
	let manpage = s:getManPageAsString(a:count, a:word)

	if v:shell_error != 0
		echomsg "Error: " trim(manpage)
		return
	endif

	call s:getHeadersToAdd('#include\s*[<"].\{-}[>"]', manpage)

	if empty(g:chelp_headers_to_add)

		echomsg("Error: No headers found!")
		return
	endif

	call s:addHeaders()
endfunction

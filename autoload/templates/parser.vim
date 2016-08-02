function! templates#parser#CurrentFile()
    return expand('%:t')
endfunction

function! templates#parser#CurrentTime()
    return strftime(g:templates_time_format)
endfunction

function! templates@parser#GitAuthor()
    return substitute(system('git config user.name 2>/dev/null'), '\v\C\r|\n', '', 'g')
endfunction

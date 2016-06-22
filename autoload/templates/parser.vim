function! templates#parser#CurrentFile()
    return expand('%:t')
endfunction

function templates#parser#CurrentTime()
    return strftime(g:templates_time_format)
endfunction

" File Name: parser.vim
" Author: cissoid
" Created At: 2017-03-01T18:24:03+0800
" Last Modified: 2018-11-06T17:04:47+0800
scriptencoding utf-8

function! templates#parser#CurrentFile()
    return expand('%:t')
endfunction

function! templates#parser#CurrentDir()
    return expand('%:h:t')
endfunction

function! templates#parser#CurrentTime()
    return strftime(g:templates_time_format)
endfunction

function! templates#parser#GitAuthor()
    return substitute(system('cd ' . expand('%:h') . ' && ' . 'git config user.name 2>/dev/null'), '\v\C\r|\n', '', 'g')
endfunction

function! templates#parser#CursorLocation()
    return ' '
endfunction

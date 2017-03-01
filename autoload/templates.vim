" File Name: templates.vim
" Author: cissoid
" Created At: 2017-03-01T18:23:28+0800
" Last Modified: 2017-03-01T18:23:42+0800
scriptencoding utf-8

let s:templates_parsers = {
    \ 'CURRENT_FILE': 'templates#parser#CurrentFile',
    \ 'CURRENT_TIME': 'templates#parser#CurrentTime',
    \ 'GIT_AUTHOR': 'templates#parser#GitAuthor'
    \ }

function! s:ParseCommand(parser_args)
    let l:parser_args = split(a:parser_args, '|')
    let l:func_name = l:parser_args[0]
    let l:func_args = l:parser_args[1:]

    if has_key(g:templates_custom_parsers, l:func_name)
        let l:func = g:templates_custom_parsers[l:func_name]
    elseif has_key(s:templates_parsers, l:func_name)
        let l:func = s:templates_parsers[l:func_name]
    else
        return l:func_name
    endif

    return function(l:func, l:func_args)()
endfunction

function! templates#AddFileTemplate()
    let l:template_file = g:templates_folder . &filetype . '.template'
    let l:writecmd = '0read ' . l:template_file
    silent! execute l:writecmd

    let l:exec_line = '1,' . line('$')
    let l:eval_regex = g:templates_exec_start . '(.+)'. g:templates_exec_end
    let l:eval_func = '\=s:ParseCommand(submatch(1))'
    let l:execcmd = l:exec_line . 'substitute/\v\C' . l:eval_regex . '/' . l:eval_func . '/g'
    silent! execute l:execcmd
endfunction

function! templates#UpdateFileTemplate()
    let l:exec_line = '1,' . min([line('$'), g:templates_update_lines])
    let l:modify_regex = '(Last Modified: )@<=(' . g:templates_time_regex . ')'
    let l:modify_regex = '(' . g:templates_modified_prefix . ')@<=(' . g:templates_time_regex . ')(' . g:templates_modified_suffix . ')@='
    let l:eval_func = '\=templates#parser#CurrentTime()'
    silent! normal! mm
    silent! execute l:exec_line . 'substitute/\v\C' . l:modify_regex . '/' . l:eval_func . '/'
    silent! normal! 'm
    silent! execute 'delmarks m'
    silent! normal! zz
endfunction

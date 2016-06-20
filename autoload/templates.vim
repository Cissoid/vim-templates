function! templates#AddFileTemplate()
    let l:template = g:templates_folder . &filetype . '.template'
    echo l:template
    let l:writecmd = '0read ' . l:template
    silent! execute l:writecmd

    let l:exec_line = '1,' . min([line('$'), g:templates_exec_lines])
    let l:eval_regex = g:templates_exec_start . '(.+)'. g:templates_exec_end
    let l:eval_func = '\=eval(submatch(1))'
    let l:execcmd = l:exec_line . 's/\v\C' . l:eval_regex . '/' . l:eval_func . '/g'
    silent! execute l:execcmd
endfunction

function! templates#UpdateFileTemplate()
    let l:exec_line = '1,' . min([line('$'), g:templates_update_lines])
    let l:modify_regex = '(Last Modified: )@<=([0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2})'
    let l:eval_func = '\=eval("strftime(\"%Y-%m-%d %H:%M:%S\")")'
    silent! normal! mm
    silent! execute l:exec_line . 's/\v\C' . l:modify_regex . '/' . l:eval_func . '/'
    silent! normal! 'm
    silent! execute 'delmarks m'
    silent! normal! zz
endfunction

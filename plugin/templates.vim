if exists("g:loaded_templates")
    finish
endif

let g:loaded_templates = 1

if !exists('g:templates_folder')
    let g:templates_folder = '~/.vim/templates/'
endif

if !exists('g:templates_exec_start')
    let g:templates_exec_start = '\[:VIM_EVAL:\]'
endif

if !exists('g:templates_exec_end')
    let g:templates_exec_end = '\[:END_EVAL:\]'
endif

if !exists('g:templates_exec_lines')
    let g:templates_exec_lines = 10
endif

if !exists('g:templates_update_lines')
    let g:templates_update_lines = g:templates_exec_lines
endif

nmap <Leader>at :call templates#AddFileTemplate()<CR>

autocmd! BufWritePre * call templates#UpdateFileTemplate()

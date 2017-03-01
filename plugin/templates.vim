" File Name: templates.vim
" Author: cissoid
" Created At: 2017-03-01T18:24:41+0800
" Last Modified: 2017-03-01T18:26:20+0800
scriptencoding utf-8

if exists("g:loaded_templates")
    finish
endif
let g:loaded_templates = 1

if !exists('g:templates_folder')
    " let g:templates_folder = '~/.vim/templates/'
    let g:templates_folder = expand('<sfile>:p:h:h') . '/templates/'
endif

if !exists('g:templates_exec_start')
    let g:templates_exec_start = '\[:VIM_EVAL:\]'
endif

if !exists('g:templates_exec_end')
    let g:templates_exec_end = '\[:END_EVAL:\]'
endif

if !exists('g:templates_update_lines')
    let g:templates_update_lines = 10
endif

if !exists('g:templates_custom_parsers')
    let g:templates_custom_parsers = {}
endif

if !exists('g:templates_modified_prefix')
    let g:templates_modified_prefix = 'Last Modified: '
endif

if !exists('g:templates_modified_suffix')
    let g:templates_modified_suffix = ''
endif

if !exists('g:templates_time_format')
    let g:templates_time_format = '%FT%T%z'
    let g:templates_time_regex = '[0-9]{4}\-[0-9]{2}\-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}(\+|\-)[0-9]{4}'
endif

nnoremap <Plug>AddFileTemplate :call templates#AddFileTemplate()<CR>

nmap <Leader>at <Plug>AddFileTemplate

autocmd! BufWritePre * call templates#UpdateFileTemplate()

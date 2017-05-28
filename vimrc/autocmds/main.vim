let s:current_dir = g:vimrc_dir . '/autocmds'

call Include(g:vimrc_dir . '/functions/autocmd.vim')
call Include(s:current_dir . '/vimscript.vim')
call Include(s:current_dir . '/lisp.vim')
call Include(s:current_dir . '/rust.vim')
call Include(s:current_dir . '/nasm.vim')
call Include(s:current_dir . '/shell.vim')
call Include(s:current_dir . '/latex.vim')
call Include(s:current_dir . '/julia.vim')
call Include(s:current_dir . '/forth.vim')

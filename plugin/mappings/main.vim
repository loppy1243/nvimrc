let s:current_dir = g:vimrc_dir . '/mappings'

call Include(s:current_dir . '/normal.vim')
call Include(s:current_dir . '/visual.vim')
call Include(s:current_dir . '/insert.vim')
call Include(s:current_dir . '/abbrev.vim')
call Include(s:current_dir . '/operator.vim')
call Include(s:current_dir . '/motion.vim')


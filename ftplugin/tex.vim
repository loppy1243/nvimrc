"if exists('s:executed')
"  finish
"endif
"let s:executed = 1

setlocal makeprg=pdflatex

" Latex comment sequence
let b:comment_seq = '%'
let b:comment_esc = ''

 " Create begin/end block
nnoremap <buffer> <localleader><localleader> :vimrc#Latex#MakeBlockNormal<space>
vnoremap <buffer> <localleader><localleader> :<c-u>vimrc#Latex#MakeBlockVisual<space>
inoremap <buffer> <C-\> <esc>:vimrc#Latex#MakeBlockNormal<space>
nnoremap <buffer> <localleader>a :vimrc#Latex#MakeBlockInline<space>

nnoremap <buffer> <localleader>ll :call <SID>ViewLatex()<cr>
command! -nargs=? LatexSetMain call <SID>LatexSetMain(<f-args>)
nnoremap <localleader>L :LatexSetMain<cr>
nnoremap <localleader>lk :call jobstop(g:latex_viewer_jobid)<cr>

func! <SID>LatexSetMain(...)
  if a:0 == 0
    let g:latex_main_file = expand('%')
  else
    let g:latex_main_file = expand(a:1)
  endif
endfunc

" Currently assumes it is only called on exit
func! s:ViewLatexHandler(jobid, data, event) dict
  unlet g:latex_viewer_jobid
endfunc
let s:view_latex_handler = funcref('s:ViewLatexHandler')

func! <SID>ViewLatex()
  if exists('g:latex_main_file') && g:latex_main_file !=# ''
    let l:bufnr = bufnr(g:latex_main_file)
    let l:file = g:latex_main_file
  else
    let l:bufnr = bufnr('%')
    let l:file = expand('%')
  endif

  exe 'silent make' l:file

  if g:latex_viewer_jobid
    exe 'silent !kill -SIGHUP' jobpid(g:latex_viewer_jobid)
  else
    let g:latex_viewer_jobid =
    \ jobstart([fnamemodify($MYVIMRC, ':h').'/scripts/start-mupdf.sh',
              \ fnamemodify(l:file, ':r').'.pdf'],
             \ {'on_exit': s:view_latex_handler, 'bufnr': l:bufnr})

    if g:latex_viewer_jobid <= 0
      echoerr 'Failed to start latex viewer. jobstart exit code:' g:latex_viewer_jobid
      unlet g:latex_viewer_jobid
    endif
  endif

  redraw!
endfunc

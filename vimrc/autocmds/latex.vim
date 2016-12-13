augroup latex
  au!
  " Latex comment sequence
  au Filetype tex let b:comment_seq='%'
  " Create begin/end block
  au Filetype tex nnoremap <locallead><localleader> bvedi\begin{<esc>pa}<cr>\end{<esc>pa}O

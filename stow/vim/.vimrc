set ts=4 sw=4
syn on
set hls
set cm=blowfish
colo elflord

set runtimepath^=~/.vim/bundle/ctrlp.vim
execute pathogen#infect()
filetype plugin indent on
"map <C-n> :NERDTreeToggle <enter>

augroup CPT
  au!
  au BufReadPre *.cpt set bin
  au BufReadPre *.cpt set viminfo=
  au BufReadPre *.cpt set noswapfile
  au BufReadPost *.cpt let $vimpass = inputsecret("Password: ")
  au BufReadPost *.cpt silent '[,']!ccrypt -cb -E vimpass
  au BufReadPost *.cpt set nobin
  au BufWritePre *.cpt set bin
  au BufWritePre *.cpt '[,']!ccrypt -e -E vimpass
  au BufWritePost *.cpt u
  au BufWritePost *.cpt set nobin
augroup END

augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

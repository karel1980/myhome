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

function! DelTagOfFile(file)
  let fullpath = a:file
  let cwd = getcwd()
  let tagfilename = cwd . "/tags"
  let f = substitute(fullpath, cwd . "/", "", "")
  let f = escape(f, './')
  let cmd = 'sed -i "/' . f . '/d" "' . tagfilename . '"'
  let resp = system(cmd)
endfunction

function! UpdateTags()
  let f = expand("%:p")
  let cwd = getcwd()
  let tagfilename = cwd . "/tags"
  let cmd = 'ctags -a -f ' . tagfilename
  call DelTagOfFile(f)
  let resp = system(cmd)
endfunction
autocmd BufWritePost *.ts call UpdateTags()

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Disable swp files because https://github.com/ember-cli/ember-cli/issues/2329
set wildignore+=*.swp,*~,._*

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

set number
highlight LineNr ctermfg=yellow
set diffopt+=iwhite

if &diff
    colorscheme ron
endif

autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype python setlocal ts=4 sts=4 sw=4
autocmd Filetype c setlocal ts=4 sts=4 sw=4
autocmd Filetype c++ setlocal ts=4 sts=4 sw=4

:command W w
:command Q q
:command Wq wq
:command WQ wq

:command SpellOn setlocal spell spelllang=en_us
:command SpellOff setlocal nospell

function! Clean()
    retab
    let winview = winsaveview()
    normal gg=G
    call winrestview(winview)
    %s/\s\+$//e
endfunction
command! -nargs=0 Clean :call Clean()

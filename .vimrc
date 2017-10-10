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


execute pathogen#infect()
execute pathogen#helptags()
syntax on
filetype plugin indent on
:set colorcolumn=+1        " highlight column after 'textwidth'
:set colorcolumn=+1  " highlight three columns after 'textwidth'
:highlight ColorColumn ctermbg=lightgrey guibg=lightgrey

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


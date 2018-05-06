set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ervandew/supertab'
Plugin 'easymotion/vim-easymotion'
Plugin 'lervag/vimtex'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'VundleVim/Vundle.vim'


Plugin 'l04m33/vlime', {'rtp': 'vim/'}
Plugin 'rustushki/JavaImp.vim'

call vundle#end()            " required

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
" When I need to use error checking I simply hit: ctrl-w E
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Use zathura for vimtex
let g:vimtex_view_method = 'zathura'

" Use easymotion searching
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

let g:indent_guides_enable_on_vim_startup = 1

let g:syntastic_python_python_exec = '/usr/bin/python3'
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


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

syntax enable
set background=dark
colorscheme ron

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


syntax on
:set colorcolumn=+1        " highlight column after 'textwidth'
:set colorcolumn=+1  " highlight three columns after 'textwidth'
:highlight ColorColumn ctermbg=lightgrey guibg=lightgrey

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'wakatime/vim-wakatime'

call plug#end()

set number

let g:rustfmt_autosave = 1
let g:syntastic_rust_checkers = ['cargo']

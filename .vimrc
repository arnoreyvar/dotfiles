
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
Plug 'wlangstroth/vim-racket'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'arzg/vim-colors-xcode'
Plug 'mileszs/ack.vim'
call plug#end()

if executable('rg')
    set grepprg=rg\ --vimgrep
    set grepformat=%f:%l:%c:%m
    let g:ackprg = 'rg --vimgrep'
endif

set number relativenumber

set tabstop=2

" Indent using spaces instead of tabs
set expandtab

" The number of spaces to use for each indent
set shiftwidth=2

" Number of spaces to use for a <Tab> during editing operations
set softtabstop=2"

" add fzf to runtime path
set rtp+=/usr/local/opt/fzf

" Available themes [xcodedark, xcodelight, xcodedarkhc, xcodelighthc,
" xcodewwdc] see: https://github.com/arzg/vim-colors-xcode
colorscheme xcodedark

" FORMATTERS
au FileType javascript setlocal formatprg=prettier
au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType typescript.tsx setlocal formatprg=prettier\ --parser\ typescript
au FileType html setlocal formatprg=js-beautify\ --type\ html
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ css
au FileType racket set lisp
au FileType racket set autoindent
au BufReadPost *.rkt,*.rktl set filetype=racket

let g:jsx_ext_required = 0

let g:ale_linters = {
\   'javascript': ['standard'],
\   'typescript': ['standard'],
\   'javascriptreact': ['standard'],
\   'typescriptreact': ['standard'],
\}

let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'javascriptreact': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'typescriptreact': ['prettier', 'eslint'],
\   'scss': ['prettier'],
\   'json': ['prettier'],
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_linters_explicit = 1
let g:ale_lint_on_save = 0
let g:ale_fix_on_save = 0

let g:ack_use_dispatch = 0

let mapleader=","
noremap \ ,

map <C-n> :NERDTreeToggle<CR>
nnoremap <leader>af :ALEFix<cr>
"Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

" Move between window
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

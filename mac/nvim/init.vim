" vim-plug
if has('win32')
  source $HOME/appdata/local/nvim/plugged.vim
else
  source $HOME/.config/nvim/plugged.vim
endif

" Python path
" let g:python3_host_prog='/usr/bin/python3'

"Easy Motion Configuration"
map <Leader> <Plug>(easymotion-prefix)
map f <Plug>(easymotion-bd-w)
let g:EasyMotion_use_upper=1
let g:EasyMotion_keys='SADFJKLEWCMPGH'
let g:Easymotion_smartcase=1
let g:EasyMotion_use_smartsign_us=1

" change the leader key from "\" to "," (";" is also popular)
let mapleader=","

" Maping shift-colon to just colon in normal mode"
nnoremap ; :
" Mapping L (end of line) to $ in normal mode
nnoremap L $

" change the leader key from "\" to "," (";" is also popular)
let mapleader=","

" Maping shif-colon to just colon in normal mode"
nnoremap ; :
" Mapping L (end of line) to $ in normal mode
nnoremap L $
" Mouse support
set mouse=a

" Text width
set textwidth=80
set formatoptions+=tcb
" Color theme
" If terminal background colour is different than uncomment the below line
set termguicolors
filetype plugin indent on
syntax on
colorscheme gruvbox
let g:gruvbox_invert_selection=0

" Identation
set expandtab shiftwidth=2 softtabstop=2 tabstop=4 textwidth=120
set modeline

" Fold method
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" Line numbers
set number
"set relativenumber

" Highlight the current line
set cursorline

" Yes, the space exists
set list lcs=tab:\¦\

" To break long lines
set breakindent
set breakindentopt=shift:2
set showbreak=↳

" Set clipboard
set clipboard=unnamed

" ignores cases for search
set ignorecase

" Icons
let g:lightline#bufferline#enable_devicons = 1

" Copy to clipboard
vnoremap y "+y
nnoremap Y "+yg_
nnoremap y "+y
nnoremap yy "+yy

" Paste from clipboard
nnoremap P "+P
nnoremap p "+p
vnoremap P "+P
vnoremap p "+p

" To execute a macro over visual line selections
xnoremap Q :'<,'>:normal @q<CR>

" To replace stuff globally
set gdefault

" Using tab to move to right when inside brackets
" inoremap <expr> <Tab> search('\%#[]>)}]', 'n') ? '<Right>' : '<Tab>'

"#############################
" Plugin settings
"#############################

" Nerd Commenter
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=0 " Show hidden files in NerdTree buffer.

" Split windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Coc
let g:coc_global_extensions = [
      \'coc-word',
      \'coc-syntax',
      \'coc-spell-checker',
      \'coc-snippets',
      \'coc-prettier',
      \'coc-pairs',
      \'coc-lists',
      \'coc-highlight',
      \'coc-git',
      \'coc-emoji',
      \'coc-dictionary',
      \'coc-calc',
      \'coc-actions',
      \'coc-markdownlint',
      \'coc-json',
      \'coc-jedi',
      \'coc-docker',
      \'coc-clangd',
      \'coc-cmake',
      \'coc-yaml',
      \'coc-vimtex',
\]

" Tab completion for coc-snippets like VSCode
inoremap <silent><expr> <TAB>
       \ pumvisible() ? coc#_select_confirm() :
       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
       \ <SID>check_back_space() ? "\<TAB>" :
       \ coc#refresh()

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#confirm() : "\<Tab>"
" inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<Tab>"
"Coc ends here finally }}}
"
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"  " use <Tab> to trigger autocompletion
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Markdown preview
let g:mkdp_auto_close=0  


" Latex
" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note that most plugin managers will do this automatically.
filetype plugin indent on

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
syntax enable

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'skim'

" Or with a generic interface:
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ":help vimtex-compiler".
let g:vimtex_compiler_method = 'latexmk'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = ","
let g:vimtex_compiler_latexmk = {'build_dir': {-> expand("%:t:r")}}


" Text conceal
" {
set conceallevel=2
let g:tex_conceal="abdgm"
"}

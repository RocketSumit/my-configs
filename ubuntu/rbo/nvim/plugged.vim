if has('win32')
    let $VIMPLUGDIRECTORY = '~/appdata/local/nvim-data/plugged'
else
    let $VIMPLUGDIRECTORY = '~/.local/share/nvim/plugged'
endif

function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

  " neovim settings for ordinary vim
call plug#begin($VIMPLUGDIRECTORY)

" Gruvbox theme
Plug 'morhetz/gruvbox'
" To avoid jk mappings
Plug 'zhou13/vim-easyescape'
" Maintain a histroy of undo in a tree structure
Plug 'mbbill/undotree'
" Easy motion
Plug 'easymotion/vim-easymotion'
" Plug 'https://github.com/asvetliakov/vim-easymotion.git'
" A fuzzy file finder
Plug 'kien/ctrlp.vim'
" Comment/Uncomment tool
Plug 'scrooloose/nerdcommenter'
" Switch to the begining and the end of a block by pressing %
Plug 'tmhedberg/matchit'
" A Tree-like side bar for better navigation
Plug 'scrooloose/nerdtree'
" A cool status bar
Plug 'vim-airline/vim-airline'
" Airline themes
Plug 'vim-airline/vim-airline-themes'
" Nord
Plug 'arcticicestudio/nord-vim'
" Better syntax-highlighting for filetypes in vim
Plug 'sheerun/vim-polyglot'
" Intellisense engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Git integration
Plug 'tpope/vim-fugitive'
" Auto-close braces and scopes
Plug 'jiangmiao/auto-pairs'
" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': ':call mkdp#util#install()', 'for': 'markdown' }
" Syntax highlighting, matching rules and mappings for the original Markdown and extensions
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
" Tabular
Plug 'godlygeek/tabular'
" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" distraction-free writing
Plug 'junegunn/limelight.vim'
" Vim surround
Plug 'tpope/vim-surround'
" Github copilot
Plug 'github/copilot.vim', Cond(!exists('g:vscode'))

call plug#end()

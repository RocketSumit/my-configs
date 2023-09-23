if has('win32')
    let $VIMPLUGDIRECTORY = '~/appdata/local/nvim-data/plugged'
else
    let $VIMPLUGDIRECTORY = '~/.local/share/nvim/plugged'
endif

  " neovim settings for ordinary vim
call plug#begin($VIMPLUGDIRECTORY)

" Gruvbox theme
Plug 'morhetz/gruvbox'
" To use jk mappings to go to normal mode
Plug 'jdhao/better-escape.vim'
" Maintain a histroy of undo in a tree structure
Plug 'mbbill/undotree'
" Easy motion
Plug 'easymotion/vim-easymotion'
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
Plug 'plasticboy/vim-markdown'
" Tabular
Plug 'godlygeek/tabular'
" distraction-free writing
Plug 'junegunn/limelight.vim'
" File finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.3' }
" Highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
"Black python file formatter
Plug 'python/black'
" Surrounding words with '([])'
Plug 'tpope/vim-surround'
" Dev icons
Plug 'ryanoasis/vim-devicons' 
" Code completion
Plug 'Exafunction/codeium.vim'
" Tag bar - classes, functions
Plug 'preservim/tagbar'
" Latex
Plug 'lervag/vimtex'
call plug#end()

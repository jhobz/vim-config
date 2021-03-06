" .vimrc from https://github.com/thcipriani/dotfiles/blob/master/vimrc
" with slight alterations

" Vim. Live it. ------------------------------------------------------- {{{
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" }}}

" What is this 'Vee-Eye' of which you speak? -------------------------- {{{
set nocompatible
" }}}

" Lifesaver ----------------------------------------------------------- {{{
if &term =~ '256color'
   "Disable Background Color Erase (BCE) so that color schemes
   "work properly when Vim is used inside tmux and GNU screen.
   "See also http://snk.tuxfamily.org/log/vim-256color-bce.html
   " May be unnecessary see:
   " http://www.reddit.com/r/vim/comments/1a29vk/fixing_vims_background_color_erase_for_256color/c8thqe7
   set t_ut=
endif
" }}}

" Basic options ------------------------------------------------------- {{{
let mapleader=','
set t_Co=256              " My terminal's got all those colors, yo

set title                 " Change the terminal title
set encoding=utf-8        " Show utf-8 chars
set showcmd               " count highlighted
set ruler                 " Show where I am in the command area
set showmode              " -- INSERT (appreciation)-- :)
set laststatus=2          " always show the status line
                          " ↪ (0 = never, 1 = default [multi-window only])
set mouse=a               " Use the mouse

set modelines=0           " Don't read first/last lines of file for settings
set hidden                " Stash unwritten files in buffer
"set vb                    " Don't beep at me
set cursorline            " Highlight current line
set scrolloff=3           " Start scrolling when I'm 3 lines from top/bottom
set history=1000          " Remember commands and search history
set backspace=2           " Backspace over indent, eol, and insert
set mousehide             " Hide the mouse pointer while typing

set binary                " Don’t add empty newlines at the end of files
set noeol

set number                " Show linenumbers
set nowrap                " Turn off linewrap
set list                  " Show invisible chars
set tabstop=4             " 4 spaces
set shiftwidth=4          " 4 spaces
set softtabstop=4         " 4 spaces
"set expandtab             " Expand tabs to spaces

set hlsearch              " highlight my search
set incsearch             " incremental search
set wrapscan              " Set the search scan to wrap around the file
set splitright            " Open vertical windows on the right by default

set ignorecase            " when searching
set smartcase             " …unless I use an uppercase character

syntax on                 " Syntax highlighting
syntax sync minlines=256  " Makes big files slow
set synmaxcol=2048        " Also long lines are slow
set autoindent            " try your darndest to keep my indentation
set smartindent           " Be smarter about indenting dummy
set formatoptions=tcqr    " I like smart comments

set foldmethod=marker     " Fold on 3x{
set nofoldenable          " But turn it off initially
set shell=/bin/bash\ --login
" set shell=bash            " Needed if using fishshell

"no backup or swap files
set nobackup
set nowritebackup
set noswapfile

" Colorscheme
" https://github.com/altercation/vim-colors-solarized
" colorscheme solarized
" let darkcolorbg='#839496'

set background=dark
let darkcolorbg=234
colorscheme delek
colorscheme Tomorrow-Night

" GUI Font (same as my gnome-terminal font)
" https://github.com/adobe/source-code-pro
set guifont=Source\ Code\ Pro\ 14

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,trail:·

" }}}

" Version 7.3 (703) --------------------------------------------------- {{{
if v:version >= 703
  set colorcolumn=100
  hi ColorColumn ctermbg=234
  set undodir=~/.vim-undo
  set undofile
  set undolevels=1000 "max number of changes that can be undone
  set undoreload=10000 "max number lines to save for undo on buffer reload

  " Toggle line numbers in normal mode, set by default
  set number relativenumber
  function! NumberToggle()
    if(&relativenumber == 1)
      set number norelativenumber
    else
      set number relativenumber
    endif
  endfunc

  nnoremap <leader>n :call NumberToggle()<cr>
endif
" }}}

" Dumb osx -------- --------------------------------------------------- {{{
if has("unix")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
        set clipboard=unnamed
    endif
endif
" }}}

" Convenient Mappings ------------------------------------------------- {{{
" Make regex sane
nnoremap / /\v

" Dumb escape
inoremap JJ <ESC>
vnoremap JJ <ESC>

" Vimrc editing
nnoremap <silent><leader>ev :vsplit $MYVIMRC<cr>
nnoremap <silent><leader>sv :source $MYVIMRC<cr>

" un-highlight search results
nnoremap <silent><leader><space> :noh<cr>

" Toggle auto-indent before clipboard paste
set pastetoggle=<leader>p

" Shortcut to rapidly toggle `set list`
nnoremap <silent><leader>l :set list!<cr>

" Normal/Visual tab for bracket pairs
nnoremap <tab> %
vnoremap <tab> %

"Opens a vertical split and switches over (,v)
nnoremap <leader>v <C-w>v<C-w>l

"Moves around split windows
nnoremap <leader>w <C-w><C-w>

"Close a window
nnoremap <silent><leader>q :q<cr>

" Close buffer
noremap <silent><leader>d :bd<cr>

" Buffer previous
noremap <silent><leader>z :bp<CR>

" Buffer next
noremap <silent><leader>x :bn<CR>

nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew %<CR>

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" Vmap for maintain Visual Mode after shifting > and <, prevents the use of
" '.' to repeat
" vmap < <gv
" vmap > >gv

" Better use of folding
" nnoremap <leader>z za
" }}}

" Status line --------------------------------------------------------- {{{
augroup ft_statuslinecolor
    au!
    au InsertEnter * hi StatusLine ctermfg=196 guifg=#FF3145
    au InsertLeave * hi StatusLine ctermfg=130 guifg=#CD5907
augroup END
set statusline=%f    " Path.
set statusline+=%m   " Modified flag.
set statusline+=%r   " Readonly flag.
set statusline+=%w   " Preview window flag.
set statusline+=\    " Space.
set statusline+=%=   " Right align.
" Line and column position and counts.
set statusline+=\ %l\/%L\ \/\/\ %03c)
" }}}

" Autocmds -------------------------------------------------- {{{
autocmd FileType make setlocal noexpandtab

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

autocmd Filetype php setlocal noexpandtab

" detect puppet filetype
autocmd BufRead,BufNewFile *.pp set filetype=puppet
autocmd BufRead,BufNewFile *.pp setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab textwidth=80 smarttab

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
\ if line("'\"") >= 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif
" }}}

" Plugins? ------------------------------------------------------- {{{
filetype plugin on
" }}}

" Indent Guides ------------------------------------------------------- {{{
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_space_guides = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=none
" }}}
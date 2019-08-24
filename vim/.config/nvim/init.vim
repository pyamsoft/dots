" vimrc symlinked to nvimrc

" Essentials {{{
        autocmd!
        set nocompatible

        " Load vim-plug if not installed
        if empty(glob('~/.config/nvim/autoload/plug.vim'))
          silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
          autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
        endif
" }}}
" Plugins Loading {{{

        " Need the vim-plug plugin from junegunn's GitHub repository
        " $ git clone https://github.com/junegunn/vim-plug.git /usr/share/vim/shared --depth 1

        call plug#begin()

        " Colorschemes {{{
        Plug 'chriskempson/vim-tomorrow-theme'
        " }}}
        " Visual {{{
        Plug 'bling/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        Plug 'junegunn/rainbow_parentheses.vim'
        Plug 'bronson/vim-trailing-whitespace'
        " }}}
        " General {{{
        if has('python3')
          if has('nvim')
            Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
          else
            Plug 'Shougo/deoplete.nvim'
            Plug 'roxma/nvim-yarp'
            Plug 'roxma/vim-hug-neovim-rpc'
          endif
        endif

        Plug 'dense-analysis/ale'
        Plug 'hsanson/vim-android'
        Plug 'mhinz/vim-signify'
        Plug 'tpope/vim-commentary'
        Plug 'tpope/vim-endwise'
        Plug 'tpope/vim-repeat'
        Plug 'tpope/vim-surround'
        Plug 'tpope/vim-apathy'
        Plug 'tpope/vim-fugitive'
        Plug 'tpope/vim-unimpaired'
        Plug 'junegunn/vim-peekaboo'
        Plug 'tmux-plugins/vim-tmux'
        Plug 'tmux-plugins/vim-tmux-focus-events'
        Plug 'Konfekt/FastFold'
        Plug 'sjl/gundo.vim'
        Plug 'rstacruz/vim-closer'
        Plug 'udalov/kotlin-vim'
        Plug 'whiteinge/diffconflicts'
        Plug 'metakirby5/codi.vim'
        Plug 'WolfgangMehner/bash-support'
        Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
        Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
        " }}}

        call plug#end()
" }}}
" Plugins Configuration {{{
" deoplete {{{
        let g:deoplete#enable_at_startup = 1
" }}}
" vim-airline {{{
        let g:airline_theme='tomorrow'
        let g:airline_powerline_font = 0
        let g:airline#extensions#tabline#enabled=1
        let g:airline#extensions#tabline#fnamemod=':t'
        let g:airline#extensions#tabline#left_sep=' '
        let g:airline#extensions#tabline#left_alt_sep='|'
        let g:airline#extensions#tabline#right_sep=' '
        let g:airline#extensions#tabline#right_alt_sep='|'
        let g:airline#extensions#hunks#non_zero_only = 1
        let g:airline#extensions#tabline#buffer_nr_show=1
        let g:airline#extensions#tmuxline#enabled = 0
        let g:airline#extensions#ale#enabled = 1
" }}}
" Gundo {{{
        nnoremap <F5> :GundoToggle<CR>
" }}}
" rainbow_parentheses.vim {{{
        let g:rainbow#max_level = 12
        let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
" }}}
" ale {{{
        " Set this variable to 1 to fix files when you save them.
        " let g:ale_fix_on_save = 1

        " Use ALE and also some plugin 'foobar' as completion sources for all code.
        call deoplete#custom#option('sources', { '_': ['ale'] })

        " Use ALE omnifunc
        set omnifunc=ale#completion#OmniFunc

        " Always show sign gutter
        let g:ale_sign_column_always = 1
" }}}
" }}}
" General Options {{{
        scriptencoding utf-8            " UTF-8 for scripts
        filetype plugin indent on       " Turn on filetype plugins
        syntax on                       " syntax highlighting
        set background=dark             " light backgrounds
        colorscheme Tomorrow-Night      " colorscheme
        set showmode                    " display the current mode
        set cmdheight=2                 " cmdline is 2 row tall
        set cc=80                       " color the 80th column
        set ff=unix                     " files are unix line ending
        set encoding=utf8               " UTF-8 encoding for files
        set ls=2                        " always have statuslines
        set autoindent                  " autoindent
        set smartindent                 " smart indents
        set tabstop=2                   " number of spaces per TAB
        set softtabstop=2               " number of spaces in TAB during edits
        set shiftwidth=2                " number of spaces to use in autoindent
        set shiftround                  " round indents to a multiple of
                                        " shitwidth
        set expandtab                   " TABS made of spaces
        set number                      " line numbers
        set hidden                      " allow switching buffers without save
        set ruler                       " show line and column of cursor
        set smartcase                   " smart case
        set ignorecase                  " ignore case
        set autoread                    " auto read files that have changed
                                        " outside of vim
        set lazyredraw                  " dont redraw during macros
        set noautochdir                 " dont auto cd to the current file
        set eol                         " always write an EOL
        set scrolloff=6                 " keep atleast 6 rows on screen
        set sidescrolloff=6             " keep atleast 6 columns on screen
        set history=500                 " remember last 500 commands
        set undolevels=1000             " undo up to 1000 times
        set updatecount=100             " after writing number of characters
                                        " the swap file will be written to disk
        set updatetime=300              " You will have bad experience for
                                        " diagnostics when it's default 4000.

        set complete=.,w,b,u,U,t,i,d    " Completion options for CTRL-P/N
                                        " w - scan buffers from all windows
                                        " b - scan other loaded buffers in list
                                        " u - scan unloaded buffers in list
                                        " U - scan all buffers not in list
                                        " t - tag completion
                                        " i - scan current and included files
                                        " d - scan current and included for
                                        " defined name or macro
        set noerrorbells                " no bell on error
        set backspace=2                 " fix backspace key in insert mode
        set showmatch                   " show matches
        set formatoptions=l,q           " formatting options
                                        " l - long lines are not broken
                                        " q - allow formatting comments with gq
        set incsearch                   " incremental search
        set hlsearch                    " highlight search results
        set diffopt=filler,iwhite       " settings for diff mode
                                        " show filler lines
                                        " ignore changes to whitespace
        set wildmenu                    " enhanced completion
        set wildmode=list:longest,full  " complete tille longest common, or
                                        " full match
        set ttimeoutlen=50              " millisecond time to wait for keycode
                                        " to complete
        set directory=~/.vim/swp        " dir for swp files, must exist

        set nobackup                    " do not create backups
        set nowritebackup

        set wrap                        " wrap lines longer than window width
        set magic                       " always keep on
        set fdm=marker                  " fold by markers
        if !has('nvim')
                set ttyfast             " fast terminal connection
        endif

        set t_ut=                       " To stop background overriding

        set shortmess+=c                " don't give |ins-completion-menu| messages.
" }}}
" Keybinds {{{
" Leader {{{
        noremap <silent> <Space> <Nop>
        let mapleader="\<Space>"
" }}}
" EX Mode {{{
        noremap <silent> Q <Nop>
" }}}
" Paste Mode {{{
        set pastetoggle=<F2>
" }}}
" Visual Line Mode {{{
        nnoremap <Leader><Leader> V
" }}}
" File Access {{{
        nnoremap <silent> <Leader>w :w<CR>
        nnoremap <silent> <Leader>q :q<CR>
        nnoremap <silent> <Leader>Q :q!<CR>
        nnoremap <silent> <Leader>x :x<CR>
" }}}
" Sourcing the vimrc {{{
        noremap <silent> <Leader>r :source ~/.vimrc<CR>
        noremap <silent> <Leader>R :source /etc/vimrc<CR>
" }}}
" Buffer Navigation {{{
        noremap <silent> <Left> :bprevious<CR>
        noremap <silent> <Right> :bnext<CR>
        noremap <silent> <Leader>d :bdelete<CR>
        noremap <silent> <Leader>D :bdelete!<CR>
        noremap <silent> <Leader>b :ls<CR>:b<Space>
        noremap <silent> <Leader>B :ls<CR>:b<Space>
" }}}
" File Navigation {{{
        noremap <silent> j gj
        noremap <silent> k gk
        noremap <silent> 0 g0
        noremap <silent> $ g$
        noremap <silent> <Up> 10gk
        noremap <silent> <Down> 10gj
" }}}
" Exit insert mode {{{
        " These binds will exit insert mode when pressed
        " for example, 2 'J' in sequence will type 1 J,
        " then delete the J, and exit insert mode

        " For the curious, there are around 4 words in English
        " which contain jj somewhere in them. 'jk' is even less
        " common. In the event that one would need to type 'jj'
        " in text, one would have to type a single j, wait a bit
        " (1 second or so) and then type the second j.
        inoremap <silent> jj <Esc>
        inoremap <silent> jk <Esc>
" }}}
" NERDTree instead of netrw {{{
        nnoremap <silent> - :NERDTreeToggle<CR>
" }}}
" ALE keybinds {{{
        nnoremap <silent> <leader>f :ALEFix<CR>
        xnoremap <silent> <leader>f :ALEFix<CR>
" }}}
" License {{{
        " GPL2 License
        map :gpl2 :0r ~/.vim/licenses/gpl2<CR>

        " Apache2 License
        map :apa2 :0r ~/.vim/licenses/apa2<CR>

        " MIT License
        map :mit :0r ~/.vim/licenses/mit<CR>
" }}}
"}}}
" Autocmds {{{
        if has("autocmd")
                " Set some format options
                autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

                " CursorLine bolds the current line in the active buffer
                hi CursorLine ctermbg=none cterm=bold
                autocmd BufEnter * set cul
                autocmd BufLeave * set nocul

                " Italic comments in terminals that support
                hi Comment ctermbg=none cterm=italic

                " Rainbow Parenthesis
                autocmd BufEnter * RainbowParentheses
                autocmd BufLeave * RainbowParentheses!
        endif
" }}}

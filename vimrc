syntax on

"set hlsearch
hi Search ctermbg=LightYellow
hi Search ctermfg=Red

set nu
set relativenumber
set encoding=UTF-8
set smarttab
set smartindent
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set re=0
set nowrap
set noswapfile
set incsearch
set scrolloff=8
set guicursor=
set mouse=a
set wildmenu
set wildmode=longest:full,full
set nohlsearch

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

call plug#begin()
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'scrooloose/nerdcommenter'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'airblade/vim-gitgutter'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'HerringtonDarkholme/yats.vim'
    Plug 'preservim/nerdtree'
    Plug 'dense-analysis/ale'
    Plug 'vim-airline/vim-airline'
    Plug 'udalov/kotlin-vim'
    Plug 'morhetz/gruvbox'
    Plug 'chriskempson/base16-vim'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'kien/rainbow_parentheses.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'plasticboy/vim-markdown'
    Plug 'kannokanno/previm'
    Plug 'yggdroot/indentline'
    Plug 'vim-scripts/indentpython.vim'
    Plug 'fholgado/minibufexpl.vim'
    Plug 'moll/vim-bbye'
    Plug 'scrooloose/syntastic'
    Plug 'townk/vim-autoclose'
    Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
    Plug 'sheerun/vim-polyglot'
    Plug 'mhinz/vim-startify'
    Plug 'gelguy/wilder.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
    Plug 'tpope/vim-eunuch'
    Plug 'airblade/vim-gitgutter'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
    Plug 'junegunn/goyo.vim'
    Plug 'othree/html5.vim'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tab_count = 1
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_close_button = 1

let g:airline_theme='gruvbox'
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_contrast_light='hard'
let g:gruvbox_invert_selection=0
let g:gruvbox_invert_tabline=1
let g:gruvbox_invert_signs=0
let g:gruvbox_invert_indent_guides=0
let g:gruvbox_invert_qt_syntax=0
let g:gruvbox_invert_minimap=0
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors=0
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2

autocmd vimenter * ++nested colorscheme gruvbox


let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


nnoremap <C-n> :NERDTreeToggle<CR>
" move among buffers with CTRL
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>

" use CTRL + q to close buffer
map <C-Q> :bw<CR>

" use CTRL + w to switch between windows
map <C-W> <C-W> 

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeShowHidden=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrows=1
let g:NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
let g:NERDTreeWinSize=30
let g:NERDTreeChDirMode=2

" customize startify screen by centering it
let g:startify_custom_header = 'startify#center(startify#fortune#cowsay())'

" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

let g:startify_custom_header =
             \ startify#pad(readfile('vim_ascii.txt'))

" Neovim or Vim with yarp
call wilder#set_option('pipeline', [
      \   wilder#branch(
      \     wilder#cmdline_pipeline({'language': has('nvim') ? 'python' : 'vim'}),
      \     wilder#python_search_pipeline(),
      \   ),
      \ ])

" The wildmenu renderer is faster than the popupmenu renderer.
" By default no highlighting is applied.

" call wilder#set_option('renderer', wilder#popupmenu_renderer())
call wilder#set_option('renderer', wilder#wildmenu_renderer())

augroup DIRCHANGE
    au!
    autocmd DirChanged global :NERDTreeCWD
augroup END


" set up vim to use python3
let g:python3_host_prog = '/usr/local/bin/python3'

"set up vim to resolve merge conflicts
let g:diffconflict_author_format = '%an <%ae>'
let g:diffconflict_date_format = '%aI'
let g:diffconflict_timestamp_format = '%at'
let g:diffconflict_diff_format = 'diff'


" set up nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCreateDefaultMappings = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" MARKDOWN STUFF
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" for path with space
" valid: `/path/with\ space/xxx`
" invalid: `/path/with\\ space/xxx`
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or empty for random
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

" set default theme (dark or light)
" By default the theme is define according to the preferences of the system
let g:mkdp_theme = 'dark'

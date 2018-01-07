scriptencoding utf-8
set encoding=utf-8

" All of your Plugins must be added before the following line
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

call vundle#end()
filetype plugin indent on    " required
" ------ functions ----
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
" ------- plugins ------
Plugin 'scrooloose/nerdtree'
"Plugin 'jistr/vim-nerdtree-tabs'
"Plugin 'xkdcc/Session-Viminfo-Management'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'szw/vim-tags'
Plugin 'majutsushi/tagbar'
Plugin 'valloric/youcompleteme'
"Plugin 'SirVer/ultisnips'
Plugin 'wting/gitsessions.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-misc'
Plugin 'easymotion/vim-easymotion'
Plugin 'haya14busa/incsearch-easymotion.vim'
Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-fuzzy.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'yggdroot/indentline'
Plugin 'scrooloose/syntastic'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-fugitive'

let g:solarized_termcolors=256
"set t_Co=16 " For Ubuntu
syntax enable
set background=dark
colorscheme solarized
command! SW :execute ':silent w !sudo tee % > /dev/null' | :edit!
set colorcolumn=90 "code width limit
highlight ColorColumn ctermbg=black guibg=lightgrey
" ------- config --------
"set autochdir
nmap <F3> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>
nmap <F4> i<C-R>=strftime("%Y%m%d%Hh%Mm%Ss")<CR><Esc>
imap <F4> <C-R>=strftime("%Y%m%d%Hh%Mm%Ss")<CR>
set scrolloff=0
set tags+=tags;$HOME
"set exrc                       " Allows per-directory .vimrc --> dangerous
set statusline+=%F
let mapleader = ","
set mouse=a
set ignorecase
set smartcase
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set number                      " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=2                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
"set timeout t8Ximeoutlen=1000 ttimeout ttimeoutlen=100
set timeout timeoutlen=100 ttimeout ttimeoutlen=100
set clipboard=unnamedplus
set cursorline
if &term =~ '^screen'
    set ttymouse=xterm2
endif
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
map <F12> :set invpaste<cr>
noremap <leader>w :%s/\s\+$//e<cr>
set shortmess+=A
set noswapfile
set path+=./**
autocmd BufWritePre *.pl,*.py,*.cc,*.h,*.hpp,*.cpp,*.c %s/\s\+$//e
" ------shortcuts-------
"Vim 7 specific mappings
nnoremap <Space> <NOP>
if version >= 700
    map <C-t> <Esc>:tabnew<CR>
endif
nnoremap gp `[v`]
noremap <silent> <c-s> :w<cr>
noremap <c-a> ggvG$
nnoremap <Up> gk
nnoremap <Down> gj
"make < > shifts keep selection
nnoremap <C-j>  <C-w>j
nnoremap <C-k>  <C-w>k
nnoremap <C-h>  <C-w>h
nnoremap <C-l>  <C-w>l
nnoremap <silent> + :exe "vertical resize " . (winwidth(0) +15 )<CR>
nnoremap <silent> - :exe "vertical resize " . (winwidth(0) -15)<CR>
nnoremap CD :lcd %:p:h<CR>
vnoremap < <gv
vnoremap > >gv
nnoremap <expr> <C-c> &diff ? ']c' : '<C-c>'
nnoremap <expr> <C-v> &diff ? '[c' : '<C-v>'
" ------ nerdtree ------
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeCascadeSingleChildDir=0
"let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

"autocmd BufEnter * lcd %:p:h
"au BufEnter * NERDTreeTabsOpen
"au TabEnter * NERDTree|NERDTreeClose
"au VimLeave * NERDTreeClose
let NERDTreeWinSize=26
let NERDTreeQuitOnOpen = 0
let g:NERDTreeMouseMode = 3
"let g:NERDTreeMapOpenInTab = '<LeftRelease>'
"map <leader>ne :NERDTreeToggle<CR>
map <leader>e :NERDTreeFind<CR>
autocmd VimEnter * wincmd w
" ------tagbar--------
let g:tagbar_singleclick=1
let g:tagbar_type_lua = {
            \ 'ctagstype' : 'LUA',
            \ 'kinds'     : [
            \ 'r:require',
            \ 'f:function',
            \ 'm:module'
            \]
\}
nmap <F8> :TagbarToggle<CR>
" -------airline--------
let g:airline_section_c = '%<%F%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#close_symbol = '×'
let g:airline#extensions#tabline#show_close_button = 0
" ----------ycm------------
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
" ---------a.vim----------
source ~/.vim/a.vim
"noremap <C-S-a> :A<cr>
" -------filetypes--------
autocmd BufNewFile,BufReadPost *.go set filetype=go
augroup filetypedetect
    au BufRead,BufNewFile *.launch set filetype=xml
    au BufRead,BufNewFile *.world set filetype=xml
    au BufRead,BufNewFile *.gazebo set filetype=xml
    au BufRead,BufNewFile *.xacro set filetype=xml
augroup END
autocmd FileType xml setlocal shiftwidth=2 tabstop=2
autocmd FileType tex setlocal shiftwidth=2 tabstop=2
" -------latex-----------
let g:tex_flavor = "latex"
let g:tex_conceal = ""
au BufRead *.tex setlocal spell spelllang=en_us
" -------markdown--------
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
au BufRead *.md setlocal spell
" -------tags-------------
noremap <A-;> <C-]>
noremap <A-.> <C-T>
noremap <A-,> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
noremap <A-?> :split <CR>:exec("tag ".expand("<cword>"))<CR>
noremap <A-/> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" -------fix register bullshit-----
xnoremap p pgvy
"--------command to edit single quoted file names-----------
command! -nargs=? -bang -bar E :execute "e<bang> ".fnameescape(system("echo -n ".<q-args>))
"-------easy motion config---------
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-bd-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
"map  <Leader>w <Plug>(easymotion-bd-w)
"nmap <Leader>w <Plug>(easymotion-overwin-w)
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzyword#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

let g:EasyMotion_smartcase = 1
noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())
"--------vim-session----------------
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
let g:session_autosave_periodic = 5


"--------inc search+easy motion------------
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
autocmd WinLeave * silent
map <Leader>n :noh<CR>

"--------simply fold----------
set nofoldenable
autocmd BufEnter *.py set foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufLeave *.py set foldexpr< foldmethod<
"--------syntastic--------
"set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
:let g:syntastic_loc_list_height = 5
command! -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr("$")
  endif
endfunction

nmap <silent> <F2> :QFix<CR>

"-------nerd commenter--------
nnoremap ,c :call NERDComment(0,"toggle")<CR>
vnoremap ,c :call NERDComment(0,"toggle")<CR>

"----------ctrlp------------
let g:ctrlp_cmd='CtrlP :pwd'
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_user_command = 'cd %s;
  \ commonfilter="\.(jpg|bmp|png|jar|7z|zip|tar|gz|tgz|bz)$";
  \ if [ ! -r ".ctrlpignore" ]; then
  \   find . -type f | grep -Evi "$commonfilter";
  \ else
  \   find . -type f | grep -vF "$(cat .ctrlpignore)" | grep -Evi "$commonfilter";
  \ fi'

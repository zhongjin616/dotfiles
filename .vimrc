" install plug if not exists
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" call :PlugInstall to install plugins

" use plug to manage Vim plugins
call plug#begin('~/.vim/plugged')
let g:plug_timeout = 100

" add your plugs && make sure you use single quotes
" code completion
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --gocode-completer' }
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'nsf/gocode'

" snippet
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/syntastic'

" (), [], {} pairs
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

" Search
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'

" no trailing-whitespace
Plug 'bronson/vim-trailing-whitespace'

" align
Plug 'junegunn/vim-easy-align'

" quick move
Plug 'Lokaltog/vim-easymotion'
Plug 'terryma/vim-expand-region'

Plug 'chrisbra/Colorizer' " show color code #0f0f
Plug 'kien/rainbow_parentheses.vim' "mark nest parentheses with diff color

" themes
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'junegunn/seoul256.vim'

" status
Plug 'vim-airline/vim-airline'
" Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter' " show ~+- if code modified

" language specified
Plug 'fatih/vim-go'
Plug 'plasticboy/vim-markdown'

call plug#end()


" don't bother with vi compatibility
set nocompatible
syntax enable

"检测文件类型 调用插件和缩进格式
filetype plugin indent on

set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                              " Fix broken backspace in some setups
set backupcopy=yes                                           " see :help crontab
"set clipboard=unnamed                                        " yank and paste with the x-11 primary-selection
set clipboard=unnamedplus                                    " yank and paste with the system clipboard
set directory-=.                                             " don't store swapfiles in the current directory
set encoding=utf-8
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set laststatus=2                                             " always show statusline
set list                                                     " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set number                                                   " show line numbers
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline
set showcmd
set smartcase                                                " case-sensitive search if any caps
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full
set binary
set noeol                                                    " no end of line at the end of the file
set hlsearch                                                 " highlight search

" Show “invisible” characters
set list
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
"set lcs=tab:▸\ ,trail:·
set cursorcolumn
set cursorline
set completeopt=longest,menu                                 "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)

" tab相关变更
set tabstop=4     " 设置Tab键的宽度        [等同的空格个数]
set shiftwidth=4  " 每一次缩进对应的空格数
set softtabstop=4 " 按退格键时可以一次删掉 4 个空格
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
set expandtab     " 将Tab自动转化成空格    [需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set shiftround    " 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'

" FileEncode Settings 文件编码,格式
"==========================================
" 设置新文件的编码为 UTF-8
set encoding=utf-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
"set langmenu=zh_CN.UTF-8
"set enc=2byte-gb18030
" 下面这句只影响普通模式 (非图形界面) 下的 Vim。
set termencoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" 如遇Unicode值大于255的文本，不必等到空格再折行。
set formatoptions+=m
" 合并两行中文时，不在中间加空格：
set formatoptions+=B
" A buffer becomes hidden when it is abandoned
set hidden
set wildmode=list:longest
set ttyfast


" Enable basic mouse behavior such as resizing buffers.
set mouse=v
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif


" choose colorscheme
if (&t_Co == 256 || has('gui_running'))
    " seoul256 (light):
    "   Range:   252 (darkest) ~ 256 (lightest)
    "   Default: 253
    " let g:seoul256_background = 252
    " colorscheme seoul256
    " set background=light

    " seoul256 (dark):
    "   Range:   233 (darkest) ~ 239 (lightest)
    "   Default: 237
    let g:seoul256_background = 236
    colorscheme seoul256
    set background=dark

    " let g:molokai_original = 1
    " colorscheme molokai

    " let g:solarized_termtrans=1
    " let g:solarized_contrast="normal"
    " let g:solarized_visibility="normal"
    " set background=dark
    " colorscheme solarized
endif


" keyboard shortcuts
let mapleader = ','
inoremap jk <ESC>
set pastetoggle=<leader>2

" normal norecursive map
nnoremap <leader>a :Ag<space>
nnoremap <leader>p :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>f :CtrlPMRU<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
noremap <C-h> <C-w>h " NERDTree movement
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

nmap s <Plug>(easymotion-s)
nmap t <Plug>(easymotion-s2)
nmap <leader><space> :FixWhitespace<cr>

" 默认map命令可设置normal和visual模式
map <Leader>l <Plug>(EasyAlign)
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
map <Leader><leader>. <Plug>(easymotion-repeat)
" copy the whole file
map <Leader>cp :!xclip -i -selection clipboard % <CR><CR>

cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)
" replace currently selected text with default register
" without yanking it. see:
" https://superuser.com/questions/321547/how-do-i-replace-paste-yanked-text-in-vim-without-yanking-the-deleted-lines
vnoremap p "_dP

" tab 操作
map <leader>te :tabedit<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>tp :tabprevious<cr>
map <leader>tN :tabNext<cr>
map <leader>tn :tabnext<cr>
nnoremap <C-t> :tabnew<CR>
inoremap <C-t> <Esc>:tabnew<CR>

" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif


" =========================> config plugin's options <=========================
" YouCompleteMe
let g:ycm_confirm_extra_conf = 0 "load config without asking


" Ultisnips
let g:UltiSnipsEditSplit="vertical"
" remap Ultisnips for compatibility for YCM
let g:UltiSnipsExpandTrigger       = '<C-t>' "expand snipppe
let g:UltiSnipsJumpForwardTrigger  = '<C-j>' "rewrite next var value
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
" where to store your private snippet
let g:UltiSnipsSnippetsDir         = '~/.vim/mycoolsnips'
" search each 'runtimepath' directory for the subdirectory names in order
let g:UltiSnipsSnippetDirectories  = ['mycoolsnips', 'UltiSnips']


" syntastic'
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_enable_highlighting=1

" error code: http://pep8.readthedocs.org/en/latest/intro.html#error-codes
let g:syntastic_python_checkers=['pyflakes', 'pep8'] " 使用pyflakes,速度比pylint快
let g:syntastic_python_pep8_args='--ignore=E501,E225,E124,E712'
let g:syntastic_javascript_checkers = ['jsl', 'jshint']
let g:syntastic_html_checkers=['tidy', 'jshint']

" 修改高亮的背景色, 适应主题
highlight SyntasticErrorSign guifg=white guibg=black

" to see error location list
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 5

function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction


" vim-easymotion
let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
" ,, + w  跳转
" ,, + fe  查找'e',快速跳转定位到某个字符位置
" ,,j      快速决定移动到下面哪行(比用行号/j移动快)
" ,,k      快速移动到上面哪行
" ,,l      本行, 向后快速移动
" ,,h      本行, 向前快速移动
" ,,.      重复上一次easymotion命令


" Colorizer
let g:colorizer_auto_color = 1
let g:colorizer_auto_filetype='less,sass,scss,js,css,html'
let g:colorizer_syntax = 1


" ctrlp.vim
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window = 'order:ttb,max:20'
"let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1


" rainbow_parentheses
" \ ['black',       'SeaGreen3'], "exclude this line
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
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces


" vim-go settings
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" vim-go bindings
augroup FileType go
  autocmd!
  autocmd FileType go nmap gd <Plug>(go-def)
  autocmd FileType go nmap <Leader>dd <Plug>(go-def-vertical)

  autocmd FileType go nmap <Leader>dv <Plug>(go-doc-vertical)
  autocmd FileType go nmap <Leader>db <Plug>(go-doc-browser)

  autocmd FileType go nmap <Leader>i <Plug>(go-info)

  autocmd FileType go nmap <leader>r <Plug>(go-run)
  autocmd FileType go nmap <leader>b <Plug>(go-build)
  autocmd FileType go nmap <leader>t <Plug>(go-test)
augroup END


" =========================> custom functions <=========================
function! AutoSetFileHead()
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
    endif

    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call append(1, "\# encoding: utf-8")
    endif

    normal G
endfunc

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" Automatic commands
if has("autocmd")
  " COOL HACKS
  " Make sure Vim returns to the same line when you reopen a file.
  augroup line_return
      autocmd!
      autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \     execute 'normal! g`"zvzz' |
          \ endif
  augroup END


  autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"

  " Highlight TODO, FIXME, NOTE, etc.
  if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
  endif

  autocmd BufRead,BufNewFile *.md,*.mkd,*.markdown setfiletype markdown set spell
  autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript " Treat .json files as .js

  autocmd FileType python,c,c++,lua,markdown set tabstop=4 shiftwidth=4 expandtab ai
  autocmd FileType vim,snippets,ruby,javascript,sh,html,css,scss set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
  autocmd FileType go setl sw=2 sts=2 noexpandtab

  autocmd FileType * autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
  autocmd VimResized * :wincmd =
endif


" General file runners for various languages
function! LangRunner()
  if(&ft=="python")
    nnoremap <leader>r :!python2 %<cr>
  elseif(&ft=="ruby")
    nnoremap <leader>r :!ruby %<cr>
  elseif(&ft=="javascript")
    nnoremap <leader>r :!node %<cr>
  elseif(&ft=="php")
    nnoremap <leader>r :!php %<cr>
  elseif(&ft=="c")
    nnoremap <leader>r :!make run<cr>
  endif
endfunction

autocmd BufEnter * call LangRunner()


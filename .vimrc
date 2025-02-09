"__        ___           
"\ \      / (_)_ __ ___  
" \ \ /\ / /| | '_ ` _ \ 
"  \ V  V / | | | | | | |
"   \_/\_/  |_|_| |_| |_|
"
"Written by Woland https://github.com/wolandark/wim

"This is free to use, share and modify, if you like it, please consider giving
"it a start on GitHub or recommending it to a friend.

"Notice that I wrote this config and tested it with Vim and Gvim, not NeoVim
"and not MacVim, so... theres that.

"Also please consider using a sane Terminal or at least use sane Keybindings
"in your minimal terminal settings.

"Order your custom .vimrc for your use case at https://t.me/inlovewithapenguin
"I hope you enjoy

"""""""""""""""""
"Encoding & Font"
"""""""""""""""""
set encoding=utf-8
"let &guifont='Hack Nerd Font Mono:h14
"above option is for Gvim. For cli vim set font in your terminal emulator
"""""""""
"Plugins"
"""""""""
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
""""""""""""""
"colorschemes"
""""""""""""""
Plug 'https://github.com/morhetz/gruvbox.git'
Plug 'crusoexia/vim-monokai'
Plug 'arcticicestudio/nord-vim'
Plug 'mhartington/oceanic-next'
Plug 'wuelnerdotexe/vim-enfocado'
"Plug 'dracula/vim', { 'as': 'dracula' }
"Plug 'https://github.com/sainnhe/everforest.git'
"Plug 'NLKNguyen/papercolor-theme'
"""""""""""""""""""
"Completion plugin"
"""""""""""""""""""
Plug 'https://github.com/ackyshake/VimCompletesMe.git'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Use CocInstall coc-tsserver coc-css coc-html coc-sh 
"""""""""""
"Snippets "
"""""""""""
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
""""""""""""""""""""
"Beautify your code"
""""""""""""""""""""
" Plug 'maksimr/vim-jsbeautify'
"""""""""""""""""""""""
"Nerdtree File Manager"
"""""""""""""""""""""""
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
""""""""""""
"Statusline"
""""""""""""
"hackline
"Plug 'https://github.com/jssteinberg/hackline.vim.git', {'branch': 'dev'}
"lightline
Plug 'itchyny/lightline.vim'
"""""""""""""""""""""""""""""
"Css colors showing in files"
"""""""""""""""""""""""""""""
Plug 'https://github.com/ap/vim-css-color.git'
"""""""""""""""""""""""""""""""""""
"Comment and uncomment text easily"
"""""""""""""""""""""""""""""""""""
Plug 'preservim/nerdcommenter'
"""""""""""""""""""""""
"Markdown live preview"
"""""""""""""""""""""""
Plug 'iamcco/markdown-preview.vim'
"""""""""""""""""""""""""""""""""""""""""""""
"HTML CSS JS Live preview in default browser"
"""""""""""""""""""""""""""""""""""""""""""""
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
""""""""""""""""""""""""""
"Fix Vim clipboardproblem"
""""""""""""""""""""""""""
Plug 'christoomey/vim-system-copy'
""""""""""""""""""""""""""""""""""""""""""""
"Syntax highlighting and icons for nerdtree"
""""""""""""""""""""""""""""""""""""""""""""
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
""""""""""
"surround"
""""""""""
Plug 'https://github.com/tpope/vim-surround.git'
" This plugin has odd Keybindings but its useful
" ysiw" surrounds one word with the " sign
" yss) surrounds entire line with )
" yss<p> surrounds line with the <p> tag and auto completes the closing tag
" to surround multiple lines with a tag like a <li></li> use visual selection
" then press St and type the tag. Notice that the first < is already written 
" so dont type it twice otherwise you'll get <<li>
" remember that its not about speed! vim doesnt care about how fast you input
" the combinations. We're not typing GTA cheats!
""""""""""""""
"Fuzzy Search"
""""""""""""""
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
""""""""""""""
"Syntax Check"
""""""""""""""
Plug 'https://github.com/vim-syntastic/syntastic.git'
"""""""""""
"Alignment"
"""""""""""
Plug 'https://github.com/godlygeek/tabular.git'
"use :Tabularize /[character] to align
"example :Tabularize /= alignes the = 
""""""""""""""""""""""""""""""""
"Search and open previous Files"
""""""""""""""""""""""""""""""""
Plug 'https://github.com/yegappan/mru.git'
""""""""""""""
"Start Screen"
""""""""""""""
Plug 'mhinz/vim-startify'
"""""""""
"Floterm"
"""""""""
Plug 'voldikss/vim-floaterm'
""""""""""""
"indentline"
""""""""""""
Plug 'https://github.com/Yggdroot/indentLine.git' 
""""""""""
"WhichKey"
""""""""""
Plug 'liuchengxu/vim-which-key'

call plug#end()
"""""""""
" Cursor "
""""""""""
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set mouse=a
set guicursor+=a:blinkon0
"""""""""""""
" Clipboard "
"""""""""""""
set clipboard=unnamedplus
"for OSX & Windows users 
"set clipboard=unnamed

"Using the clipboard plugin c-p can be used to copy to system clipboard
"and c-v to paste from system clipboard(works in visual mode) - xsel is a dependency
"For modern terminals such as konsole-xfce-mate etc... Ctrl Shift V works as
"usual

" The default mapping is cp for copying and cv for pasting, and can be followed by any motion or text object. For instance:
" cpiw => copy word into system clipboard
" cpi' => copy inside single quotes to system clipboard
" cvi' => paste inside single quotes from system clipboard
" In addition, cP is mapped to copy the current line directly.
" The sequence cV is mapped to paste the content of system clipboard to the next line.
""""""""""""""
"Usual Things"
""""""""""""""
"For folds to be saved on exit
"augroup remember_folds
 "autocmd!
"autocmd BufWinLeave * mkview
" autocmd BufWinEnter * silent! loadview
"augroup END

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set modifiable
set autoread
set cmdheight=1 
set foldenable
set foldmethod=manual
set path+=**
set noswapfile
set autoindent
set ic
set incsearch
set smartcase
set lazyredraw
"set noshowmatch
set noerrorbells
set novisualbell
set t_vb=
set noeb vb t_vb=
"set tm=500
syntax on
set number
set expandtab
set shiftwidth=4
set tabstop=4
"for backspace not working in Gvim or in Windows
"set backspace=2
filetype plugin indent on
"set cursorline
"set cursorcolumn
"set hlsearch
"""""
"RtL"
"""""
"for Persian and Arabic right to left support within vim, must have compatible terminal 
"& bicon and harfbuzz etc installed
set termbidi
"""""""
"Theme"
"""""""
" Inspect $TERM instad of t_Co
if &term =~ '256color'
  " Enable true (24-bit) colors instead of (8-bit) 256 colors.
  if has('termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
  endif
  colorscheme gruvbox
endif

"put colorscheme in above statement, default is gruvbox 
" other colorschemes include:
" nord 
" enfocado
" PaperColor
" gruvbox
" everforest
" dracula
" monokai

" Below statement is for everforest colors
" uncomment the ones with ""
" everforest theme takes a second to generate the settings the first time

" Important!!
"" if has('termguicolors')
"" set termguicolors
"" endif

" Set contrast.
" This configuration option should be placed before `colorscheme everforest`.
" Available values: 'hard', 'medium'(default), 'soft'

"" let g:everforest_background = 'hard'
"" For better performance
"" let g:everforest_better_performance = 1
"" let g:everforest_enable_italic = 1
"-------------------
"for enfocado theme
"let g:enfocado_style = 'nature' " Available: `nature` or `neon`.
"-------------------
set background=dark
"Indentline follow theme change to 1 if colors are fucked
let g:indentLine_setColors = 0
"set background=light
"""""""""""""""""""""""""""""""""""""
"Woland Netrw (FileManager) Settings"
"""""""""""""""""""""""""""""""""""""
"Uncomment all to use netrw instead of nerdtree 
"naturally you must delete the lines about nerdtree
"line to uncomment are marked with 2 "

""autocmd filetype netrw call Netrw_mappings()
""function! Netrw_mappings()
  ""noremap <buffer>% :call CreateInPreview()<cr>
""endfunction
function! CreateInPreview()
  let l:filename = input("please enter filename: ")
  execute 'pedit ' . b:netrw_curdir.'/'.l:filename
endfunction
""function! CreateInPreview()
""  let l:filename = input("please enter filename: ")
""  execute 'silent !touch ' . b:netrw_curdir.'/'.l:filename 
""  redraw!
""endf
let g:NetrwIsOpen=0

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Vexplore
    endif
endfunction

""augroup projectdrawer
  ""autocmd!
  ""autocmd vimenter * :Vexplore | wincmd p
""augroup end
"close if only remaining buffer
""autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' |q|endif
""Start with dotfiles hidden
let ghregex='\(^\|\s\s\)\zs\.\S\+'
let g:netrw_list_hide=ghregex
""Usual things 
let g:netrw_special_syntax = 3
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15
"""""""""""""""""""
"Woland Statusline"
"""""""""""""""""""
" set statusline=%F                           " File Name And Full Path
" set statusline+=%y                          " File Format
" set statusline+=\ %=                        " Align Left
" set statusline+=Line:%l/%L[%p%%]            " Line X of Y [Percent Of File]
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" hi statusline ctermfg=darkgrey ctermbg=lightyellow
"""""""""""""""""""""
"hackline statusline"
"""""""""""""""""""""
" let g:hackline_laststatus = 2
" let g:hackline_mode = 1
" let g:hackline_bufnum = 0
" let g:hackline_filetype = 1
" let g:hackline_fileformat = 0
" let g:hackline_tab_info = 0
" " Any valid statusline value
" let g:hackline_custom_end = '
"             \ %l/%L[%p%%]
"             \'
" " let g:hackline_highlight_normal = 'StatusLine'
" let g:hackline_highlight_normal = 'PmenuSel'
" let g:hackline_highlight_command = 'Todo'
" let g:hackline_highlight_insert = 'DiffAdd'
" let g:hackline_highlight_terminal = 'Todo'
" let g:hackline_highlight_visual = 'IncSearch'
" let g:hackline_highlight_replace = 'DiffDelete'
" let g:hackline_highlight_select = 'IncSearch'
""""""""""""""""""""""""""
"for lightline status bar"
""""""""""""""""""""""""""
"minimal info on narrow splits
let g:lightline = {
      \'component_function': { 'lineinfo': 'LightlineLineinfo', }
      \}

function! LightlineLineinfo() abort
    if winwidth(0) < 86
        return ''
    endif
    let l:current_line = printf('%-3s', line('.'))
    let l:max_line = printf('%-3s', line('$'))
    let l:lineinfo = ' ' . l:current_line . '/' . l:max_line
    return l:lineinfo
endfunction

"remove readonly in help window
let g:lightline = {
      \ 'component_function': {
      \   'readonly': 'LightlineReadonly',
      \ },
      \ }

function! LightlineReadonly()
  return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction

" let g:lightline = {
"       \'component_function':  { 'mode': 'LightlineMode' }
"       \}
"
" function! LightlineMode() abort
"     let ftmap = {
"       \ 'NERDTree': 'NERDTree',
"       \ }
"     return get(ftmap, &filetype, lightline#mode())
" endfunction

" no statusline in nerdtree window
augroup filetype_nerdtree
    au!
    au FileType nerdtree call s:disable_lightline_on_nerdtree()
    au WinEnter,BufWinEnter,TabEnter * call s:disable_lightline_on_nerdtree()
augroup END

fu s:disable_lightline_on_nerdtree() abort
    let nerdtree_winnr = index(map(range(1, winnr('$')), {_,v -> getbufvar(winbufnr(v), '&ft')}), 'nerdtree') + 1
    call timer_start(0, {-> nerdtree_winnr && setwinvar(nerdtree_winnr, '&stl', '%#Normal#')})
endfu

set laststatus=2
set noshowmode
" Available colors are: one solarized wombat papercolor everforest gruvbox || Each has a dark and
" light version according to the set background option. || default is powerline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \ 'left': [ [ 'mode' ], [ 'readonly', 'absolutepath', 'modified' ] ],
      \ 'right': [ [ 'lineinfo' ],[ 'percent' ],[ 'filetype'] ] },
      \ 'component': {
      \ 'charvaluehex': '0x%B'
      \ },
      \ }
""""""""""""""""""""""""
"Settings for syntastic"
""""""""""""""""""""""""
let g:syntastic_always_populate_loc_list = 1
"0 off
"automatically.
"1 the error window will be automatically opened when errors are
"detected, and closed when none are detected.
"2 the error window will be automatically closed when no errors are
"detected, but not opened automatically.
"3 the error window will be automatically opened when errors are
"detected, but not closed automatically.
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Colors have been tested with gruvbox, modify to your liking
"Error sign on the right
highlight SyntasticErrorSign ctermfg=red ctermbg=yellow
"Error line highlight
highlight SyntasticErrorLine ctermbg=black

let g:syntastic_auto_jump = 3
"0 off
"1 the cursor will always jump to the first issue detected,
"regardless of type.
"2 the cursor will jump to the first issue detected, but only if
"this issue is an error. 
"3 the cursor will jump to the first error detected, if any. If
"all issues detected are warnings, the cursor won't jump. 

"""""""""""""""""""
" Custom Mappings "
"""""""""""""""""""
"LEADER"
"leader key is space
let mapleader =" "
nnoremap <leader>n :NERDTree <Cr>
nnoremap <leader>e :call ToggleNetrw()<Cr>
nnoremap <leader>v :FloatermNew vifm <Cr>
nnoremap <leader>r :FloatermNew ranger <Cr>
nnoremap <leader>T :tabnew file <Cr>
nnoremap <leader>mk :mkview <Cr>
map <F2> :Bracey <Cr>
map <F3> :BraceyReload <Cr>
map <F4> :BraceyStop <Cr>
nnoremap <leader>d :g/^\(.*\)$\n\1/d<Cr>
nnoremap <leader>m :MRU<Cr>
nnoremap <leader>i :Startify <CR> 
"--------------------------------------
inoremap jj <esc>
nnoremap bs i#!/bin/bash<ESC>0
nnoremap <leader>op :source %<Cr>
nnoremap cn iconsole.log<ESC>0
nmap <leader>w :w!<cr>
nnoremap <leader>u :normal! kmmjdd{p'm<Cr> 
"""""""""""""
"Spell Check"
"""""""""""""
map <F6> :setlocal spell! spelllang=en_us<cr>
"set spell spelllang=en_us
hi SpellBad ctermfg=red guifg=red

function! Fixspell()
    normal! 1z=
endfunction 
nnoremap <leader>z :call Fixspell()<CR>
nnoremap <leader>l :normal! 1z=w1z=w1z=w1z=w1z=w1z=w1z=w1z=w1z=w1z=w1z=w1z=w1z=w1z=w1z=w1z=w<Cr>
"---------------------------------------
set wildmode=longest,list,full
"---------------------------------------
""""""""""""""""""""""""""""""""""""""""
"Keybindings for sane buffer navigation"
""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <C-LEFT> <C-w>h
map <C-DOWN> <C-w>j
map <C-UP> <C-w>k
map <C-RIGHT> <C-w>l

map <s-LEFT> :vertical resize +5 <Cr>
map <s-RIGHT> :vertical resize -5 <Cr>
map <s-UP> :resize +5 <Cr>
map <s-DOWN> :resize -5 <Cr>

nnoremap <M-Left> :tabprevious<CR>
nnoremap <M-Right> :tabnext<CR>
"Keybindings for tab navigation with leader and number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt

noremap <leader>0 :tablast<cr>
nnoremap <leader>x :tabclose<Cr>
map <leader>tm :tabmove<Cr>

map <leader>c :Colors<Cr>
map <leader>b :Buffers<Cr>
map <leader>s :Files<Cr>
map <leader>W :Windows<Cr>
map <leader>H :History<Cr>
map <leader>Hc :History:<Cr>
map <leader>M :Maps<Cr>
map <leader>t :FloatermToggle<Cr>
map <leader>h :WhichKey! g:dict<Cr>

""""""""""""""""""""""""""
"Commands and filemanager"
""""""""""""""""""""""""""
:command Ra !ranger
:command Vi !vifm
:command Na tabnew file
"""""""""""""
"HTML Indent"
"""""""""""""
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
let g:html_indent_attribute = 1
let g:html_indent_inctags = "html,body,head,tbody"

"A skeleton can be pre-defined for any file with a fomat
"Below setting force vim to paste a basic html skeleton whenever
"vim is used to make a .html file. The skeleton.xml file must exist 
"in the path specified below
augroup Xml
    au BufNewFile *.html 0r ~/.vim/skeleton.xml
augroup end

""""""""""""
"Comentator"
""""""""""""
"leader cc to comnment and leader cu to uncomment
"""""""""""
"NERDTree "
"""""""""""
" Start NERDTree and leave the cursor in it.
" autocmd VimEnter * NERDTree

"start nerdtree and put cursor in empty buffer or file
autocmd VimEnter * NERDTree | wincmd p

" Start NERDTree when Vim is started without file arguments. 
" below 2 lines were commented for startify to work
"" autocmd StdinReadPre * let s:std_in=1
"" autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"nerdtree width
let g:NERDTreeWinSize=20

"remove press ? for help on top of nerdtree
let NERDTreeMinimalUI=1
"disable 80 extentions of nerdtree for less lag

let g:NERDTreeLimitedSyntax = 1

" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

"""""""""""""""""""""""""""""""""
" NERDTree Functions and colors "
"""""""""""""""""""""""""""""""""
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
" you can add these colors to your .vimrc to help customizing
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb

let g:WebDevIconsDefaultFolderSymbolColor = s:beige " sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue " sets the color for files that did not match any rule


"""""""""""""""""""
"Beatify Web Files"
"""""""""""""""""""
" map <c-f> :call JsBeautify()<cr>
" or
" autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json
" autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
" autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
" autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
" autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

""""""""""""""""""""""
"HTML CSS Live Server"
""""""""""""""""""""""
let g:mkdp_path_to_chrome = ""
" Path to the chrome or the command to open chrome (or other modern browsers).
" If set, g:mkdp_browserfunc would be ignored.

let g:mkdp_browserfunc = 'MKDP_browserfunc_default'
" Callback Vim function to open browser, the only parameter is the url to open.

let g:mkdp_auto_start = 0
" Set to 1, Vim will open the preview window on entering the Markdown
" buffer.

let g:mkdp_auto_open = 0
" Set to 1, Vim will automatically open the preview window when you edit a
" Markdown file.

let g:mkdp_auto_close = 1
" Set to 1, Vim will automatically close the current preview window when
" switching from one Markdown buffer to another.

let g:mkdp_refresh_slow = 0
" Set to 1, Vim will just refresh Markdown when saving the buffer or
" leaving from insert mode. With default 0, it will automatically refresh
" Markdown as you edit or move the cursor.

let g:mkdp_command_for_global = 0
" Set to 1, the MarkdownPreview command can be used for all files,
" by default it can only be used in Markdown files.

let g:mkdp_open_to_the_world = 0
" Set to 1, the preview server will be available to others in your network.
" By default, the server only listens on localhost (127.0.0.1).

""""""""""""""""""""""
"Markdown Live Server"
""""""""""""""""""""""
" for normal mode
nmap <silent> <F8> <Plug>MarkdownPreview
" for insert mode
imap <silent> <F8> <Plug>MarkdownPreview
" for normal mode
nmap <silent> <F9> <Plug>StopMarkdownPreview
" for insert mode
imap <silent> <F9> <Plug>StopMarkdownPreview

"""""""""""""""""""""""""
"HTML CSS JS Live Server"
"""""""""""""""""""""""""
" bracey won't do anything until it is explicitly called
"
" :Bracey
" this starts the bracey server and optionally opens your default web browser to bracey's address. if you have an html file open as your current buffer, it will be displayed and you may begin editing it live.
"
" :BraceyStop
" will shutdown the server and stop sending commands
"
" :BraceyReload
" force the current web page to be reloaded
"
" :BraceyEval [args]
"""""""""""""""""""""""""""""""
"Options For The Startify Menu"
"""""""""""""""""""""""""""""""
 let g:startify_custom_header =
       \ startify#pad(split(system('figlet -w 100 Wim'), '\n'))
"Incase you are insane and want to open a new tab with Goyo enabled
 autocmd BufEnter *
       \ if !exists('t:startify_new_tab') && empty(expand('%')) && !exists('t:goyo_master') |
       \   let t:startify_new_tab = 1 |
       \   Startify |
       \ endif
"Bookmarks. Syntax is clear.add yours
let g:startify_bookmarks = [ {'I': '~/i3/i3/config'},{'L': '~/.blerc'},{'Z': '~/.zshrc'},{'B': '~/.bashrc'},{'V': '~/.vimrc'}]
    let g:startify_lists = [
          \ { 'type': 'bookmarks' , 'header': ['   Bookmarks']      } ,
          \ { 'type': 'files'     , 'header': ['   Recent'   ]      } ,
          \ { 'type': 'sessions'  , 'header': ['   Sessions' ]      } ,
          \ { 'type': 'commands'  , 'header': ['   Commands' ]      } ,
          \ ]
"cant tell wtf it does so its commented
" \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },

hi StartifyBracket ctermfg=240
hi StartifyFile    ctermfg=147
hi StartifyFooter  ctermfg=240
hi StartifyHeader  ctermfg=114
hi StartifyNumber  ctermfg=215
hi StartifyPath    ctermfg=245
hi StartifySlash   ctermfg=240
hi StartifySpecial ctermfg=240

""""""""""""""""
"FloatermToggle"
""""""""""""""""
let g:floaterm_autohide = 0
let g:floaterm_autoclose = 2
let g:floaterm_height = 30
let g:floaterm_width  = 120

"""""""""""""""""""""""""""""""""
"Dictionary Setting For WhichKey"
"""""""""""""""""""""""""""""""""
let g:which_key_hspace = 5
let g:which_key_centered = 1
let g:which_key_flatten = 1
let g:which_key_max_size = 1
let g:which_key_disable_default_offset = 1

let g:dict= {
      \ 'n'     : ['NERDTree'            , 'NERDTree Toggle']        ,
      \ 'e'     : ['NETRW'               , 'NETRW']                  ,
      \ 'i'     : ['Startify'            , 'Startify']               ,
      \ 'v'     : ['Vifm'                , 'Vifm']                   ,
      \ 'r'     : ['Ranger'              , 'Ranger']                 ,
      \ 't'     : ['Terminal'            , 'Terminal']               ,
      \ 'T'     : ['NewTab'              , 'NewTab']                 ,
      \ 'd'     : ['Duplicate Cleaner'   , 'Delete Duplicate Lines'] ,
      \ 'm'     : ['MRU'                 , 'View File History']      ,
      \ 'cc'    : ['Comment Out'         , 'Comment Out']            ,
      \ 'cu'    : ['Uncomment'           , 'Uncomment']              ,
      \ '1-9'   : ['Go To Tab By Number'               , 'Go To Tab By Number 0 Is Tab 10'] ,
      \ 'F2'    : ['Web Server'                        , 'Web Server']                      ,
      \ 'F3'    : ['Web Server'                        , 'Web Server Reload']               ,
      \ 'F4'    : ['Web Server'                        , 'Web Server Stop']                 ,
      \ 'F6'    : ['Spellcheck'                        , 'Spellcheck']                      ,
      \ 'F8'    : ['Open MD Server'                    , 'MD Server']                       ,
      \ 'C-vimkeys/arrows' : ['Move Between Splits'    , 'Move Between Splits']             ,
      \ 'S-arrows'         : ['Resize Splits'          , 'Resize Splits']                   ,
      \ 'Alt-arrows'       : ['Tab Right Or Left'      , 'Tab Right OR Left']               ,
      \ 'c'     : ['Colors'                            , 'Colors']                          ,
      \ 'b'     : ['Buffers'                           , 'Buffers']                         ,
      \ 's'     : ['Files'                             , 'Files']                           ,
      \ 'W'     : ['Windows'                           , 'Windows']                         ,
      \ 'H'     : ['History'                           , 'History']                         ,
      \ 'Hc'    : ['CMD History'                       , 'CMD History']                     ,
      \ 'M'     : ['Maps'                              , 'Maps']                            ,
      \ 'w'     : ['Quick Save'                        , 'Quick Save']                      ,
      \ 'tm'    : ['TabMove'                           , 'TaBMove']                         ,
      \ 'z'     : ['SpellCorrect'                      , 'SpellCorrect']                    ,
      \ 'op'    : ['Source vimrc'                      , 'Source vimrc']                    ,
      \ 'END'   : ['Trigger Snippets'                  , 'Trigger Snippets']                ,
      \ 'C-j'   : ['Move Within Snippet'               , 'Move Within Snippet']             ,
      \ 'C-k'   : ['Move Within Snippet'               , 'Move Within Snippet']             ,
      \ 'C-PGDN': ['List Snippets'                     , 'List Snipets']                    ,
      \ }

highlight default link WhichKey           NERDTreeDir
highlight default link WhichKeySeperator  netrwExe
highlight default link WhichKeyDesc       StartifyFile

""""""""""
"Snippets"
""""""""""
"Use END key to trigger the snippets, default was TAB but that conflicts with
"the Completion trigger see :h keycodes to change this to sth else 
"use Ctrl j and k to move visually within the snippet that was just triggered
"Ctrl PGDN lists the available snippets
let g:UltiSnipsExpandTrigger='<END>'
let g:UltiSnipsListSnippets='<c-PageDown>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'



 

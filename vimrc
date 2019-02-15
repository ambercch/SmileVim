set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"====================================================================
" Write your plugins here
"====================================================================

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" 1. plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" 2. This plugin is used for displaying thin vertical lines at each
"    indentation level for code indented with spaces.
Plugin 'Yggdroot/indentLine'
" 3. This plugin causes all trailing whitespace characters
Plugin 'ntpeters/vim-better-whitespace'
" 4. Lean & mean status/tabline for vim that's light as air.
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" 5. This file contains some boilerplate settings for vim's cscope interface,
"    plus some keyboard mappings that I've found useful.
"Plugin 'chazy/cscope_maps'
" 6. The "Tag List" plugin is a source code browser for the Vim editor.
Plugin 'vim-scripts/taglist.vim'
" 7. The NERDTree is a file system explorer for the Vim editor. Using this
"    plugin, users can visually browse complex directory hierarchies, quickly
"    open files for reading or editing, and perform basic file system operations.
Plugin 'scrooloose/nerdtree'
" 8. SrcExpl (Source Explorer) is a source code explorer that provides context
"    for the currently selected keyword by displaying the function or type
"    definition or declaration in a separate window
Plugin 'wesleyche/SrcExpl'
" 9. The Trinity plugin manages Source Explorer, Taglist and NERD Tree, and
"    build them as a great IDE.
Plugin 'wesleyche/Trinity'
" 10. Tagbar is a Vim plugin that provides an easy way to browse the tags of
"     the current file and get an overview of its structure
Plugin 'majutsushi/tagbar'
" Skip YouCompleteMe first
"Bundle 'Valloric/YouCompleteMe'
" 11. A Vim plugin which shows a git diff in the 'gutter' (sign column).
Plugin 'airblade/vim-gitgutter'
" 12. Open file and go to line via ':' symbol, e.g. file.txt:123
"Bundle 'bogado/file-line'
" 13. fzf on vim
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
" 14. ack on vim
"Plugin 'mileszs/ack.vim'
" 15. file-line
Plugin 'bogado/file-line'

" (TBD) 16. vimagit
Plugin 'jreybert/vimagit'

" 17. tig
Plugin 'iberianpig/tig-explorer.vim'

" 18. Syntastic
Plugin 'vim-syntastic/syntastic'

"-------------------------------------------------------------------
" Vim Color
"-------------------------------------------------------------------
" How to use color scheme?
" 1. Install color scheme via vundle, like it:
Plugin 'sts10/vim-pink-moon'
Plugin 'koirand/tokyo-metro.vim'
Plugin 'srcery-colors/srcery-vim'
" 2. Add colorscheme after Run vundle, like it:
" colorscheme pink-moon


" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

"====================================================================
"" Run vundle
"====================================================================

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"====================================================================
" Set general vim property
" n: Normal mode
" v: Visual mode
" i: Insert mode
" c: Command-line mode
" a: All mode
"====================================================================
syntax on
set clipboard=unnamed
set hls
set incsearch
set hlsearch
set cursorline

"=====================================================================
" General VIM configuration
"=====================================================================
" Mouse mode: default set disable
set mouse-=a
" Mouse mode: Toggle hotkey
nnoremap <silent> <C-x> :call ToggleMouse() <CR>

" Undo
"nnoremap <silent> <C-z> u
"inoremap <silent> <C-z> <Esc>ua<Left>
"vnoremap <silent> <C-z> ua<Left>
"Scrapbook, Copy to other termainal
set clipboard=unnamed

"== text movement operation ==
""move cursor to the end
nnoremap <silent> <End><End> <End>a
nnoremap <silent> e <End>
inoremap <silent> <C-e> <End>
" move cursor to the home
"nnoremap <silent> <Home><Home> <Home>a<Left>
""nnoremap <silent> h <Home>
"inoremap <silent> <C-h> <Home>
"enable enter in normal mode
"nnoremap <silent> <Enter><Enter> a<Left><CR>
" enable backspace in normal mode
nnoremap <silent> <Backspace> a<Left><Backspace>
"enable space in normal mode
"nnoremap <silent> w<Space> a<Left><Space>
""fast to file end
"nnoremap <silent> bg Gzz
" Keyword search: maps f to first keyword
nnoremap <silent> f *ggnzz
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
"pageDown
nnoremap <silent> B <PageUp>
nnoremap <silent> b <PageDown>
"== format file operation ==
" toggle line number
set nu
nnoremap <silent> <C-n> :set invnumber<CR>
inoremap <silent> <C-n> <Esc>:set invnumber<CR>
"enable <tab> in normal mode
nnoremap <silent> <Tab> :><CR>
nnoremap <silent> <S-Tab> :<<CR>
inoremap <silent> <S-Tab> <Esc>:<<CR>a<Left>
vnoremap <silent> <Tab> >
vnoremap <silent> <S-Tab> <

" auto
inoremap ( ()<Left>
inoremap [ []<Left>
"inoremap < <><Left>
"inoremap { {<CR>}<Esc>ko
"inoremap <C-w> /*<Space><Space>*/<Left><Left><Left>
"noremap <C-w> i/*<Space><Space>*/<Left><Left><Left>

" indent:
" 	- autoindent: Eveny line will refer to before line
" 	- smartindent: If detect ')' and '}', it won't not auto indent
" 	- cindent: for c and java
set cindent

" load color scheme
set t_Co=256
syntax on
set hlsearch
set timeoutlen=200

" fold method
" :help fold-marker
set foldmethod=marker
set foldmarker={,}
set nofoldenable

"expand tab in source code
autocmd BufRead,BufNewFile *.c,*.h,*.cpp,*.java,*.xml set shiftwidth=4 | set expandtab
"autocmd BufRead,BufNewFile *.java,*.xml set shiftwidth=4 | set expandtab
autocmd BufRead,BufNewFile */kernel/*.c,*/kernel/*.h set shiftwidth=4 | set softtabstop=4 | set noexpandtab
"autocmd BufRead,BufNewFile *.c,*.h,*.cpp set shiftwidth=4 | set softtabstop=4 | set noexpandtab

"for taglist
filetype on
"for taglist
let Tlist_Use_SingleClick = 1

"for NERDTree
let NERDTreeMouseMode = 3

"for srcexpl
let g:SrcExpl_jumpKey = "<ENTER>"

set ls=2
set fileencoding=gb18030
set fileencodings=ucs-bom,gb18030,utf-8,default

" Recommend use it if usually paste function
set paste

set modifiable

"find keyword via vimgrep
nnoremap <silent> <C-f> :vimgrep /\c/ 

" Set background color at colum 80
set colorcolumn=80

" Show tabs
set listchars=tab:\|.
" Show symbol
set list


"=====================================================================
" VIM Plugin Settings
"=====================================================================
" Scheme: Set color scheme
colorscheme koehler " Color for gvim
"colorscheme pink-moon
"colorscheme tokyo-metro
"let g:srcery_italic = 1
"let g:srcery_bold = 1
"let g:srcery_italic = 0
"let g:srcery_transparent_background = 0
"let g:srcery_underline = 1
"let g:srcery_undercurl = 1
"let g:srcery_inverse = 1
"let g:srcery_inverse_match_paren = 0
"let g:srcery_dim_lisp_paren = 0 
"colorscheme srcery



" Scheme: Set airline scheme
let g:lightline = { 'colorscheme': 'pink-moon' }
"let g:lightline = { 'colorscheme': 'srcery' }
"let g:lightline = { 'colorscheme': 'tokyo-metro' }
" Scheme: Other config

"set cursorline              " Hight background at current cursor line
hi CursorLine   cterm=NONE ctermbg=237 ctermfg=NONE guibg=darkred guifg=white
"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"set cursorcolumn
hi CursorColumn cterm=NONE ctermbg=235 ctermfg=NONE guibg=darkred guifg=white
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>


"====================================================================
" Airline settings
"====================================================================
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
"let g:airline_symbols.space = "\ua0"
let g:airline_theme='molokai'
"let g:airline_theme='srcery'
"let g:airline_theme='iceberg'
"let g:airline_theme='distinguished'
"let g:airline_theme='badwolf'
"let g:airline_theme='sol'
"let g:airline_theme='stellarized_dark'

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
"  let g:airline#extensions#tabline#left_sep = ''
"  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
"  let g:airline_left_sep = ''
"  let g:airline_left_alt_sep = ''
"  let g:airline_right_sep = ''
"  let g:airline_right_alt_sep = ''
"  let g:airline_symbols.branch = ''
"  let g:airline_symbols.readonly = ''
"  let g:airline_symbols.linenr = ''
endif
set fileencoding=gb18030
set fileencodings=ucs-bom,gb18030,utf-8,default
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set laststatus=2

"====================================================================
" Tagbar Settings
"====================================================================
" Open and close the tagbar separately
nmap <F12> :TagbarToggle<CR>

"====================================================================
" Indent Settings
"====================================================================
" Tabs
set ts=4
set tabstop=4
" - Tab settings: It use 4 space replace tab
set shiftwidth=4
set expandtab

" visual indent shift
vnoremap < <gv
vnoremap > >gv

"====================================================================
" MISC Settings
"====================================================================
" Shared unamed regitered with primary selection
set clipboard+=unnamed

"====================================================================
" Trinity Settings
"====================================================================
" Open and close all the three plugins on the same time
nmap <F8>  :TrinityToggleAll<CR>

" Open and close the Source Explorer separately
nmap <F10>  :TrinityToggleSourceExplorer<CR>

" Open and close the Taglist separately
nmap <F9> :TrinityToggleTagList<CR>

" Open and close the NERD Tree separately
nmap <F11> :TrinityToggleNERDTree<CR>

" YouCompeleteMe python config
"let g:ycm_global_ycm_extra_conf = '/home/thl/.vim/ycm_extra_conf'


"====================================================================
" GitGutter
"====================================================================

" GitGutter
let g:gitgutter_enable = 1
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

"====================================================================
" Cscope Settings
"====================================================================
" Cscope settings
"if has("cscope")
"    set csto=0
"    set cst
"    set nocsverb
" add any database in current directory
"    if filereadable("cscope.out")
"       cs add cscope.out
"    else add database pointed to by environment
"    elseif $CSCOPE_DB != ""
"    cs add $CSCOPE_DB
"    endif
"    set csverb
"endif

nmap <C-Space>s :scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>g :scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>c :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>t :scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>e :scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-Space>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-Space>i :scs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-Space>d :scs find d <C-R>=expand("<cword>")<CR><CR>

"=====================================================================
" FZF(Experiment)
"=====================================================================
" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

command! -bang Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 60%,0'}, <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%', '?'),
  \                 <bang>0)

"command! -bang -nargs=* Ag
"  \ call fzf#vim#ag(<q-args>,
"  \                 fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:50%'),
"  \                 <bang>0)

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
"let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h %ce %s %d %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

map <F4> :Buffer<CR>

"=====================================================================
" Qickfix toggle(Experiment)
"=====================================================================
command -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr("$")
  endif
endfunction

" Quick: hotkey
nmap <silent> <C-c> :QFix<CR>

"=====================================================================
" 17. tig config
"=====================================================================
let mapleader = ","
" open tig with current file
nnoremap <Leader>T :TigOpenCurrentFile<CR>

" open tig with Project root path
nnoremap <Leader>t :TigOpenProjectRootDir<CR>

" open tig grep
nnoremap <Leader>g :TigGrep<CR>

" resume from last grep
nnoremap <Leader>r :TigGrepResume<CR>

" open tig grep with the selected word
vnoremap <Leader>g y:TigGrep<Space><C-R>"<CR>

" open tig grep with the word under the cursor
nnoremap <Leader>cg :<C-u>:TigGrep<Space><C-R><C-W><CR>

" open tig blame with current file
nnoremap <Leader>b :TigBlame<CR>

"=====================================================================
"-- Syntastic
"=====================================================================
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

execute pathogen#infect()
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"每次自动调用 :SyntasticSetLocList, 将错误覆盖 **quickfix**
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
map <F2> :SyntasticToggleMode<CR>

"=====================================================================
" Function Experiment
"=====================================================================
function! ToggleMouse()
    " check if mouse is enabled
    if &mouse == 'a'
        " disable mouse
        set mouse=
    else
        " enable mouse everywhere
        set mouse=a
    endif
endfunc

" <TBD>
"nmap <silent> <C-c> \` :QFix<CR>
"nnoremap <silent> <C-o> :copen <CR>
"nnoremap <silent> <C-c> :cclose <CR>

"====================================================================
" IndentLinesToggle Setting
"====================================================================
" Toggle cope mode
"nnoremap <silent> <C-p> :IndentLinesToggle<CR>
"nnoremap <silent> <C-x> :call ToggleCopyMode() <CR>
"function! ToogleCopyMode()
"    :IndentLinesToggle
"endfunc


"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
"@ Bug workaround
"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
" workaround for https://github.com/vim/vim/issues/1start671
if has("unix")
  let s:uname = system("echo -n \"$(uname)\"")
  if !v:shell_error && s:uname == "Linux"
    set t_BE=
  endif
endif

"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
"@ Appendix                                                          @
"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
"=====================================================================
" Not used configuration
"=====================================================================
" < Other hotkey >
"redo
nnoremap <silent> <C-r> <Esc><C-r>a<Left>


" < file navigate operation >
""switch buffer
"nnoremap <silent> <C-Right> :bn<CR>
"inoremap <silent> <C-Right> <Esc>:bn<CR>
"nnoremap <silent> <C-Left> :bp<CR>
"inoremap <silent> <C-Left> <Esc>:bp<CR>


" < file operation >
"save file
"nnoremap <silent> <C-s> :w<CR>
""inoremap <silent> <C-s> <Esc>:w<CR>
"exit file without save
nnoremap <silent> <C-z> :q<CR>
"inoremap <silent> <C-q> <Esc>:Bclose!<CR>
""exit vi and discard all change
"nnoremap <silent> <F2> :ExitAll<CR>
"inoremap <silent> <F2> <Esc>:ExitAll<CR>
"reload file anyway
"nnoremap <silent> <F5> :e!<CR>
"inoremap <silent> <F5> <Esc>:e!<CR>

" Magit config test:
autocmd User VimagitUpdateFile
    \ if ( exists("*gitgutter#process_buffer") ) |
    \   call gitgutter#process_buffer(bufnr(g:magit_last_updated_buffer), 0) |
    \ endif

" vim:fdm=marker

" {{{ Vim: Initializations

" Turns off Vi compatability and makes Vim behave in a more useful way.
" Setting this option has many side effects and so should always remain as the
" first item in this .vimrc file.
set nocompatible

" Set the default runtime path on Windows to be more similar to the runtime
" path on Unix/Linux (~/.vim instead of ~/vimfiles). This should make it easy
" to share Vim settings and plugins between different operating systems.
if has('win32') || has('win64')
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

" }}}

" {{{ Plugin: Pathogen

let g:pathogen_disabled = []

" Adding plugins to the g:pathogen_disabled array leaves them unloaded.
" call add(g:pathogen_disabled, 'Plugin')

" Pathogen manages Vim's runtimepath allowing you to install plugins and
" runtime files in their own private directories. Pathogen will add all
" directories under ~/.vim/bundle to the runtime path. Generating help tags is
" optional and could be disabled if start-up times are slow.
call pathogen#infect()
call pathogen#helptags()

" }}}

" {{{ Vim: General

" Enable the loading of plugins based on filetype. Plugins loaded based on
" filetype are local to the buffer and will not be used for other files.
filetype plugin on

" The unnamed register is the " register and the system clipboard is the *
" register. Setting the clipboard to the unnamed register will yank to the
" system clipboard (instead of requiring you to prefix * before the yank).
set clipboard=unnamed

" A history of ":" commands, and a history of previous search patterns are
" remembered. This option decides how many entries may be stored in each of
" these histories
set history=250

" When a file has been detected to have been changed outside of Vim and
" it has not been changed inside of Vim, automatically read it again.
set autoread

nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-l> :wincmd l<CR>
nnoremap <silent> <C-q> <C-w>c

autocmd BufReadPost quickfix nnoremap <buffer> q <C-w>q

" }}}

" {{{ Vim: Colours and fonts

" Enable syntax highlighting.
syntax enable

" Enable the highlighting of the last used search pattern.
set hlsearch

" Set the colour scheme.
colorscheme neon

" Set the font.
if has('win32')
    set guifont=Bitstream_Vera_Sans_Mono:h9
elseif has('mac')
    set guifont=Menlo:h11
end

" }}}

" {{{ Vim: User interface

" Enable the mouse in normal, visual, insert and command line modes.
set mouse=a

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

" Do not wrap text.
set nowrap

" Do not show toolbar.
set guioptions-=T

" Do not put selected text in the clipboard.
set guioptions-=a
set guioptions-=A

" Show the horizontal scroll bar.
set guioptions+=b

" Ignore case in the search pattern unless there is an upper case character.
set ignorecase smartcase

" Show line numbers.
set nu

" Show the cursor position.
set ruler

" Perform incremental searching.
set incsearch

" Disable access to menu entries via the alt key.
set winaltkeys=no

" Scroll faster.
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Disable visual bell
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" }}}

" {{{ Vim: File and backup

" Do not make a backup before overwriting a file.
set nobackup
set nowritebackup

" Do not use a swap file for the buffer.
set noswapfile

" Allow buffers to be hidden without saving.
set hidden

" }}}

" {{{ Vim: Indentation

" Indentation without hard tabs
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Use filetype specific indenting.
filetype indent on

" C & C++ indentation options.
set cinoptions=s,e0,n0,f0,{0,}0,^0,Ls,:0,=s,l0,b0,g0,hs,ps,ts,is,+0,c4,C1,/0,(s,us,U1,w0,W0,m0,j0,J0,)20,*70,#0

" }}}

" {{{ Vim: Vimdiff

if &diff
    set diffopt+=iwhite
endif

nnoremap <Leader>du :diffupdate<CR>
nnoremap <Leader>dg :diffget<CR>
nnoremap <Leader>dp :diffput<CR>

" }}}

" {{{ Vim: Auto complete

" Show a menu when auto completing.
set completeopt=menu

" }}}

" {{{ Vim: Quickfix

" Adjust the height of the error window based on the number of errors shown.
" The function below takes minimum and maximum window heights as arguments.
au FileType qf call AdjustWindowHeight(1, 25)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line('$'), a:maxheight]), a:minheight]) . 'wincmd _'
endfunction

" }}}

" {{{ Vim: Miscellaneous

" Map control tab to swtich the next buffer.
map <C-Tab> :b#<CR>

" Change to directory of opened file.
command! CD cd %:p:h

" No-jump search on the word under the cursor.
nnoremap <silent> * :let @/ = '\C\<\(<C-R>=expand("<cword>")<CR>\)\>'<CR>:set hls<CR>

" Refactoring of the word under the cursor.
map rf *:%s/<C-R>///gc<left><left><left>

" Clear search
map <silent> <C-C> :let @/ = ''<CR>

" }}}

" {{{ Plugin: Ack

let g:ackhighlight = 1

" }}}

" {{{ Plugin: Airline

let g:airline_detect_modified = 0
let g:airline_detect_paste = 0

" }}}

" {{{ Plugin: Align

autocmd VimEnter * AlignCtrl Ilp1P0=

" }}}

" {{{ Plugin: BufOnly

map <F4> :BufOnly<CR>:bd <CR>

" }}}

" {{{ Plugin: Command-T

let g:CommandTClearMap = '<C-w>'
let g:CommandTCursorStartMap = '<Home>'
let g:CommandTCursorEndMap = '<End>'
let g:CommandTMatchWindowReverse = 1
let g:CommandTTraverseSCM = 'pwd'
let g:CommandTFileScanner = 'watchman'

nnoremap <silent> <C-space> :CommandT<CR>
nnoremap <silent> <S-space> :CommandTBuffer<CR>

" }}}

" {{{ Plugin: DoxygenToolkit

autocmd FileType c,cpp set comments=0://!,O://,sO:/*!,mO:\ \ \ \ ,eO:*/

let g:DoxygenToolkit_cinoptions = 'c4C1'

let g:DoxygenToolkit_briefTag_pre = '\details '
let g:DoxygenToolkit_templateParamTag_pre = '\tparam '
let g:DoxygenToolkit_paramTag_pre = '\param '
let g:DoxygenToolkit_returnTag = '\return '
let g:DoxygenToolkit_throwTag_pre = '\throw '
let g:DoxygenToolkit_fileTag = '\file '
let g:DoxygenToolkit_authorTag = '\author '
let g:DoxygenToolkit_dateTag = '\date '
let g:DoxygenToolkit_versionTag = '\version '
let g:DoxygenToolkit_blockTag = '\name '
let g:DoxygenToolkit_classTag = '\class '
let g:DoxygenToolkit_startCommentTag = '/*! '
let g:DoxygenToolkit_startCommentBlock = '/* '
let g:DoxygenToolkit_interCommentTag = ''
let g:DoxygenToolkit_interCommentBlock = ''
let g:DoxygenToolkit_compactOneLineDoc = 'no'
let g:DoxygenToolkit_compactDoc = 'yes'

nnoremap <Leader>x :Dox<CR>

" }}}

" {{{ Plugin: EasyMotion

let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'

nmap / <Plug>(easymotion-sn)
nmap <Leader>s <Plug>(easymotion-sn)
nmap <Leader>c <Plug>(easymotion-f)
nmap <Leader>w <Plug>(easymotion-w)
nmap <Leader>W <Plug>(easymotion-W)
nmap <Leader>b <Plug>(easymotion-b)
nmap <Leader>B <Plug>(easymotion-B)
nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)

" }}}

" {{{ Plugin: Ferret

let g:FerretMap = 0
let g:FerretQFCommands = 0

nnoremap <Leader>ag :Ack -w --literal <C-r><C-w><CR>
vnoremap <Leader>ag y:Ack --literal <C-r>"<CR>

" }}}

" {{{ Plugin: FSwitch

nnoremap <silent> <Leader>oo :FSHere<cr>
nnoremap <silent> <Leader>ol :FSRight<cr>
nnoremap <silent> <Leader>oL :FSSplitRight<cr>
nnoremap <silent> <Leader>oh :FSLeft<cr>
nnoremap <silent> <Leader>oH :FSSplitLeft<cr>
nnoremap <silent> <Leader>ok :FSAbove<cr>
nnoremap <silent> <Leader>oK :FSSplitAbove<cr>
nnoremap <silent> <Leader>oj :FSBelow<cr>
nnoremap <silent> <Leader>oJ :FSSplitBelow<cr>

" }}}

" {{{ Plugin: Fugitive
"
set previewheight=25

nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>

vnoremap <silent> <leader>gl :Glog<CR>

" }}}

" {{{ Plugin: LocalVimrc


let g:localvimrc_ask = 0
let g:localvimrc_sandbox = 0
let g:localvimrc_persistent = 1

" }}}

" {{{ Plugin: NerdTree

let g:NERDTreeWinSize = 50
let g:NERDTreeWinPos = 'left'
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeMapJumpNextSibling = ''
let g:NERDTreeMapJumpPrevSibling = ''
nnoremap <F1> :NERDTreeToggle<CR>
nnoremap <C-F> :NERDTreeFind<CR>

" Close vim if the only window left open is NERDTree
autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTreeType') && b:NERDTreeType == 'primary') | q | endif

" }}}

" {{{ Plugin: Numbers

let g:numbers_exclude = ['gitcommit', 'fugitiveblame', 'nerdtree']

" }}}

" {{{ Plugin: UltiSnips

let g:UltiSnipsExpandTrigger = '<c-j>'
let g:UltiSnipsSnippetDirectories = ['ultisnips']

" }}}

" {{{ Plugin: YouCompleteMe

let g:ycm_confirm_extra_conf = 0
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <silent> <leader>gt :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>gr :YcmCompleter GetType<CR>

" }}}

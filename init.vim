" TODO install nvim with snap
" Stable build:
"sudo snap install --beta nvim --classic

" Markdown {{{
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction
" }}}

""" VimPlug {{{
call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/vim-plug', { 'on' : [] }


" Plug 'https://github.com/airblade/vim-gitgutter'

" Plug 'https://github.com/wellle/context.vim'    " Keeps a line of context at top of screen (eg. the current loop of function)

" Update in terminal by `cd ~/.fzf && git pull && ./install`
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'https://github.com/tpope/vim-fugitive'

Plug 'unblevable/quick-scope'    " Highlight unique character in words for easier 'f/F/t/T' navigation

" Plug 'jiangmiao/auto-pairs'    " Creates and deletes matching parentheses/braces etc.

" " Coc is an intellisense engine {{{
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" " }}}
" " Add matching brace {{{
" Plug 'neoclide/coc-pairs'
" " }}}

" Plug 'vim-scripts/vis'
" Plug 'jalvesaq/Nvim-R'

" Syntax checking (needs installed linter)
" Plug 'vim-syntastic/syntastic'

" grammar check
Plug 'dpelle/vim-LanguageTool'

" Plug 'skywind3000/asyncrun.vim'

" Pretty tabs
" Plug 'gcmt/taboo.vim'

" Folding
" Plug 'tmhedberg/SimpylFold'
" Plug 'Konfekt/FastFold'
" Plug 'vim-scripts/indentpython.vim'

" Markdown
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

" Plug 'https://github.com/ncm2/ncm2-jedi'
" Plug 'davidhalter/jedi-vim'

" Plug 'sbdchd/vim-run'

" vimgrep improved
"Plug 'trope/vim-unimpaired'

" commentary.vim: comment stuff out with gc
Plug 'tpope/vim-commentary'

" Tame the quickfix window 
Plug 'romainl/vim-qf/'

" Completion{{{
" " "Deprecated
" " Plug 'roxma/nvim-completion-manager'
" Plug 'roxma/nvim-yarp'
" Plug 'https://github.com/ncm2/ncm2'
" " NOTE: you need to install completion sources to get completions. Check
" " our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
" Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-path'
"Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer' }

"" Deoplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
" }}} 
"Plug 'roxma/nvim-yarp'

" Better search highlighting
Plug 'junegunn/vim-slash'

"Plug 'neomake/neomake'
Plug 'wellle/targets.vim'

Plug 'junegunn/vim-easy-align'

Plug 'tpope/vim-surround'

Plug 'lervag/vimtex'
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
    let g:tex_conceal='abdmg'
    hi Conceal ctermbg=none

"Snippets
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
"Plug 'Shougo/neosnippet.vim'
""Plug 'Shougo/neosnippet-snippets'

" Indent lines
"Plug 'Yggdroot/indentLine'

Plug 'ludovicchabant/vim-gutentags'
Plug 'astrails/dotvim'

" Fuzzy file/buffer finder
" Plug 'kien/ctrlp.vim'

" Colorscemes
Plug 'https://github.com/gregsexton/Atom'
Plug 'https://github.com/endel/vim-github-colorscheme'
Plug 'https://github.com/mkarmona/materialbox'
Plug 'fenetikm/falcon'
Plug 'jalvesaq/southernlights'
Plug 'liuchengxu/space-vim-dark'
Plug 'cocopon/iceberg.vim'
Plug 'whatyouhide/vim-gotham'
Plug 'Badacadabra/vim-archery'
Plug 'https://github.com/jnurmine/Zenburn'
Plug 'vim-scripts/mayansmoke'
Plug 'lifepillar/vim-solarized8'
Plug 'andreasvc/vim-256noir'
Plug 'dennougorilla/azuki.vim'
Plug 'emhaye/ceudah.vim'
Plug 'junegunn/seoul256.vim'

" " java
" Plug 'morhetz/gruvbox'
" Plug 'https://github.com/davetron5000/java-javadoc-vim'

" Plug 'https://github.com/majutsushi/tagbar'
" map <localleader>tb :TagBar<cr>

call plug#end()
"""}}}

" {{{ Stuff to check out
""" vis: apply ex command on selected words instead of lines. usage: {{{
"  Use V, v, or ctrl-v to visually mark some region.  Then use
"       :B cmd     (this command will appear as:   :'<,'>B cmd)
"
"    The command will then be applied to just the visually selected region.
""" }}}
" }}}

" Java {{{
let java_mark_braces_in_parens_as_errors=1
let java_highlight_all=1
let java_highlight_debug=1
let java_ignore_javadoc=1
let java_highlight_java_lang_ids=1
let java_highlight_functions="style"
let java_minlines = 150

"" Compile shortcut {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" http://vim.wikia.com/wiki/Compile_Java_with_Sun_JDK_javac
""" F9/F10 compile/run default file.
""" F11/F12 compile/run alternate file.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" map <F9> :set makeprg=javac\ %<CR>:make<CR>
autocmd Filetype java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
map <localleader>comp :make<Return>:copen<Return>
map <F10> :cprevious<Return>
map <F11> :cnext<Return>
map <localleader>run :!echo %\|awk -F. '{print $1}'\|xargs java<CR>

""    map <F9> :set makeprg=javac\ %<CR>:make<CR>
""    map <F10> :!echo %\|awk -F. '{print $1}'\|xargs java<CR>
""    map <leader>ojc :set makeprg=javac\ #<CR>:make<CR>
""    map <leader>ojr :!echo #\|awk -F. '{print $1}'\|xargs java<CR>
""    
""    map! <F9> <Esc>:set makeprg=javac\ %<CR>:make<CR>
""    map! <F10> <Esc>:!echo %\|awk -F. '{print $1}'\|xargs java<CR>
""    map! <F11> <Esc>set makeprg=javac\ #<CR>:make<CR>
""    map! <F12> <Esc>!echo #\|awk -F. '{print $1}'\|xargs java<CR>
""    
""    " Tip: load a file into the default buffer, and its driver
""    " into the alternate buffer, then use F9/F12 to build/run.
""    " Note: # (alternate filename) isn't set until you :next to it!
""    " Tip2: You can make then run without hitting ENTER to continue. F9-F12
""    
""    " With these you can cl/cn/cp (quickfix commands) to browse the errors
""    " after you compile it with :make
""    
""    set makeprg=javac\ %
""    set errorformat=%A:%f:%l:\ %m,%-Z%p^,%-C%.%#
""    
""    " If two files are loaded, switch to the alternate file, then back.
""    " That sets # (the alternate file).
""    if argc() == 2
""      n
""      e #
""    endif
"}}}

" the "K" command will look up the javadoc of the class I'm on
set keywordprg=

let java_comment_strings=1
let java_highlight_java_lang_ids=1

"Take care of indents for Java.
set autoindent
set si
set shiftwidth=4
"java anonymous classes. Sometimes, you have to use them.
set cinoptions+=j1

"}}}

" {{{ R
let Rout_more_colors = 1
" }}}

" auto-pairs (bracket matching) {{{
" " FlyMode is experimental
" let g:AutoPairsFlyMode = 0
" let g:AutoPairsShortcutBackInsert = '<M-b>'
" Shortcuts {{{
" System Shortcuts:
    " <CR>  : Insert new indented line after return if cursor in blank brackets or quotes.
    " <BS>  : Delete brackets in pair
    " <M-p> : Toggle Autopairs (g:AutoPairsShortcutToggle)
    " <M-e> : Fast Wrap (g:AutoPairsShortcutFastWrap)
    " <M-n> : Jump to next closed pair (g:AutoPairsShortcutJump)
    " <M-b> : BackInsert (g:AutoPairsShortcutBackInsert)

" If <M-p> <M-e> or <M-n> conflict with another keys or want to bind to another keys, add

    " let g:AutoPairsShortcutToggle = '<another key>'

" to .vimrc, if the key is empty string '', then the shortcut will be disabled.
" }}}
" }}}

" EasyAlign {{{
"
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" --EasyAlign-- }}}

" autosave session {{{
" (if sessionfile exists in pwd)
fu! SaveSess()
    execute 'mksession! ~/.vimsessions/session.vim'
endfunction

"fu! RestoreSess()
"    "let file = expand(g:my_vim_session)
"    "if filereadable(file)
"    if filereadable('session.vim')
"        execute 'source ' . g:my_vim_session
"    endif
"endfunction

autocmd VimLeave * call SaveSess()
" only restore the session if the user has -not- requested a specific filename
"autocmd VimEnter * if !argc() | call RestoreSess() | endif
"}}}

" Basic setup {{{

" Shorter updatetime, can hamper performance
set updatetime=100

packadd vimball

set tw=120
set mouse=a

set background=dark

set splitbelow
set splitright

" terminal colors {{{
" let g:terminal_color_0  = '#000000'
" let g:terminal_color_1  = '#cc0000'
" let g:terminal_color_2  = '#4e9a06'
" let g:terminal_color_3  = '#c4a000'
" let g:terminal_color_4  = '#3465a4'
" let g:terminal_color_5  = '#75507b'
" let g:terminal_color_6  = '#0b939b'
" let g:terminal_color_7  = '#d3d7cf'
" let g:terminal_color_8  = '#555753'
" let g:terminal_color_9  = '#ef2929'
" let g:terminal_color_10 = '#8ae234'
" let g:terminal_color_11 = '#fce94f'
" let g:terminal_color_12 = '#729fcf'
" let g:terminal_color_13 = '#ad7fa8'
" let g:terminal_color_14 = '#00f5e9'
" let g:terminal_color_15 = '#eeeeec'
" }}}


set inccommand=split

" Set relative linenumbering in current window, and regular numbering for other tabs
:set number relativenumber
:set hidden
" au FileType python colorscheme azuki

" Long | to separate windows
" set fillchars+=vert:???

:set ignorecase
:set smartcase
:nnoremap * /\<<C-R>=expand('<cword>')<CR>\><CR>
:nnoremap # ?\<<C-R>=expand('<cword>')<CR>\><CR>

" Always show statusline
set laststatus=2

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

"TabMessage() Open output of Ex cmd in new window {{{
function! TabMessage(cmd)
  redir => message
  silent execute a:cmd
  redir END
  if empty(message)
    echoerr "no output"
  else
    " use "new" instead of "tabnew" below if you prefer split windows instead of tabs
    vnew
    setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
    silent put=message
  endif
endfunction
command! -nargs=+ -complete=command TabMessage call TabMessage(<q-args>)
"}}}

""Highlight variable(++) under cursor{{{

let g:toggleHighlight = 1
function! ToggleHighlight(...)
  if a:0 == 1 "toggle behaviour
    let g:toggleHighlight = 1 - g:toggleHighlight
  endif

  if g:toggleHighlight == 0 "normal action, do the hi
    silent! exe printf('match Search /\<%s\>/', expand('<cword>'))
  else
    "do whatever you need to clear the matches
    "or nothing at all, since you are not printing the matches
  endif
endfunction

autocmd CursorMoved * call ToggleHighlight()
map <leader>ho :call ToggleHighlight(1)<cr>
map <leader>hO :call ToggleHighlight(1)<cr>

" :autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
" nnoremap <leader>ho :call HighlightOn()<cr>
" nnoremap <leader>hO :call HighlightOff()<cr>

" function HighlightUnderCursor()
"     exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
" endfunction
"function HighlightOn()
"    :autocmd CursorMoved * call HighlightUnderCursor()
"    ":autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
"endfunction

"function HighlightOff()
"    :autocmd! CursorMoved * call HighlightUnderCursor()
"    " :autocmd! CursorMoved * exe
"    ":autocmd! CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
"endfunction

" :call HighlightOn()
"}}}

" Pretty (?) syntax highlight
let python_highlight_all=1
"syntax on

filetype plugin indent on
" }}}

" remaps {{{

" Mimic Emacs Line Editing in Insert Mode Only
inoremap <C-A> <Home>
inoremap <C-B> <Left>
inoremap <C-E> <End>
inoremap <C-F> <Right>
inoremap <C-K> <Esc>lDa
inoremap <C-U> <Esc>d0xi
inoremap <C-Y> <Esc>Pa
inoremap <C-X><C-S> <Esc>:w<CR>a
inoremap <A-x> <Esc>:
inoremap <A-f> <Esc>lwi
inoremap <A-b> <Esc>bi
inoremap <A-S-f> <Esc>lWi
inoremap <A-S-b> <Esc>Bi

" cd of current window to dir of current file
:nnoremap <localleader>cd :lcd %:p:h<cr>

" Copy to clipboard
:nnoremap <Leader>yank "+y
:vnoremap <Leader>yank "+y
:nnoremap <Leader>put "+p
:vnoremap <Leader>put "+p

" vim-run shortcut
:nnoremap <localleader>R :Run<cr>
:nnoremap <localleader>p2 :!python %:p<cr>
:nnoremap <localleader>p3 :!python3 %:p<cr>
:nnoremap <localleader>ap2 :AsyncRun python %:p<cr>
:nnoremap <localleader>ap3 :AsyncRun python3 %:p<cr>
" Move lines with Ctrl-h, Ctrl-l
nnoremap <C-l> ddp
nnoremap <C-h> ddkP

" Test leader
:nnoremap <Leader>test oleader<cr><esc>

" Fold next {} block (in manual folding)
:nnoremap <localleader>f{ /{<cr>V%zf

" Format json file
nmap =j :%!python -m json.tool<CR>

" Move between tabs
:nnoremap <localleader>w :tabprevious<cr>
:nnoremap <localleader>e :tabnext<cr>

" Visual all text, similar to ctrl-a in windows (to remember: ctrl-w mark all)
:nnoremap <C-w><C-m><C-a> ggVGo

" Paste over entire file (ctrl-w put all)
:nnoremap <C-w><C-p><C-a> ggVG"+p

" To use `ALT+{h,j,k,l}` to navigate windows from any mode:
:tnoremap <A-h> <C-\><C-N><C-w>h
:tnoremap <A-j> <C-\><C-N><C-w>j<C-w>_
:tnoremap <A-k> <C-\><C-N><C-w>k<C-w>_
:tnoremap <A-l> <C-\><C-N><C-w>l
:inoremap <A-h> <C-\><C-N><C-w>h
:inoremap <A-j> <C-\><C-N><C-w>j<C-w>_
:inoremap <A-k> <C-\><C-N><C-w>k<C-w>_
:inoremap <A-l> <C-\><C-N><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j<C-w>_
:nnoremap <A-k> <C-w>k<C-w>_
:nnoremap <A-l> <C-w>l

nmap <localleader>tbt :TagbarToggle<CR>

" Correct previous spelling mistake on the fly
inoremap <C-x> <Esc>[s1z=`]a
set spelllang=en
set spell

" comment out block
" au FileType java :vnoremap <leader>co c/*<cr><cr>/<esc>kVp
" au FileType python :vnoremap <leader>co c"""<cr>"""<esc>P

" comment out lines
" au FileType java :vnoremap <a-;> <c-v>0I//<space><esc>
" au FileType python :vnoremap <a-;> <c-v>0I#<space><esc>


" }}}

" Completion-- {{{
" (python) When the expand key is pressed and nothing has been typed, a popup list
"for snippets will be triggered.
" let g:vimtex_complete_enabled = 0


"" {{{ NCM2 
"" enable ncm2 for all buffers
"autocmd BufEnter * call ncm2#enable_for_buffer()

"" IMPORTANT: :help Ncm2PopupOpen for more information
"set completeopt=noinsert,menuone,noselect

"" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
"" found' messages
"set shortmess+=c

"" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
"inoremap <c-c> <ESC>

"" When the <Enter> key is pressed while the popup menu is visible, it only
"" hides the menu. Use this mapping to close the menu and also start a new
"" line.
"inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

"" " Use <TAB> to select the popup menu:
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"" wrap existing omnifunc
"" Note that omnifunc does not run in background and may probably block the
"" editor. If you don't want to be blocked by omnifunc too often, you could
"" add 180ms delay before the omni wrapper:
" " 'on_complete': ['ncm2#on_complete#delay', 180,
" "              \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
" "
" "
" " Pevious:
"	    " \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],

" au User Ncm2Plugin call ncm2#register_source({
"	    \ 'name' : 'css',
"	    \ 'priority': 9,
"	    \ 'subscope_enable': 1,
"	    \ 'scope': ['css','scss'],
"	    \ 'mark': 'css',
"	    \ 'word_pattern': '[\w\-]+',
"	    \ 'complete_pattern': ':\s*',
"	    \ 'on_complete': ['ncm2#on_complete#delay', 180,
"	    \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
"	    \ })
"" }}}

" {{{ UltiSnips
au FileType python3 :UltiSnipsAddFiletypes python3

" let g:UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
" inoremap <silent> <c-u> <c-r>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<cr>

imap <c-g> <Plug>(cm_force_refresh)
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger	= "<tab>"
let g:UltiSnipsJumpBackwardTrigger	= "<s-tab>"
"let g:UltiSnipsRemoveSelectModeMappings = 0

" let g:UltiSnipsSnippetsDir = $HOME."/.config/nvim/plugged/ultisnips"
let g:UltiSnipsSnippetDirectories = ['ultisnips', $HOME.'/.config/nvim/plugged/ultisnips', $HOME.'/.config/nvim/plugged/vim-snippets/UltiSnips', $HOME.'/.config/nvim/vim-snippets']

let g:UltiSnipsListSnippets="<c-l>"

"Vimtex snippet
" Using UltiSnips#Anon
"inoremap <silent> __ __<c-r>=UltiSnips#Anon('_{$1}$0', '__', '', 'i')<cr>
inoremap <silent> ^^ ^^<c-r>=UltiSnips#Anon('^{$1}$0', '^^', '', 'i')<cr>
" }}}

"-- Completion-- }}}

" LaTex {{{

" Delimiter settings
let g:vimtex_delim_list = {'mods' : {}}
let g:vimtex_delim_list.mods.name = [
	    \ ['\left', '\right'],
	    \ ['\mleft', '\mright'],
	    \ ['\bigl', '\bigr'],
	    \ ['\Bigl', '\Bigr'],
	    \ ['\biggl', '\biggr'],
	    \ ['\Biggl', '\Biggr'],
	    \ ['\big', '\big'],
	    \ ['\Big', '\Big'],
	    \ ['\bigg', '\bigg'],
	    \ ['\Bigg', '\Bigg'],
	    \]
let g:vimtex_delim_toggle_mod_list = [
	    \ ['\big', '\big'],
	    \ ['\left', '\right'],
	    \ ['\mleft', '\mright'],
	    \]


" TOC settings
let g:vimtex_toc_config = {
      \ 'name' : 'TOC',
      \ 'layers' : ['content', 'todo', 'include'],
      \ 'resize' : 1,
      \ 'split_width' : 50,
      \ 'todo_sorted' : 0,
      \ 'show_help' : 1,
      \ 'show_numbers' : 1,
      \ 'mode' : 2,
      \}
" Open table of content
augroup vimrc
  autocmd!
  autocmd FileType tex nmap <buffer><silent> <localleader>ltt <plug>(vimtex-toc-open)
augroup END


au Filetype tex let tw=100
au Filetype tex ab beq \begin{equation*}
au Filetype tex ab bal \begin{align*}

" Completion with ncm2 {{{
" " {{{ alternative 1: Basic

" augroup my_cm_setup
"     autocmd!
"     autocmd BufEnter * call ncm2#enable_for_buffer()
"     autocmd Filetype tex call ncm2#register_source({
" 		\ 'name': 'vimtex',
" 		\ 'priority': 8,
" 		\ 'scope': ['tex'],
" 		\ 'mark': 'tex',
" 		\ 'word_pattern': '\w+',
" 		\ 'complete_pattern': g:vimtex#re#ncm2,
" 		\ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
" 		\ })
" augroup END

" " }}}
" {{{ alternative 2: More lenient
"
" " For more lenient, omni-complete-like, filtering of completion candidates,
" " use the following setup (in your init.vim or a personal ftplugin) instead: >
"   augroup my_cm_setup
"     autocmd!
"     autocmd BufEnter * call ncm2#enable_for_buffer()
"     autocmd Filetype tex call ncm2#register_source({
"             \ 'name' : 'vimtex-cmds',
"             \ 'priority': 8,
"             \ 'complete_length': -1,
"             \ 'scope': ['tex'],
"             \ 'matcher': {'name': 'prefix', 'key': 'word'},
"             \ 'word_pattern': '\w+',
"             \ 'complete_pattern': g:vimtex#re#ncm2#cmds,
"             \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
"             \ })
"     autocmd Filetype tex call ncm2#register_source({
"             \ 'name' : 'vimtex-labels',
"             \ 'priority': 8,
"             \ 'complete_length': -1,
"             \ 'scope': ['tex'],
"             \ 'matcher': {'name': 'combine',
"             \             'matchers': [
"             \               {'name': 'substr', 'key': 'word'},
"             \               {'name': 'substr', 'key': 'menu'},
"             \             ]},
"             \ 'word_pattern': '\w+',
"             \ 'complete_pattern': g:vimtex#re#ncm2#labels,
"             \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
"             \ })
"     autocmd Filetype tex call ncm2#register_source({
"             \ 'name' : 'vimtex-files',
"             \ 'priority': 8,
"             \ 'complete_length': -1,
"             \ 'scope': ['tex'],
"             \ 'matcher': {'name': 'combine',
"             \             'matchers': [
"             \               {'name': 'abbrfuzzy', 'key': 'word'},
"             \               {'name': 'abbrfuzzy', 'key': 'abbr'},
"             \             ]},
"             \ 'word_pattern': '\w+',
"             \ 'complete_pattern': g:vimtex#re#ncm2#files,
"             \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
"             \ })
"     autocmd Filetype tex call ncm2#register_source({
"             \ 'name' : 'bibtex',
"             \ 'priority': 8,
"             \ 'complete_length': -1,
"             \ 'scope': ['tex'],
"             \ 'matcher': {'name': 'combine',
"             \             'matchers': [
"             \               {'name': 'prefix', 'key': 'word'},
"             \               {'name': 'abbrfuzzy', 'key': 'abbr'},
"             \               {'name': 'abbrfuzzy', 'key': 'menu'},
"             \             ]},
"             \ 'word_pattern': '\w+',
"             \ 'complete_pattern': g:vimtex#re#ncm2#bibtex,
"             \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
"             \ })
"   augroup END
"
" }}}
" }}}

" {{{ Completion with deoplete
" This is new style
call deoplete#custom#var('omni', 'input_patterns', {
	    \ 'tex': g:vimtex#re#deoplete
	    \})
" }}}

let g:vimtex_fold_enabled = 0
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_index_show_help = 0
" let g:vimtex_view_general_viewer='mupdf'
" let g:vimtex_view_method = 'mupdf'
" let g:vimtex_view_mupdf_options = '-r 288'

let g:vimtex_latexmk_continuous = 0

" Conceal for LaTex

au Filetype tex set conceallevel=1
let g:tex_conceal="abdgm"
" hi Conceal guibg=#000000

" --vimTex--


"Fix for nvim vimtex 'clientserve' problem
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_automatic = 0
let g:vimtex_view_general_viewer='zathura'
let g:vimtex_view_method = 'zathura'
"Helps nvim correctly interpret .tex files
let g:tex_flavor = 'latex'

let g:vimtex_compiler_latexmk = {
	    \ 'build_dir' : './build',
	    \ 'options' : [
	    \   '-pdf',
	    \   '-shell-escape',
	    \   '-verbose',
	    \   '-file-line-error',
	    \   '-synctex=1',
	    \   '-interaction=nonstopmode',
	    \ ],
	    \}

" au FileType tex VimtexView    " Open pdf automatically
:nnoremap <localleader>lv :VimtexView<cr>
""TODO

" Surround
augroup latexSurround
   autocmd!
   autocmd FileType tex call s:latexSurround()
augroup END

function! s:latexSurround()
   let b:surround_{char2nr("e")}
     \ = "\\begin{\1environment: \1}\n\t\r\n\\end{\1\1}"
   let b:surround_{char2nr("c")} = "\\\1command: \1{\r}"
endfunction

" " completion - completion manager
" augroup my_cm_setup
" autocmd!
" autocmd User CmSetup call cm#register_source({
"       \ 'name' : 'vimtex',
"       \ 'priority': 8,
"       \ 'scoping': 1,
"       \ 'scopes': ['tex'],
"       \ 'abbreviation': 'tex',
"       \ 'cm_refresh_patterns': g:vimtex#re#ncm,
"       \ 'cm_refresh': {'omnifunc': 'vimtex#complete#omnifunc'},
"       \ })
" augroup END


" Events
"
" Compile on initialization, cleanup on quit
augroup vimtex_event_1
    au!
    au User VimtexEventQuit     call vimtex#compiler#clean(0)
    au User VimtexEventInitPost call vimtex#compiler#compile()
augroup END

" Close viewers on quit
function! CloseViewers()
    if executable('xdotool') && exists('b:vimtex')
        \ && exists('b:vimtex.viewer') && b:vimtex.viewer.xwin_id > 0
      call system('xdotool windowclose '. b:vimtex.viewer.xwin_id)
    endif
endfunction

augroup vimtex_event_2
    au!
    au User VimtexEventQuit call CloseViewers()
augroup END
" --vimtex-- }}}

" Folding {{{

let g:SimpylFold_fold_docstring=1
let g:SimpylFold_fold_import=1

if &foldmethod ==# ''
  set foldmethod=syntax
endif


" Java
au FileType java set foldmethod=manual

"au FileType java set foldenable
"au FileType java syn region foldBraces start=/{/ end=/}/ transparent fold
"au FileType java syn region foldJavadoc start=,/\*\*, end=,\*/, transparent fold keepend
"
"au FileType java syn region javaMethod start="^\z(\s*\)\(public\|private\|protected\)\_.*{\s*$" end="^\z1}\s*$" transparent fold keepend
"au FileType java syn region javaLoop start="^\z(\s*\)\(for\|if\|while\|switch\).*{\s*$" end="^\z1}\s*$" transparent fold keepend
"au FileType java syn region javaCase start="^\z(\s*\)\(case\|default\).*:\s*$" end="^\s*break;\s*$" transparent fold keepend
"au FileType java syn region javaTryCatch start="^\z(\s*\)\(try\|catch\).*{\s*$" end="^\z1}\s*$" transparent fold keepend
"au FileType java syn region javadoc start="^\s*/\*\*" end="^.*\*/" transparent fold keepend
"au FileType java syn region javaBlockComment start="^\s*/\*" end="^.*\*/" transparent fold keepend

set foldlevel=0
set foldcolumn=0
set foldtext=TxtFoldText()

function! TxtFoldText()
  let level = repeat('-', min([v:foldlevel-1,3])) . '+'
  let title = substitute(getline(v:foldstart), '{\{3}\d\?\s*', '', '')
  let title = substitute(title, '^["#! ]\+', '', '')
  return printf('%-4s %-s', level, title)
endfunction

" Navigate folds
nnoremap          zf zMzvzz
nnoremap <silent> zj :silent! normal! zc<cr>zjzvzz
nnoremap <silent> zk :silent! normal! zc<cr>zkzvzz[z

"set foldmethod=manual
" --Folding-- }}}

" Easier file finding with :Find {{{
" Find file in current directory and edit it.
function! Find(name)
  let l:list=system("find . -name '".a:name."' | perl -ne 'print \"$.\\t$_\"'")
" replace above line with below one for gvim on windows
" let l:list=system("find . -name ".a:name." | perl -ne \"print qq{$.\\t$_}\"")
  let l:num=strlen(substitute(l:list, "[^\n]", "", "g"))
  if l:num < 1
    echo "'".a:name."' not found"
    return
  endif
  if l:num != 1
    echo l:list
    let l:input=input("Which ? (CR=nothing)\n")
    if strlen(l:input)==0
      return
    endif
    if strlen(substitute(l:input, "[0-9]", "", "g"))>0
      echo "Not a number"
      return
    endif
    if l:input<1 || l:input>l:num
      echo "Out of range"
      return
    endif
    let l:line=matchstr("\n".l:list, "\n".l:input."\t[^\n]*")
  else
    let l:line=l:list
  endif
  let l:line=substitute(l:line, "^[^\t]*\t./", "", "")
  execute ":e ".l:line
endfunction
command! -nargs=1 Find :call Find("<args>")
" --Easier file finding with :Find-- }}}

" LanguageTool {{{
:let g:languagetool_jar='$HOME//Downloads/languagetool/languagetool-standalone/target/LanguageTool-4.6-SNAPSHOT/LanguageTool-4.6-SNAPSHOT/languagetool-commandline.jar'
" }}}

" Colortheme {{{
"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
" colorscheme peachpuff-jonas
colorscheme jonas_atom
" --Colortheme-- }}}

" vim:foldmethod=marker:foldlevel=0

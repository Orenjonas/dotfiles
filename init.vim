
" arkdown {{{
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

Plug 'skywind3000/asyncrun.vim'

Plug 'junegunn/vim-plug', { 'on' : [] }
Plug 'tmhedberg/SimpylFold'
Plug 'Konfekt/FastFold'
Plug 'vim-scripts/indentpython.vim'

Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

" Plug 'davidhalter/jedi-vim'

Plug 'sbdchd/vim-run'

" Racket/scheme
" Plug 'kovisoft/slimv'
" Plug 'jpalardy/vim-slime'

" vimgrep improved
"Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'romainl/vim-qf/'

" Completion{{{
Plug 'roxma/nvim-completion-manager'
"Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer' }

"" Deoplete
"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
"endif
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
Plug 'kien/ctrlp.vim'

" Colorscemes
Plug 'liuchengxu/space-vim-dark'
Plug 'cocopon/iceberg.vim'
Plug 'whatyouhide/vim-gotham'
Plug 'Badacadabra/vim-archery'
Plug 'https://github.com/jnurmine/Zenburn'
Plug 'vim-scripts/mayansmoke'
Plug 'lifepillar/vim-solarized8'
Plug 'andreasvc/vim-256noir'
Plug 'dennougorilla/azuki.vim'
Plug 'jalvesaq/southernlights'
Plug 'emhaye/ceudah.vim'
Plug 'junegunn/seoul256.vim'

" java
Plug 'morhetz/gruvbox'
Plug 'https://github.com/davetron5000/java-javadoc-vim'

Plug 'https://github.com/majutsushi/tagbar'
call plug#end()
"""}}}


" SLIME {{{
let g:slime_target = "neovim"
let g:paredit_mode=0

" Usage
" - Open terminal
" - Start REPL with plt-r5rs
" - Get terminal id with :echo b:terminal_job_id
" - Send sexp with C-c C-c (input job id at prompt)
"}}}

" Java {{{
let java_mark_braces_in_parens_as_errors=1
let java_highlight_all=1
let java_highlight_debug=1
let java_ignore_javadoc=1
let java_highlight_java_lang_ids=1
let java_highlight_functions="style"
let java_minlines = 150

" Compile shortcut {{{
" http://vim.wikia.com/wiki/Compile_Java_with_Sun_JDK_javac
" F9/F10 compile/run default file.
" F11/F12 compile/run alternate file.

" map <F9> :set makeprg=javac\ %<CR>:make<CR>
autocmd Filetype java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
map <leader>c :make<Return>:copen<Return>
map <F10> :cprevious<Return>
map <F11> :cnext<Return>
map <leader>r :!echo %\|awk -F. '{print $1}'\|xargs java<CR>

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

au FileType java colorscheme ceudah_jonas

fu Retting()
    :colorscheme buttercream
    au FileType java colorscheme buttercream
    :call ToggleHighlight()
endfunction

fu JavaCol(color)
    exe ':colorscheme ' . a:color
    exe 'au FileType java colorscheme ' . a:color
endfunction

fu Peachpuff()
    :colorscheme peachpuff
    au FileType java colorscheme peachpuff
    :call ToggleHighlight()
endfunction
"}}}

" EasyAlign {{{
"
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" --EasyAlign-- }}}

" Colortheme {{{
if has('gui_running')
	" Solarized theme
	set background=dark
	let g:solarized_termtrans=1
	let g:solarized_termcolors=256
	colorscheme solarized
else
	colorscheme greenslime
endif

"" Zenburn theme
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"colorscheme zenburn
"let g:zenburn_high_Contrast=1
"set background=dark " or light

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
" --Colortheme-- }}}

" autosave session {{{
" (if sessionfile exists in pwd)
fu! SaveSess()
    execute 'mksession! session.vim'
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
" Set relative linenumbering in current window, and regular numbering for other tabs
:set number relativenumber
:set hidden

au FileType python colorscheme greenslime

" Long | to separate windows
" set fillchars+=vert:│

" :set ignorecase
" :set smartcase

" Always show statusline
set laststatus=2

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

""Highlight variable(++) under cursor{{{

let g:toggleHighlight = 0
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
"
" Copy to clipboard
:nnoremap <Leader>y "+y
:vnoremap <Leader>y "+y
:nnoremap <Leader>p "+p
:vnoremap <Leader>p "+p

" vim-run shortcut
:nnoremap <Leader>R :Run<cr>
:nnoremap <Leader>p2 :!python %:p<cr>
:nnoremap <Leader>p3 :!python3 %:p<cr>
:nnoremap <Leader>ap2 :AsyncRun python %:p<cr>
:nnoremap <Leader>ap3 :AsyncRun python3 %:p<cr>
" Move lines with Ctrl-h, Ctrl-l
nnoremap <C-h> ddp
nnoremap <C-l> ddkP

" Test leader
:nnoremap <Leader>test oleader<cr><esc>

" Fold next {} block (in manual folding)
:nnoremap <Leader>f{ /{<cr>V%zf

" Move between tabs
:nnoremap <Leader>j :tabprevious<cr>
:nnoremap <Leader>k :tabnext<cr>

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

nmap <Leader>t :TagbarToggle<CR>

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

au FileType python3 :UltiSnipsAddFiletypes python3

let g:UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
inoremap <silent> <c-u> <c-r>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<cr>

"When the <Enter> key is pressed while the popup menu is visible, it only hides
"the menu. Use this mapping to hide the menu and also start a new line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

imap <c-g> <Plug>(cm_force_refresh)
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
"let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
"let g:UltiSnipsRemoveSelectModeMappings = 0

let g:UltiSnipsSnippetsDir = $HOME."/.config/nvim/plugged/ultisnips"
let g:UltiSnipsSnippetDirectories = ['ultisnips', $HOME.'/.config/nvim/plugged/ultisnips', $HOME.'/.config/nvim/plugged/vim-snippets/UltiSnips']

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:UltiSnipsListSnippets="<c-l>"

"Vimtex snippet
" Using UltiSnips#Anon
"inoremap <silent> __ __<c-r>=UltiSnips#Anon('_{$1}$0', '__', '', 'i')<cr>
inoremap <silent> ^^ ^^<c-r>=UltiSnips#Anon('^{$1}$0', '^^', '', 'i')<cr>
"-- Completion-- }}}

" LaTex {{{

" Conceal for LaTex

set conceallevel=2
let g:tex_conceal="abdgm"
hi Conceal guibg=#000000

" --vimTex--


"Fix for nvim vimtex 'clientserve' problem
let g:vimtex_latexmk_build_dir = './build'
" let g:vimtex_latexmk_progname = 'nvr'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_general_viewer='zathura'
let g:vimtex_view_method = 'zathura'
"Helps nvim correctly interpret .tex files
let g:tex_flavor = 'latex'
"{{{
"if has('nvim')
"  let g:vimtex_compiler_progname = 'nvr'
"endif
"
"if !exists('g:neocomplete#sources#omni#input_patterns')
"   let g:neocomplete#sources#omni#input_patterns = {}
"endif
"   let g:neocomplete#sources#omni#input_patterns.tex =
"	\ g:vimtex#re#neocomplete
"


"if !exists('g:ycm_semantic_triggers')
"    let g:ycm_semantic_triggers = {}
"  endif
"let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme

""YouCompleteMe LaTex semantic completion
"let g:ycm_semantic_triggers = {
"    \ 'tex'  : ['{']
"\}
"}}}

au FileType tex VimtexView
:nnoremap <Leader>lv :VimtexView<cr>
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

" completion - completion manager
augroup my_cm_setup
autocmd!
autocmd User CmSetup call cm#register_source({
      \ 'name' : 'vimtex',
      \ 'priority': 8,
      \ 'scoping': 1,
      \ 'scopes': ['tex'],
      \ 'abbreviation': 'tex',
      \ 'cm_refresh_patterns': g:vimtex#re#ncm,
      \ 'cm_refresh': {'omnifunc': 'vimtex#complete#omnifunc'},
      \ })
augroup END


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


" vim:foldmethod=marker:foldlevel=0

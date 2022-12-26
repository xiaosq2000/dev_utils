set nocompatible
call plug#begin()
Plug 'sheerun/vim-polyglot'
Plug 'sainnhe/everforest'
Plug 'ycm-core/YouCompleteMe'
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'ekalinin/Dockerfile.vim'
call plug#end()
set nobackup                   " no backup files
set noswapfile                 " no swap files
set encoding=utf-8             " unicode encoding
set shell=/bin/bash            " use bash
"set shellcmdflag=-ic           " flag passed to the shell to execute "!" and ":!" commands
set wrap                       " lines longer than the width display on the next line
set backspace=indent,eol,start " allow backspacing over everything in insert mode. 
set ruler                      " show the line and column number of the cursor position
set autoindent                 " copy indent from current line when starting a new line
set showmatch                  " when a bracket is inserted, briefly jump to the matching one
set showcmd	   	               " display incomplete commands
set number                     " display line numbers
set relativenumber             " display relative line numbers
set wildmenu		               " display completion matches in a status line
set timeout                    " time out on :mappings and key codes
set ttimeoutlen=100            " The time in milliseconds that is waited for a keycode to complete.
set timeoutlen=1000            " The time in milliseconds that is waited for a mapped key sequence to complete.
set display=truncate           " Show @@@ in the last line if it is truncated.
set incsearch                  " incremental search
set tabstop=2                  " number of spaces that a <Tab> in the file counts for
set softtabstop=2              " number of spaces that a <Tab> counts for while performing editing operations
set shiftwidth=2               " number of spaces to use for each step of (auto)indent.
set expandtab                  " use spaces instead of tabs

inoremap jk <ESC>

" Put these in an autocmd group, so that you can revert them with:
" ":augroup vim_startup | exe 'au!' | augroup END"
augroup vim_startup
  au!
  " When editing a file, always jump to the last known cursor position. Don't do it when the position is invalid, when inside an event handler (happens when dropping a file on gvim) and for a commit message (it's likely a different one than last time).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif
augroup END
" cursor
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
" color
if has('termguicolors')
  set termguicolors
endif

" plugin: everforest colortheme
if filereadable(expand("$HOME/.vim/plugged/everforest/colors/everforest.vim"))
" set background=light
  set background=dark
  let g:everforest_background = 'soft' " soft, medium or hard
  if exists('g:loaded_sensible')
    let g:everforest_better_performance = 1
  endif
  colorscheme everforest
endif

" plugin: you-complete-me
if exists('g:loaded_youcompleteme')
  let g:ycm_clangd_uses_ycmd_caching = 0           " Let clangd fully control code completion
  let g:ycm_clangd_binary_path = exepath("clangd") " Use installed clangd, not YCM-bundled clangd which doesn't get updates.
  " cpp shortcuts 
  augroup ycm_cpp_shortcuts
    au!
    autocmd FileType c,cpp,h,hpp
      \ nnoremap <buffer> <C-]> :YcmCompleter GoTo<CR> 
      \ | nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR> 
      \ | nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
  augroup END
endif

" plugin: vimtex
if exists('g:loaded_vimtex')
  let g:vimtex_view_method = 'zathura'
  let g:vimtex_compiler_latexmk = {
      \ 'build_dir' : '',
      \ 'callback' : 1,
      \ 'continuous' : 1,
      \ 'executable' : 'latexmk',
      \ 'hooks' : [],
      \ 'options' : [
      \   '-verbose',
      \   '-file-line-error',
      \   '-synctex=1',
      \   '-interaction=nonstopmode',
      \   '-shell-escape'
      \ ],
      \}
  augroup vimtex_tex_root
    autocmd!
    autocmd BufReadPre **/*.tex
          \ let b:vimtex_main = './main.tex'
  augroup END
  augroup vimtex_ycm
    autocmd!
    if !exists('g:ycm_semantic_triggers')
      let g:ycm_semantic_triggers = {}
    endif
    au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme
  augroup END
endif

inoremap jk <ESC>
set encoding=utf-8
set nobackup      
set noswapfile    
set expandtab
set tabstop=4     
set softtabstop=4 
set shiftwidth=4  
set autoindent    
syntax on         
set number        
set relativenumber
set showmatch     
set wrap          
set autoread      
set showcmd       
set wildmenu      
set hlsearch      
set incsearch     
let g:molokai_original = 1
let g:rehash256 = 1
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
vmap <C-c> y:new ~/.vimbuffer<CR>VGp:x<CR> \| :!cat ~/.vimbuffer \| clip.exe <CR><CR>
map <C-v> :r ~/.vimbuffer<CR>

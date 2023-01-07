call plug#begin('~/.config/nvim/plugged')
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'ayu-theme/ayu-vim'
  Plug 'neovim/nvim-lspconfig'
  Plug 'deoplete-plugins/deoplete-lsp'
  Plug 'morhetz/gruvbox'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-commentary'
  Plug 'jiangmiao/auto-pairs'
  Plug 'purescript-contrib/purescript-vim'
  Plug 'kevinhwang91/nvim-bqf'
  Plug 'nvim-treesitter/nvim-treesitter', { 'do':':TSUpdate' }

  Plug 'shortcuts/no-neck-pain.nvim', { 'tag': '*' }

	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  " post istall (yarn install | npm install)
  Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
call plug#end()

"execute 'source' fnamemodify(expand('<sfile>'), ':h').'/main.vim'


filetype plugin indent on
" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
set shiftround

"turn off line wrapping
set nowrap

"show line numbers
set number

"enable mouse support
set mouse=a

"smartcase searches (needs ignorecase to work)
set ignorecase
set smartcase

let g:airline#extensions#tabline#enabled = 1

let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.9 } }


"keep cursor centered always
nnoremap j jzz
nnoremap k kzz
nnoremap G Gzz
nnoremap } }zz
nnoremap { {zz
nnoremap n nzz
nnoremap N Nzz
"also in visual mode
vnoremap j jzz
vnoremap k kzz
vnoremap G Gzz
vnoremap } }zz
vnoremap { {zz
vnoremap n nzz
vnoremap N Nzz

"map aliases from zsh for easy usage in vim
"
"npm run build
nnoremap <C-b> :!b <CR>
"npm run test
nnoremap <C-t> :!t <CR>

vnoremap <C-y> "+y
nnoremap <C-p> "+p


"use NERDTree if opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

let NERDTreeQuitOnOpen=1


"enable deoplete
let g:deoplete#enable_at_startup = 1

call deoplete#custom#source('_', 'smart_case', v:true)


let g:ale_fixers = { 'javascript': ['eslint'] }
 
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

let g:ale_fix_on_save = 1

"use <tab> for completion
function! TabWrap()
    if pumvisible()
        return "\<C-N>"
    elseif strpart( getline('.'), 0, col('.') - 1 ) =~ '^\s*$'
        return "\<tab>"
    elseif &omnifunc !~ ''
        return "\<C-X>\<C-O>"
    else
        return "\<C-N>"
    endif
endfunction


" power tab
imap <silent><expr><tab> TabWrap()

" Enter: complete&close popup if visible (so next Enter works); else: break undo
inoremap <silent><expr> <Cr> pumvisible() ?
            \ deoplete#close_popup(): "<C-g>u<Cr>"

" Ctrl-Space: summon FULL (synced) autocompletion
inoremap <silent><expr> <C-Space> deoplete#mappings#manual_complete()

" Escape: exit autocompletion, go to Normal mode
inoremap <silent><expr> <Esc> pumvisible() ? "<C-e><Esc>" : "<Esc>"

let g:ale_linters = {'javascript': ['eslint']}

if (has("termguicolors"))
 set termguicolors
endif

syntax enable
let ayucolor="mirage"
colorscheme ayu
" set background=dark " or light if you want light mode
" colorscheme gruvbox


"set leader to space
nmap <Space> <leader>

inoremap <c-u> viwUea

" leader is set to space at the top of this file
" this means that we can trigger custom commands 
" using spacebar+somekey when in normal mode
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q!
nnoremap <leader>qq :q<cr>
nnoremap <leader>i :!npm i <CR>
nnoremap <leader>b  :Buffers<CR>
nnoremap <leader>t :vs<CR>:term<CR> 
nnoremap <leader>gp :!gp<CR>
nnoremap <leader>gs :!gs<CR>
nnoremap <leader>s :wa<CR>
nnoremap <leader>o :FZF<CR>
nnoremap <leader>vs :vs<CR>

"git mappings
nnoremap <leader>gpl :Git pull<CR>
nnoremap <leader>gd :Git diff<CR>
nnoremap <leader>gb :Git blame<CR>

"move line up
nnoremap - ddpzz
nnoremap _ ddkPzz

nnoremap <c-u> <esc>viwUea
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :wa<cr>:source $MYVIMRC<cr>
nnoremap <leader>wq :wq<cr>
nnoremap <leader>ff yiw:Rg <C-r>"<cr>
nnoremap <leader>f :Rg 
nnoremap <leader>n <C-w><C-w>
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-\=> <C-w>=
nnoremap <leader>a :NERDTreeToggle<cr>
nnoremap <leader>c :w<cr>:!cat % \| pbcopy<cr>
"nnoremap <leader>r :w<cr>:!node solution.js<cr>
nnoremap <leader>h :nohl<cr>
nnoremap <leader>tn :tabNext<cr>
nnoremap <leader>tt :tabnew<cr>
nnoremap <leader>ca <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap gR <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap gh <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap gt <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <leader>e :lua vim.diagnostic.open_float()<CR>
nnoremap <leader>d :lua vim.diagnostic.goto_next()<CR>

"for terminal-normal mode. Run the the previous command again
" nnoremap <C-k> i<Up><CR>

"terminal mode
tnoremap <Esc> <C-\><C-n>
tnoremap <leader><Esc> <Esc>

"visual mode
"
"search for selecte text 
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR> 


"LSP  configs
lua << EOF
require'lspconfig'.tsserver.setup{}
require'lspconfig'.jsonls.setup{}
require'lspconfig'.purescriptls.setup{}
EOF

"statusline
"set statusline=
"set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
"set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
"set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
"set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
"set statusline+=\ %n\           " buffer number
"set statusline+=%#Visual#       " colour
"set statusline+=%{&paste?'\ PASTE\ ':''}
"set statusline+=%{&spell?'\ SPELL\ ':''}
""set statusline+=%#CursorIM#     " colour
"set statusline+=%R                        " readonly flag
"set statusline+=%M                        " modified [+] flag
"set statusline+=%#Cursor#               " colour
"set statusline+=%#CursorLine#     " colour
"set statusline+=\ %F\                   " short file name
"set statusline+=%=                          " right align
"set statusline+=%#CursorLine#   " colour
"set statusline+=\ %Y\                   " file type
"set statusline+=%#CursorIM#     " colour
"set statusline+=\ %3l:%-2c\         " line + column
"set statusline+=%#Cursor#       " colour
"set statusline+=\ %3p%%\                " percentage


"" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

"airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


let g:vim_parinfer_globs = ['*.scm']
let g:vim_parinfer_filetypes = ['scheme']

let g:scheme_executable = "racket"


source ~/.config/nvim/dbx.vim

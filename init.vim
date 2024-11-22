let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
  Plug 'olimorris/onedarkpro.nvim'
  " Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  " Plug 'junegunn/fzf.vim'
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  " Plug 'ayu-theme/ayu-vim'
  Plug 'neovim/nvim-lspconfig'
  Plug 'wojciechkepka/vim-github-dark'
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
  " Plug 'MrcJkb/haskell-tools.nvim'
  Plug 'github/copilot.vim'
  " Plug 'rmagatti/auto-session'
  Plug 'williamboman/mason.nvim'
  Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
  Plug 'ibhagwan/fzf-lua', {'branch': 'main'}


  "Might want to try this plugin again at some point, but it doesn't seem like
  "it's really really for prime time yet
  "Plug 'shortcuts/no-neck-pain.nvim', { 'tag': '*' }

	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'prettier/vim-prettier', {'do': 'npm install'}

call plug#end()

" lua << EOF
" require("mason").setup()
" EOF
"execute 'source' fnamemodify(expand('<sfile>'), ':h').'/main.vim'

"prettier config
" let g:prettier#quickfix_enabled = 0 "this gets annoying with the fixOnType functionality :) 
" autocmd TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html PrettierAsync

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

"if a buffer is unchanged in vim and changes on disk, read it from disk
set autoread

"always open horizontal splits below the current window
set splitbelow

let g:airline#extensions#tabline#enabled = 1

let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.9 } }


"keep cursor centered always
nnoremap j gjzz
nnoremap k gkzz
nnoremap G Gzz
nnoremap } }zz
nnoremap { {zz
nnoremap n nzz
nnoremap N Nzz
"nnoremap gd 
"also in visual mode
vnoremap j gjzz
vnoremap k gkzz
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

" Like bufdo but restore the current buffer.
function! BufDo(command)
  let currBuff=bufnr("%")
  execute 'bufdo ' . a:command
  execute 'buffer ' . currBuff
endfunction
com! -nargs=+ -complete=command Bufdo call BufDo(<q-args>)


"enable deoplete
let g:deoplete#enable_at_startup = 1

call deoplete#custom#source('_', 'smart_case', v:true)


let g:ale_fixers = { 'javascript': ['eslint'] }
 
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

let g:ale_fix_on_save = 1

"use <tab> for completion
" function! TabWrap()
"     if pumvisible()
"         return "\<C-N>"
"     elseif strpart( getline('.'), 0, col('.') - 1 ) =~ '^\s*$'
"         return "\<tab>"
"     elseif &omnifunc !~ ''
"         return "\<C-X>\<C-O>"
"     else
"         return "\<C-N>"
"     endif
" endfunction


" power tab
" imap <silent><expr><tab> TabWrap()

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
" let ayucolor="mirage"
" colorscheme ayu
" colorscheme onedark_vivid
 
" set background=dark " or light if you want light mode
" colorscheme gruvbox

" colorscheme ghdark
colorscheme catppuccin-macchiato



"set leader to space
nmap <Space> <leader>
vmap <Space> <leader>

inoremap <c-u> viwUea

" terminal management
let s:command = 'term://zsh'
let s:vimlcmd = 'bel 10sp'
let s:vimlcmd = 'edit'
fu! TerminalOnce()
  if exists('s:currterm')
    if bufexists(s:currterm)
      exec s:vimlcmd.' '.s:currterm
    else
      unlet s:currterm
      call TerminalOnce()
    endif
  else
    exec s:vimlcmd.' 's:command
    let s:currterm = bufname()
  endif
endf
nnoremap <leader>t  :vs<cr>:call TerminalOnce()<cr><c-w>J:resize 20<cr>


" leader is set to space at the top of this file
" this means that we can trigger custom commands 
" using spacebar+somekey when in normal mode
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q!
nnoremap <leader>qq :q<cr>
nnoremap <leader>i :!npm i <CR>
nnoremap <leader>b  :FzfLua buffers<CR>
nnoremap <leader>gp :!gp<CR>
nnoremap <leader>gs :!gs<CR>
nnoremap <leader>s :wa<CR>
nnoremap <leader>o :FzfLua files<CR>
nnoremap <leader>/ :BLines 
nnoremap <leader>vs :vs<CR>

"git mappings
nnoremap <leader>gpl :Git pull<CR>
nnoremap <leader>gd :Git diff<CR>
nnoremap <leader>gb :Git blame<CR>

"move line up
nnoremap - ddpzz
nnoremap _ ddkPzz

nnoremap <c-u> <esc>viwUea
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :wa<cr>:source $MYVIMRC<cr>
nnoremap <leader>wq :wq<cr>
nnoremap <leader>ff yiw:Rg <C-r>"<cr>
nnoremap <leader>f :Rg 
vnoremap f y:Rg <C-r>"<cr>
vnoremap <leader>e y:e <C-r>"<cr>
nnoremap ge yiW:e <C-r>"<cr>
nnoremap <leader>n <C-w><C-w>
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
"nnoremap <C-=> <C-w>=
nnoremap <leader>a :NERDTreeToggle<cr>
nnoremap <leader>e :NERDTreeFind<cr>zz
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
nnoremap <leader>E :lua vim.diagnostic.open_float()<CR>
nnoremap <leader>d :lua vim.diagnostic.goto_next()<CR>
nnoremap <leader>pp :lua vim.lsp.buf.format{asyc=true}<CR>
nnoremap <leader>R :Bufdo e<cr>
nnoremap <m-j> 5jzz
nnoremap <m-k> 5kzz

nmap <leader>sg :silent exec '!open https://sourcegraph.pp.dropbox.com/server/-/blob/%\?L\' . line(".")<CR>
nmap gx :silent !open <cWORD><cr>




"for terminal-normal mode. Run the the previous command again
" nnoremap <C-k> i<Up><CR>

"terminal mode
tnoremap <Esc><Esc> <C-\><C-n>
tnoremap <leader><Esc> <Esc>
tnoremap <C-l> <C-w>l
tnoremap <C-j> <C-w>j
tnoremap <C-k> <C-w>k
tnoremap <C-h> <C-w>h

"visual mode
"
"search for selected text 
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR> 


"LSP  configs
lua << EOF
function enhance_attach(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    lsp_before_save(bufnr)
  end
  vim.api.nvim_buf_set_option(0, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

require 'lspconfig'.ts_ls.setup{}
-- require'lspconfig'.tsserver.setup{
--  cmd = {'/Users/mschu/src/server/node_modules/typescript/bin/tsserver', '--stdio'},
  -- flags = {
    -- debounce_text_changes = 150
  -- },
-- }
-- require'lspconfig'.jsonls.setup{}
-- require'lspconfig'.purescriptls.setup{}
require'lspconfig'.pylsp.setup{}


require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "typescript", "python", "go" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },
  },
}
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


"air-line
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
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ' '
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


let g:vim_parinfer_globs = ['*.scm']
let g:vim_parinfer_filetypes = ['scheme']

let g:scheme_executable = "racket"


"source ~/.config/nvim/dbx.vim



"haskell config

" lua << EOF
" local ht = require('haskell-tools')
" local def_opts = { noremap = true, silent = true, }
" ht.setup {
"   hls = {
"     on_attach = function(client, bufnr)
"       local opts = vim.tbl_extend('keep', def_opts, { buffer = bufnr, })
"       -- haskell-language-server relies heavily on codeLenses,
"       -- so auto-refresh (see advanced configuration) is enabled by default
"       vim.keymap.set('n', '<space>r', vim.lsp.codelens.run, opts)
"       vim.keymap.set('n', '<space>hs', ht.hoogle.hoogle_signature, opts)
"       -- default_on_attach(client, bufnr)  -- if defined, see nvim-lspconfig
"     end,
"   },
" }
" -- Suggested keymaps that do not depend on haskell-language-server
" -- Toggle a GHCi repl for the current package
" vim.keymap.set('n', '<leader>rr', ht.repl.toggle, def_opts)
" -- Toggle a GHCi repl for the current buffer
" vim.keymap.set('n', '<leader>rf', function()
"   ht.repl.toggle(vim.api.nvim_buf_get_name(0))
" end, def_opts)
" vim.keymap.set('n', '<leader>rq', ht.repl.quit, def_opts)
" EOF

source ~/.config/nvim/dbx.vim


"makes it impossible to open a file in the nerdtree tab
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

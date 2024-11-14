" plugins (vim plug)
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-fugitive'
Plug 'SirVer/ultisnips'
Plug 'leafOfTree/vim-matchtag'
Plug 'alvan/vim-closetag'
Plug 'AndrewRadev/tagalong.vim'
Plug 'amadeus/vim-convert-color-to'
Plug 'matze/vim-move'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'joshdick/onedark.vim'
Plug 'preservim/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
call plug#end()

" basic sets
filetype plugin on
filetype indent off
syntax on
set nocompatible
set autoindent
set smartindent
set cindent
set tabstop=4
set shiftwidth=4
set expandtab
set exrc
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set completeopt=menuone,noinsert,noselect
set updatetime=50
set shortmess+=c
set encoding=utf-8
set complete+=kspell
set nofoldenable
set splitbelow
set nowrap
set title
set mouse=a
set termguicolors
set background=dark
set laststatus=0
set clipboard=unnamedplus

" Pmenu color scheme
func! s:my_colors_setup() abort
	hi Pmenu guibg=#111111 gui=NONE
	hi PmenuSel guibg=#222222 gui=NONE
	hi PmenuSel guifg=#999999 gui=NONE
	hi PmenuSbar guibg=#000000
	hi PmenuThumb guibg=#000000
endfunc
augroup colorscheme_coc_setup | au!
	au ColorScheme * call s:my_colors_setup()
augroup END

" theme
let g:onedark_color_overrides = { "background": { "gui": "#000000", "cterm": "235", "cterm16": "0" } }
colorscheme onedark

" Enable syntax highlighting for .asm, .s, .S files
augroup AssemblySyntax
  autocmd!
  autocmd BufRead,BufNewFile *.asm,*.s,*.S set filetype=asm
augroup END

" fix syntax highlighting from turning off
autocmd BufEnter * syntax sync fromstart

" better python syntax highlighting
let g:python_highlight_all = 1

" increase buffer size in python file
let g:black_linelength = 120

" Use K to show documentation in preview window.
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>

" go to definition code navigation.
nmap <silent> gd <Plug>(coc-definition)

" switch between buffers
nnoremap <C-n> :bnext<CR>
nnoremap <C-b> :bprev<CR>

" disables automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" vim move modifiers
let g:move_key_modifier = 'C'
let g:move_key_modifier_visualmode = 'C'

" emmet remap
let g:user_emmet_mode='n'
let g:user_emmet_leader_key=','

" prettier auto format
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" nerd tree settings
nnoremap <C-t> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 25
let g:NERDTreeShowHidden = 1

" fix indentation issue
inoremap <expr> <CR> InsertMapForEnter()
function! InsertMapForEnter()
    if pumvisible()
        return "\<C-y>"
    elseif strcharpart(getline('.'),getpos('.')[2]-1,1) == '}'
        return "\<CR>\<Esc>O"
    elseif strcharpart(getline('.'),getpos('.')[2]-1,2) == '</'
        return "\<CR>\<Esc>O"
    else
        return "\<CR>"
    endif
endfunction

" self closing tags setup
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.ts,*.tsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'
let g:closetag_filetypes = 'html,xhtml,phtml,js'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,js'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

" coc setup
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" disable warning
let g:coc_disable_startup_warning = 1


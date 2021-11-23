"
"  __   _(_)_ __ ___  _ __ ___
"  \ \ / / | '_ ` _ \| '__/ __|
"   \ | /| | | | | | | | | (__
"    \_/ |_|_| |_| |_|_|  \___|
"

syntax on
colorscheme delek

" All mappings
" inoremap " ""<left>
" inoremap ' ''<left>
" inoremap ( ()<left>
" inoremap [ []<left>
" inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
" noremap {;<CR> {<CR>};<ESC>O
" noremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
" noremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
" noremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"

" Markdown mappings
autocmd FileType markdown inoremap -> &rarr;

" Java save and execute
autocmd FileType java map <F5> :w<CR>:!java %<CR>
autocmd FileType java imap <F5> <ESC>:w<CR>:!java %<CR>

" LaTeX mappings
let g:tex_flavor = "latex"
autocmd FileType tex inoremap -> $\to$

" LaTeX save, compile
autocmd FileType tex map <F4> :w<CR>:!lualatex %<CR><CR>
autocmd FileType tex imap <F4> <ESC>:w<CR>:!lualatex %<CR><CR>a
autocmd FileType tex map <F5> :w<CR>:!pdflatex %<CR><CR>
autocmd FileType tex imap <F5> <ESC>:w<CR>:!pdflatex %<CR><CR>a

" LaTeX Diplomarbeit textparts compile
" autocmd BufRead,BufNewFile */textparts/* map <F4> :w<CR>:!cd ..<CR>:!pdflatex Diplomarbeit.tex<CR><CR>:!cd ./textparts<CR>

" LaTeX open pdf
autocmd FileType tex map <F6> :execute "!powershell.exe start ".substitute(@%, ".tex", ".pdf", "")<CR><CR>
autocmd FileType tex imap <F6> <ESC>:execute "!powershell.exe start ".substitute(@%, ".tex", ".pdf", "")<CR><CR>a

" Markdown save, compile
autocmd FileType markdown map <F5> :w<CR>:execute "!pandoc --verbose -o ".substitute(@%, ".md", ".pdf", "")." ".@%<CR><CR>
autocmd FileType markdown imap <F5> <ESC>:w<CR>:execute "!pandoc --verbose -o ".substitute(@%, ".md", ".pdf", "")." ".@%<CR><CR>a

" Markdown open pdf
autocmd FileType markdown map <F6> :execute "!powershell.exe start ".substitute(@%, ".md", ".pdf", "")<CR><CR>
autocmd FileType markdown imap <F6> <ESC>:execute "!powershell.exe start ".substitute(@%, ".md", ".pdf", "")<CR><CR>a

" Markdown to HTML save and compile
autocmd FileType markdown map <F7> :w<CR>:execute "!pandoc --verbose -f markdown -t html -o ".substitute(@%, ".md", ".html", "")." ".@%." -c styles.css -s"<CR><CR>

" Spelling
" Keymapping:
"	z= ... korrekte Wörter vorschlagen
"	zw ... Wort immer als falsch kennzeichnen
"	zg ... Wort ist eigentlich richtig -> Ins Dictionary hinzufügen
"
map <F8> :setlocal spell! spelllang=de <return>

" Paste toggle
set pastetoggle=<F2>

" Tab
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent

" Effective tab while editing
set softtabstop=4

" Line numbering
set number relativenumber

" Show command
set showcmd

" Cursor line highlight
" set cursorline

" Filetype indent on
filetype indent on

" Wild menu
set wildmenu

" Highlight matching brackets [{()}]
set showmatch

" Search tweaks
set incsearch
set hlsearch

" Code folding
set foldenable
set foldlevelstart=10
set foldmethod=indent

" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" plugins here
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
" Plugin 'scrooloose/syntastic'
" Plugin 'valloric/youcompleteme'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
" Plugin 'honza/vim-snippets'

Plugin 'raimondi/delimitmate'

" A Vim Plugin for Lively Previewing LaTeX PDF Output
" Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'lervag/vimtex'

" Plugins from 'Top 10 Vim plugins for programming in multiple languages'
Plugin 'frazrepo/vim-rainbow'
" Plugin 'itchyny/lightline.vim'

Plugin 'mboughaba/i3config.vim'

call vundle#end()
filetype plugin indent on

" NerdTree
" autocmd vimenter * NERDTree

" Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_python_checkers = ['pylint']

" vim-rainbow
let g:rainbow_active = 1

" lightline
" set laststatus=2
" set noshowmode
" let g:lightline = {
" 	\ 'colorscheme': 'delek',
" 	\ }

" SnipMate
let g:snipMate = { 'snippet_version': 0 }

" Centering automatically with autocmds
" augroup VCenterCursor
" 	au!
" 	au BufEnter,WinEnter,WinNew,VimResized *,*.*
" 	      \ let &scrolloff=winheight(win_getid())/2
" augroup END
" set scrolloff=999

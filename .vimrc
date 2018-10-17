set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
set nocompatible              " be iMproved, required
filetype off                  " required
set encoding=utf-8       " Set utf8 as standard encoding and en_US as the standard language
"set ffs=unix,dos,mac    " Use Unix as the standard file type
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'godlygeek/tabular'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'matze/vim-tex-fold' "text folding for latex in vim
"Plugin 'reedes/vim-wordy' "Uncover usage problems in your writing ehk mis sõnu liiga palju
Plugin 'christoomey/vim-tmux-navigator' "Seamless navigation between tmux panes and vim splits
Plugin 'junegunn/goyo.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-sensible'
Plugin 'vim-scripts/indentpython.vim'
"Plugin 'nvie/vim-flake8'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'vim-syntastic/syntastic'
"Plugin 'python-mode/python-mode'
Plugin 'morhetz/gruvbox'


" " Snippets are separated from the engine. Add this if you want them:
call vundle#end()            " required
filetype plugin indent on    " required


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable           " enable syntax processing
set background=dark
"colorscheme grb4
colorscheme gruvbox
call togglebg#map("<F5>")
set term=screen-256color



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ttyfast                     " faster redraw
set backspace=indent,eol,start  " Configure backspace so it acts as it should act
set mouse=a                     " Enable the use of the mouse. 
au FocusLost * :wa              "save on losing focus
set clipboard+=unnamedplus      "always clipboard
set cb=unnamed

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spaces & Tabs 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set tabstop=4           " 4 space tab
set expandtab           " use spaces for tabs
set smarttab            " Be smart when using tabs ;)
set softtabstop=4       " 4 space tab
set shiftwidth=4
set modelines=1

filetype indent on      " Enable filetype plugins
filetype plugin on

set autoindent          " Auto indent
set smartindent         " Smart indent
"set wrap                " Wrap lines
"set lbr                 " Linebrake on 500 charactrers
"set tw=80
set history=500         " Sets how many lines of history VIM has to remember
set autoread            " Set to auto read when a file is changed from the outside
set so=7                " Set 7 lines to the cursor - when moving vertically using j/k

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Map leader
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "," 
let g:mapleader = ","
" Fast saving 
nmap <leader>ö :w!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"UI layout
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number              " show line numbers
set relativenumber
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
hi CursorLine ctermbg=236
"set cursorcolumn
set colorcolumn=100      " Colorcolumn at 80 char
set wildmenu            " Turn on the WiLd menu
set ruler               " Always show current position
set cmdheight=2         " Height of the command bar
"set lazyredraw         " Don't redraw while executing macros (good performance
"config)
set showmatch           " higlight matching parenthesis
set mat=2               " How many tenths of a second to blink when matching brackets
set foldcolumn=1        " Add a bit extra margin to the left

"highlight OverLength ctermbg=red ctermfg=white guibg=#592929 " Higlight in red after 80char
"match OverLength /\%81v.\+/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set foldmethod=syntax   " fold based on syntax level
"set foldmethod=indent   " fold based on indent level
"set foldmethod=marker   " fold based on indent level
"set foldmethod=diff   " fold text that is not changed
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
set foldlevelstart=10    " start with fold level of 1
" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Line shortcuts and moving around tabs windows etc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" highlight last inserted text
nnoremap gV `[v`]

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed ehk vajuta leader enter
 map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
 map <C-j> <C-W>j
 map <C-k> <C-W>k
 map <C-h> <C-W>h
 map <C-l> <C-W>l

 " Useful mappings for managing tabs
 map <leader>tn :tabnew<cr>
 map <leader>to :tabonly<cr>
 map <leader>tc :tabclose<cr>
 map <leader>tm :tabmove 
 map <leader>t<leader> :tabnext 
 
 " Normal mode escape if you press jk fast
imap kj <Esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2


" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
    %s/\s\+$//ge
      exe "normal `z"
      endfunc
       autocmd BufWrite *.py :call DeleteTrailingWS()
      autocmd BufWrite *.coffee :call DeleteTrailingWS()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Spell checking
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"setlocal spell spelllang=en_us

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Misc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Make VIM remember position in file after reopen
if has("autocmd")
   au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on 
" "    means that you can undo even when you close a buffer/VIM
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
        set undofile
        catch
        endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plugin confs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Vim-airline
"
"
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif






"Latex-box
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "xelatex"
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='pdf, bib, pdf'
"let g:Tex_ViewRule_pdf='evince'
let g:Tex_ViewRule_pdf='zathura'
"let g:Tex_ViewRule_pdf='epdfview'
"Kompileerib automaatselt
let g:LatexBox_latexmk_preview_continuously=1 

" latex xelatex compile
map <F12> :call CompileLatex()<CR>
func! CompileLatex()
    :w
    :!xelatex "%"
endfunc


" latex pdflatex compile
map <F11> :call CompileLatex()<CR>
func! CompileLatex()
    :w
    :!pdflatex "%"
endfunc

"NerdTree
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>


"vim-tmux-navigator
" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"goyo.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap \f mt:Goyo<CR>'tzz




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Markdown shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd Filetype markdown inoremap ;n ---<Enter><Enter>
autocmd Filetype markdown inoremap ;b ****<Space><++><Esc>F*hi
autocmd Filetype markdown inoremap ;s ~~~~<Space><++><Esc>F~hi
autocmd Filetype markdown inoremap ;e **<Space><++><Esc>F*i
autocmd Filetype markdown inoremap ;h ====<Space><++><Esc>F=hi
autocmd Filetype markdown inoremap ;i ![](<++>)<Space><++><Esc>F[a
autocmd Filetype markdown inoremap ;a [](<++>)<Space><++><Esc>F[a
autocmd Filetype markdown inoremap ;1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ;2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ;3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ;l --------<Enter>
autocmd Filetype markdown nnoremap <C-p> :!pandoc<Space>-t<Space>beamer<Space>-s<Space><C-r>%<space>-o<Space><C-r>%<Backspace><Backspace>pdf<Space>-V<Space>theme:Copenhagen<Space>--latex-engine=xelatex<Enter>


inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
vnoremap <Space><Space> <Esc>/<++><Enter>"_c4l
map <Space><Space> <Esc>/<++><Enter>"_c4l
inoremap ;gui <++>

augroup filter_special_file
    au!
    au BufWinEnter  *.{doc,docx,epub,odp,odt,pdf,rtf}  call s:filter_special_file()
augroup END

fu! s:filter_special_file() abort
    if get(b:, 'did_filter_special_file', 0)
        return
    endif

    let fname = shellescape(expand('%:p'), 1)
    let ext = expand('%:e')
    let ext2cmd = {
    \               'doc' : '%!antiword '.fname,
    \               'docx': '%!pandoc -f docx -t markdown '.fname,
    \               'epub': '%!pandoc -f epub -t markdown '.fname,
    \               'odp' : '%!odt2txt '.fname,
    \               'odt' : '%!odt2txt '.fname,
    \               'pdf' : '%!pdftotext -nopgbrk -layout -q -eol unix '.fname.' -',
    \               'pdf' : '%!pdftotext -nopgbrk -layout -q -eol unix '.fname.' -',
    \               'rtf' : '%!unrtf --text',
    \               'pdf' : '%!pdftotext -nopgbrk -layout -q -eol unix '.fname.' -',
    \               'rtf' : '%!unrtf --text',
    \             }

    if has_key(ext2cmd, ext)
        let filter = matchstr(ext2cmd[ext], '%!\zs\S*')
        if !executable(filter)
            echom 'cannot filter '.expand('%:p').'; please install '.filter
            return
        endif

        setl ma noro
        sil exe ext2cmd[ext]
        let b:did_filter_special_file = 1
        setl noma ro nomod
    endif
endfu

autocmd BufWritePost *.docx :!pandoc -f markdown -t docx % > tmp.docx

""Pythoni identation ja whitespace marking
"au BufNewFile,BufRead *.py
"    \ set tabstop=4
"    \ set softtabstop=4
"    \ set shiftwidth=4
"    \ set textwidth=79
"    \ set expandtab
"    \ set autoindent
"    \ set fileformat=unix
"
"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:pymode_python = 'python3'


let python_highlight_all=1
syntax on

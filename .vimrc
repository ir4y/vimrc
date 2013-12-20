" Initialize settings
set nocompatible
filetype off 
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


" vundle package
Bundle 'gmarik/vundle'


" Syntastic package
Bundle 'Syntastic'


" SyntaxComplete package
Bundle 'vim-scripts/SyntaxComplete'


" nerdtree package
Bundle 'scrooloose/nerdtree'
    map <C-y> :NERDTreeToggle<CR>
    let NERDTreeIgnore = ['\.pyc$']


" nerdcommenter package
Bundle 'scrooloose/nerdcommenter'


" StatusLineHighlight package
Bundle 'vim-scripts/StatusLineHighlight'
    set statusline=%<%f%h%m%r\ %b\ %{&encoding}\ 0x\ \ %l,%c%V\ %P
    set laststatus=2
    set smartindent


" bufexplorer package
Bundle 'corntrace/bufexplorer'


" closetag.vim package
Bundle 'vim-scripts/closetag.vim'
    let g:closetag_html_style=1


" vim-surround package
Bundle 'tpope/vim-surround'


" vim-coffee-script package
Bundle 'kchmck/vim-coffee-script'
    let coffee_compile_vert = 1
    setl scrollbind
    nnoremap <F9> :CoffeeCompile watch vert<CR>
    au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
    let coffee_lint_options = '-f ~/.coffee/lintconfig'

" vim-literate-coffeescript package
Bundle 'mintplant/vim-literate-coffeescript'

" vim-javascript package
Bundle 'pangloss/vim-javascript'
    let g:html_indent_inctags = "html,body,head,tbody"
    let g:html_indent_script1 = "inc"
    let g:html_indent_style1 = "inc"


" javascript-libraries-syntax.vim package
Bundle 'othree/javascript-libraries-syntax.vim'


" html5.vim package
Bundle 'othree/html5.vim'


" vim-html5validator package
Bundle 'hokaccha/vim-html5validator'


" MatchTag package
Bundle 'gregsexton/MatchTag'


" vim-css3-syntax package
Bundle 'hail2u/vim-css3-syntax'


" vim-css-color package
Bundle 'skammer/vim-css-color'


" vim-better-css-indent package
Bundle 'miripiruni/vim-better-css-indent'


" CSScomb-for-Vim package
Bundle 'miripiruni/CSScomb-for-Vim'

" Clojure
Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-fireplace'
Bundle 'kien/rainbow_parentheses.vim'
function! Config_Rainbow()
    RainbowParenthesesLoadRound
    RainbowParenthesesLoadSquare
    RainbowParenthesesLoadBraces
endfunction

function! Load_Rainbow()
    call rainbow_parentheses#activate()
endfunction

augroup TastetheRainbow
    autocmd!
    autocmd VimEnter,BufRead,BufWinEnter,BufNewFile *.clj call Config_Rainbow()
    autocmd VimEnter,BufRead,BufWinEnter,BufNewFile *.cljs call Config_Rainbow()
    autocmd VimEnter,BufRead,BufWinEnter,BufNewFile *.clj call Load_Rainbow()
    autocmd VimEnter,BufRead,BufWinEnter,BufNewFile *.cljs call Load_Rainbow()
augroup END
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0


" jedi-vim package (python highlight)
Bundle 'davidhalter/jedi-vim'


" python-mode package
Bundle 'klen/python-mode'
    let g:pymode_options = 0
    let g:pymode_lint_write = 0 
    let g:pymode_rope_vim_completion = 0 
    let g:pymode_folding = 0
    let  b:pymode_modified = 0


" Conque
Bundle 'basepi/vim-conque'


" Color scheme
Bundle 'cschlueter/vim-mustang'
colorscheme mustang


"VimErlang package
Bundle 'jimenezrick/vimerl'
autocmd Filetype erlang setlocal omnifunc=erlang_complete#Complete


"multiple cursors
Bundle 'terryma/vim-multiple-cursors'
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"Go Lang
Bundle 'Blackrush/vim-gocode'
set runtimepath+=/usr/local/go/misc/vim

" Default settings
    filetype plugin indent on
    syntax on
    set background=dark
    set nu
    set showtabline=1 
    
    set scrolljump=7 
    set scrolloff=7 
    
    set encoding=utf8
    set termencoding=utf-8
    set fileencodings=utf8,cp1251
    set wrap " Включаем перенос строк
    set linebreak " Перенос не разрывая слов
    set autoindent " Копирует отступ от предыдущей строки
    set smartindent " Включаем 'умную' автоматическую расстановку отступов

    " Символ табуляции и конца строки
    if has('multi_byte')
        set listchars=tab:▸\ ,trail:·,extends:→,precedes:←,nbsp:×
    endif

    " Символ, который будет показан перед перенесенной строкой
    if has("linebreak")
        let &sbr = nr2char(8618).' '" Show ↪ at the beginning of wrapped lines
    endif

    set splitbelow  " новый сплит будет ниже текущего :sp
    set splitright  " новый сплит будет правее текущего :vsp

    set expandtab 
    set shiftwidth=4 
    set softtabstop=4 
    set tabstop=4 

    " let mapleader = "," " мапим <Leader> на запятую.     
    " Вставлять код извне без этой строчки проблематично, без нее начитается
    " бешеный реформат кода
    set pastetoggle=<Leader>p
    
    imap >Ins> <Esc>i 
    
    inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
                \ "\<lt>C-n>" :
                \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
                \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
                \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
    imap <C-@> <C-Space>

    " Highlight text after 79 charset
    highlight OverLength ctermbg=red ctermfg=white guibg=#592929
    match OverLength /\%79v.\+/

    " Проверка орфографии
    set spell spelllang= 
    set nospell " По умолчанию проверка орфографии выключена
    menu Spell.off :setlocal spell spelllang= <cr>
    menu Spell.Russian+English :setlocal spell spelllang=ru,en <cr>
    menu Spell.Russian :setlocal spell spelllang=ru <cr>
    menu Spell.English :setlocal spell spelllang=en <cr>
    menu Spell.-SpellControl- :
    menu Spell.Word\ Suggest<Tab>z= z=
    menu Spell.Previous\ Wrong\ Word<Tab>[s [s
    menu Spell.Next\ Wrong\ Word<Tab>]s ]s
    
    " Save on losing focus
    autocmd FocusLost * :wa 
    
    " Indent multiple lines with tab
    vmap <Tab> > gv
    vmap <S-Tab> < gv
    
    "Remove GUI menus
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r 

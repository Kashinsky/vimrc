" more configs in /etc/vimrc and /usr/share/vim/vimfils

set nocompatible
set number
set t_Co=256
set background=dark

" new stuff, aug 21 2014
set ttyfast   " this might improve performance, iono
set showmatch   " matching brackets and stuff
set scrolloff=10 " keep 10 lines of context above and below cursor
set smartcase

" colours after 80 chars
" set colorcolumn=81
" set columns=81
" whatever
" end of new stuff, aug 21 2014

highlight LineNr ctermfg=brown
" set hlsearch
if has("syntax")
    syntax on
    "set textwidth=80
else
    set spell
    "set wrapmargin=14
endif

filetype indent on
set wrap linebreak
"set autoindent
set smartindent

" prevents vim from garbling pasted text with indentation
" also seems to cause freezes though...
" set paste

" this doesn't seem to work...
"map <MiddleMouse> <Nop>

" i think i meant "command Q q" because i wanted to quit with :Q
" it probably had nothing to do with macros
" nnoremap Q q
nnoremap Y y$

command Q q
command W w

" these are all set in /etc/vimrc anyway...
" no they aren't
set expandtab
set tabstop=4
set sw=4

"this stuff is also set in /usr/share/vim/vimfiles/archlinux.vim
"allow backspacing over everything in insert mode
" set backspace=indent,eol,start
" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
" set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.png,.jpg


" set ruler
" set history=20

" by default, vim keeps backup files in the same dir as the working file.
" much better to keep them somewhere else, yes?
set backupdir=~/.vim/backups
set directory=~/.vim/backups

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd            " Show (partial) command in status line.
" set showmatch          " Show matching brackets.
" set ignorecase         " Do case insensitive matching
set smartcase          " Do smart case matching
set incsearch          " Incremental search
" set autowrite          " Automatically save before commands like :next and :make
" set hidden             " Hide buffers when they are abandoned
set mouse=nv            " Enable mouse usage, but not in insert mode

" compile and display a latex file
" noremap <c-b> :! pdflatexandevince % <CR> <CR>

" abbreviations, these are pretty cool
" abbreviate #d #define
" abbreviate #i #include
" abbreviate Wall {-# OPTIONS_GHC -Wall #-}
" abbreviate LANGUAGE {-# LANGUAGE #-}
abbreviate jpln System.out.println();
abbreviate jprf System.out.printf();
abbreviate jmain public static void main(String [] args) {
abbreviate jhead public class {
abbreviate phead #!/usr/bin/perl


" automatically comment out lines 
au FileType haskell,vhdl,ada let b:comment_leader = '-- '
au FileType c,cpp,java,javascript let b:comment_leader = '// '
au FileType bash,sh,python,perl,make,conf let b:comment_leader = '# '
au FileType html let b:comment_leader = '<!--'
au FileType vim let b:comment_leader = '" '
au FileType tex let b:comment_leader = '% '
noremap <silent> g/ :<C-B>sil <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:noh<CR>
noremap <silent> g- :<C-B>sil <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:noh<CR>


"Ну это прям нужные настройки
filetype plugin indent on "Включает определение типа файла, загрузку...
"... соответствующих ему плагинов и файлов отступов
set encoding=utf-8 "Ставит кодировку UTF-8
set nocompatible "Отключает обратную совместимость с Vi
syntax enable "Включает подсветку синтаксиса

set wrap linebreak nolist "Визуальный перенос строк без фактического разделения 
"Курсор
"set cursorline "Подсветка строки с курсором
set ttimeoutlen=10 "Понижаем задержку ввода escape последовательностей
let &t_SI.="\e[5 q" "SI = режим вставки
let &t_SR.="\e[3 q" "SR = режим замены
let &t_EI.="\e[1 q" "EI = нормальный режим
"Где 1 - это мигающий прямоугольник
"2 - обычный прямоугольник
"3 - мигающее подчёркивание
"4 - просто подчёркивание
"5 - мигающая вертикальная черта
"6 - просто вертикальная черта


"Нумерация
"set number 

"Выделение чрезмерно длинных строк
"set colorcolumn=110
"highlight ColorColumn ctermbg=black


"Типа автоустановка vim-plug ХЗ РАБОТАЕТ ЛИ НО ПОКА ПОХЕр 
if empty(glob('~/.vim/autoload/plug.vim')) "Если vim-plug не стоит
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs "Создать директорию
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
  "И скачать его оттуда
  "А после прогнать команду PlugInstall
  autocmd VimEnter * PluginInstall --sync | source $MYVIMRC
endif

"ПЛАГИНЫ ПЛАГИНЫ ПЛАГИНЫЫЫЫ :D
"->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->

call plug#begin('~/.vim/bundle') "Начать искать плагины в этой директории
	"Тут будут описаны наши плагины
	"ЦВЕТОСХЕМЫ
	Plug 'ErichDonGubler/vim-sublime-monokai'
	Plug 'blueshirts/darcula'
	Plug 'altercation/vim-colors-solarized'
	Plug 'relastle/bluewery.vim'
	Plug 'gilgigilgil/anderson.vim'
	"СТРОКА СОСТОЯНИЯ
	Plug 'vim-airline/vim-airline'
	Plug 'ryanoasis/vim-devicons'
	"ПИЗДЁЖ ПОД РУКУ (YCM)
	Plug 'ycm-core/YouCompleteMe'
	Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
	"ДЕРЕВО ПРОЕКТА (NERDTree)
	Plug 'preservim/nerdtree'
	"SQL
	Plug 'vim-scripts/dbext.vim'
	"JS
	Plug '1995eaton/vim-better-javascript-completion'
	"Java
	Plug 'dragfire/Improved-Syntax-Highlighting-Vim'
call plug#end() "Перестать это делать

"Цвета
"colorscheme pablo
colorscheme anderson

"Настройка крутой строки состояния
let g:airline_powerline_fonts = 1 "Включить поддержку Powerline шрифтов
let g:airline#extensions#keymap#enabled = 0 "Не показывать текущий маппинг
let g:airline_section_z = "\ue0a1:%l/%L Col:%c" "Кастомная графа положения курсора
let g:Powerline_symbols='unicode' "Поддержка unicode
let g:airline#extensions#xkblayout#enabled = 0 "Про это позже расскажу
set guifont=Fura\ Code\ Light\ Nerd\ Font\ Complete:h16


set guioptions= "Отключаем панели прокрутки в GUI
set showtabline=0 "Отключаем панель табов (окошки FTW)

"""""""""Для доступа YCM к серверам с библиотеками
let g:ycm_language_server = 
  \ [ 
  \   {
  \     'name': 'fortran',
  \     'filetypes': [ 'fortran' ],
  \     'cmdline': [ 'fortls', '--notify_init', '--hover_signature', '--hover_language', 'fortran', '--use_signature_help' ]
  \   }
  \ ]
"Выключение появления окна при подстановке семантики YCM
let g:ycm_add_preview_to_completeopt = 0
set completeopt-=preview

"Настройка дерева
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | 
			\ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
"Настройка визуализации NERDTree
let g:NERDTreeDirArrowExpandable = '.'
let g:NERDTreeDirArrowCollapsible = '<'
" Close the tab if NERDTree is the only window remaining in it.
"autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let g:NERDTreeShowHidden = 1

"ДЛЯ ДОПОЛНИТЕЛЬНЫХ КОНФИГОВ VIM
"Их надо прямо в папку с кодом вкладывать
set exrc
set secure




"->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->->

"Это чтобы файлы .h определялись как .c без надстроек
"ХЗ ПОНАДОБИТСЯ ЛИ
"augroup project
"    autocmd!
"    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
"augroup END

"Отступы
"для крестов или змеюки
"    set expandtab "Замена отступов на пробелы
"    set smarttab "При на жатии tab создаёт пробелы
"    set tabstop=4 "Количество пробелов в отступе
"    set softtabstop=4 "Количество пробелов в отступе при удалении
"    set shiftwidth=4 "Количество пробелов smarttab
"    set foldcolumn=2 "Количество символов отступа от начала строки

"Для :gf (переходит по ссылкам, если указаны директории)
"let &path.="src/include,/usr/include/AL,"

"YCM C++
"	let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

"в .clang_complete в корне проекта .c .cpp нужно добавить -I и -D флаги для
"библиотек, если я правильно понял, но и без того работает
"комбинация клавиш: "='-I'.substitute(&path, ',', '\n-I', 'g')<CR>p

let g:ycm_confirm_extra_conf = 0
let g:NERDTreeShowHidden = 0
let g:dbext_default_profile_myDB='type=pgsql:host=localhost:user=prikolshik:dsnname=holidays_db:dbname=holidays_db:'
 ""passwd=?
 ""let g:dbext_default_profile='myDB'

"Отступы
"для крестов или змеюки
    set expandtab "Замена отступов на пробелы
    set smarttab "При на жатии tab создаёт пробелы
    set tabstop=4 "Количество пробелов в отступе
    set softtabstop=4 "Количество пробелов в отступе при удалении
    set shiftwidth=4 "Количество пробелов smarttab

"=============НАСТРОЙКИ СВОРАЧИВАНИЯ БЛОКОВ КОДА (фолдинг)=============
    set foldenable " отклключить фолдинг по умолчанию
    set foldmethod=syntax " определять блоки на основе синтаксиса файла
    "set foldmethod=indent " определять блоки на основе отступов
    set foldnestmax=3       "deepest fold is 3 levels
    "set foldcolumn=10 " показать полосу для управления сворачиванием
    set foldlevel=1 " Первый уровень вложенности открыт, остальные закрыты
    "set foldopen=all " автоматическое открытие сверток при заходе в них

"Визуальные настройки
set number


"Ремапы для insert 
"Автоскобки
    inoremap { {<CR>}<Esc>ko
    inoremap ( ()<Esc>ha
    inoremap [ []<Esc>ha
    inoremap " ""<Esc>ha
    inoremap ' ''<Esc>ha
    inoremap ` ``<Esc>ha
"C++
    inoremap <C-s>io #include <iostream><CR>
    imap <C-s>main int main(int argc, char *argv[<Right><Right>{

"Java
    imap <C-j>mainc public class Main{<CR><C-j>main
    imap <C-j>main public static void main(String[<Right> args<Right>{
    imap <C-j>class class<CR>{<Up><Up><Right> 


"NERDTree
    nnoremap <C-n> :NERDTreeToggle<CR>
    cnoremap qq<CR> q<CR>:q<CR>

"Редактирование .vimrc
    nnoremap <F2> :!vim .vimrc; :restart<cr>

"Редактирование правил Make
    nnoremap <F3> :!vim ../Makefile<cr>

"Сборка
    set makeprg=cd\ ..;\ make 
    nnoremap <F4> :make!<cr>

"Запуск
    nnoremap <F5> :!cd ..; ./Execute<cr>

"Отладка
    let debugFiles='code/ManaPool.f95 code/TypeMod.f95 code/MethodMod.f95 code/Main.f95' 
    nnoremap <F6> :execute '!cd ..; gfortran -g -ffpe-trap=zero,invalid,overflow,underflow ' . debugFiles . ';gdb a.out -q' . '; rm a.out'<cr>



"Plugin config
"JS
let g:vimjs#casesensistive = 1
" Enabled by default. flip the value to make completion matches case insensitive

let g:vimjs#smartcomplete = 1
" Disabled by default. Enabling this will let vim complete matches at any location
" e.g. typing 'ocument' will suggest 'document' if enabled.

let g:vimjs#chromeapis = 0
" Disabled by default. Toggling this will enable completion for a number of Chrome's JavaScript extension APIs

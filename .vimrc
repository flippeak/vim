"*************************Vimrc files for Gvim*********************
"* CreateDate : 2012-4-7
"* Author : xiyang
"******************************************************************
"""""""""""""""""""""""""""""'"""""""""""""""""""""""""""""""""""""""""
" vbundle 相关
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible               " be iMproved
filetype off                   " required!
 
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
 
" let Vundle manage Vundle
" required! <br>
Bundle 'gmarik/vundle'
 
" original repos on github<br>
Bundle 'mattn/zencoding-vim'
Bundle 'drmingdrmer/xptemplate'
 
" vim-scripts repos
Bundle 'L9'
Bundle 'bufexplorer.zip'
Bundle 'winmanager'
Bundle 'taglist.vim'
Bundle 'Mark'
Bundle 'The-NERD-tree'
Bundle 'closetag.vim'
Bundle 'The-NERD-Commenter'
Bundle 'matchit.zip'
Bundle 'AutoComplPop'
Bundle 'jsbeautify'
Bundle 'YankRing.vim'
 
filetype plugin indent on     " required! 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示相关  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set go=             " 不要图形按钮  

set guifont=Courier_New:h10:cANSI   " 设置字体  

syntax enable
syntax on           " 语法高亮  

colorscheme desert  "配色方案


set ruler           " 显示标尺  
set showcmd         " 输入的命令显示出来，看的清楚些  
set acd  " automatically change directory.

set novisualbell    " 不要闪烁(不明白)  

set cmdheight=2 " 命令行（在状态行下）的高度，默认为1，这里是2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容  
set laststatus=2   " 启动显示状态行(1),总是显示状态行(2)  
"set foldenable      " 允许折叠  
set foldmethod=indent   " 手动折叠  

set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限  

" 设置当文件被改动时自动载入
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

"自动补全  
filetype plugin on

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"共享剪贴板  
set clipboard+=unnamed 
"从不备份  
set nobackup
"自动保存
set autowrite
" 去掉输入错误的提示声音
set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 自动缩进
set autoindent
set cindent
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 历史记录数
set history=1000
set noswapfile
"搜索忽略大小写
set ignorecase
"搜索逐字符高亮
set hlsearch
set incsearch
"行内替换
set gdefault

" 为特定文件类型载入相关缩进文件
filetype indent on
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 字符间插入的像素行数目
set linespace=0
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"键盘命令
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>

" 映射全选+复制 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <C-Z> u
" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y

" Use CTRL-S for saving, also in Insert mode
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

"按F5编译运行
map <F5> <ESC>:call CompileRunProg()<CR>
imap <F5> <ESC>:call CompileRunProg()<CR>
func! CompileRunProg()
	exec "w"
	if &filetype == 'java' 
		exec "!javac %" 
		exec "!java %<"
	elseif &filetype == 'python' 
		exec "!python %" 
	elseif &filetype == 'sh'
		:!./%
	endif
endfunc

" 使更新 _vimrc 更容易
:nmap ,s :source $VIM/_vimrc
:nmap ,e :e $VIM/_vimrc
" 译释：在normal模式下，先后按下 ,s 两个键执行_vimrc，而 ,v 则是编辑_vimrc

"==============================================================================
" 切换窗口，按TAB键
"=============================================================================
" 换标签页
" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>tl :tabnex<CR>
map <leader>th :tabprev<CR>
nmap <C-T>  :tabnew<CR>


nmap <silent><TAB>  <c-w>w:set cursorline<CR>:100sl m<CR>:set nocursorline<CR>
nmap <silent><S-TAB> <c-w>p:set cursorline<CR>:100sl m<CR>:set nocursorline<CR>

" 在分割窗口中快速切换
" 这是一个键盘绑定，把Ctrl-J定义成切换到下一个窗口并最大化
":map <C-K> <C-W>k<C-W>_
" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
map <c-m> <c-w>_
"快速关闭窗口
nmap <c-q> :q<ENTER>
"映射<C-d>为删除当前行，和eclipse一致
nmap <c-d> dd
imap <c-d> dd


" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

"""""""""""""""""""""""""""""""""""""""""""""""""""
"解决中文问题
"set encoding=utf-8
"set fileencodings=ucs-bom,utf-8,chinese,cp936
"set termencoding=chinese
"if has("win32")
"set fileencoding=chinese
"else
"set fileencoding=utf-8
"endif
"解决菜单乱码
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim
"解决consle输出乱码
"language messages zh_CN.utf-8

set encoding=chinese
set termencoding=chinese
set fileencoding=cp936 " 默认存成cp936(ANSI)以避免Perl解析中文出错 [10/05/06 thinkhy]
set fileencodings=ucs-bom,utf-16,utf-8,cp936,gb18030,big5,euc-jp,sjis,euc-kr,ucs-2le,latin1

" 映射grep "
nnoremap <silent> <F3> :Grep<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java,*.py,*.pl文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.py,*.pl exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
	"如果文件类型为.py文件 
	if &filetype == 'python' 
		call setline(1,"#########################################################################") 
		call append(line("."), "# File Name: ".expand("%")) 
		call append(line(".")+1, "# Author: xiyang") 
		call append(line(".")+2, "# mail: sdlgxxy@gmail.com") 
		call append(line(".")+3, "# Created Time: ".strftime("%c")) 
		call append(line(".")+4, "########################################################################") 
		call append(line(".")+5,"#!/usr/bin/env python")
		call append(line(".")+5,"# -*- coding: UTF-8 -*-")
	else 
		call setline(1, "/*************************************************************************") 
		call append(line("."), "    > File Name: ".expand("%")) 
		call append(line(".")+1, "    > Author: xiyang") 
		call append(line(".")+2, "    > Mail: sdlgxxy@gmail.com") 
		call append(line(".")+3, "    > Created Time: ".strftime("%c")) 
		call append(line(".")+4, " **********************************************************************/") 
		call append(line(".")+5, "")
	endif
	"新建文件后，自动定位到文件末尾
	autocmd BufNewFile * normal G
endfunc 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTags的设定  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Sort_Type = "name"    " 按照名称排序  
let Tlist_Use_Right_Window = 1  " 在右侧显示窗口  
let Tlist_Compart_Format = 1    " 压缩方式  
let Tlist_Exist_OnlyWindow = 1  " 如果只有一个buffer，kill窗口也kill掉buffer  
let Tlist_File_Fold_Auto_Close = 0  " 设置是否默认折叠代码
let Tlist_Enable_Fold_Column = 0    " 不要显示折叠树  
autocmd FileType python set tags+=D:\Python25\workspace
"autocmd FileType java set tags+=D:\tools\java\tags  
"autocmd FileType h,cpp,cc,c set tags+=D:\tools\cpp\tags  
"let Tlist_Show_One_File=1            "不同时显示多个文件的tag，只显示当前文件的
"设置tags  
"set tags = tags; 
"set autochdir 
autocmd BufNewFile,BufRead D:/Python25/workspae/* set tags+=D:/Python25/workspae/tags
"默认打开Taglist 
let Tlist_Auto_Open=0
let Tlist_Ctags_Cmd = 'ctags' 
let Tlist_Show_One_File = 1 "不同时显示多个文件的tag，只显示当前文件的
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 其它插件
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""
" minibufexpl插件的一般设置 
"""""""""""""""""""""""""""""""
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1

let g:miniBufExplModSelTarget = 1   
"==========================================
" lookupfile  
"==========================================
let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
let g:LookupFile_SortMethod = ""                "关闭对搜索结果的字母排序
"设置tag文件的名字
autocmd BufNewFile,BufRead  D:/Python25/workspae/* let g:LookupFile_TagExpr ='"D:/Python25/workspae/filenametags"'

let g:LookupFile_TagExpr='"filenametags"'

"映射LookupFile为,lk
nmap <silent> <leader>lk :LUTags<cr>
"映射LUBufs为,ll
nmap <silent> <leader>ll :LUBufs<cr>
"映射LUWalk为,lw
nmap <silent> <leader>lw :LUWalk<cr>
"==========================================
" winManager
"==========================================
let g:winManagerWindowLayout='FileExplorer'
"let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>
"在进入vim时自动打开winmanager

let g:AutoOpenWinManager = 0


"""""""""""""""""""""""""""""""""""
" NerdTree plugin  10/04/11
"""""""""""""""""""""""""""""""""""
let NERDTreeWinPos = "left" "where NERD tree window is placed on the screen

"let NERDTreeWinSize = 31 "size of the NERD tree
nmap <F7> <ESC>:NERDTreeToggle<RETURN>" Open and close the NERD_tree.vim separately


"=======================================================
" python 相关                                           "
"======================================================="



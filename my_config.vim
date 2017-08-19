" for custom

" 选择文本按下Ctrl-r会替换选择的文本，使用该命令会占用寄存器
" 脚本说明：选择文本后，"hy表示复制到寄存器h，:%s/<C-r>h表示
" 查找寄存器h中的文本，／/gc<left><left><left>表示全局替换，
" 光标左移到输入替换文本的地方，c字母使用vim的确认替换功能
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

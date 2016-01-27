# dotvim

我的vim配置包,使用Vundle进行插件管理

# 插件介绍

## Tabular 文本对齐

快速对齐文本,有如下文本:
>
    Some short phrase,some other phrase
    A much longer phrase here,and another long phrase
<
将光标定位某行输入`:Tabularize /,`,文本自动变为

>
    Some short phrase         , some other phrase
    A much longer phrase here , and another long phrase
<
可以输入部分参数调整每个分割字段的对齐方式以及在尾部插入的空格数,比如
有下面的文本:
>
    abc,def,ghi
    a,b
    a,b,c
<
输入命令':Tabularize /,/r1c1l0'将会格式化为:
>
    abc , def, ghi
      a , b
      a , b  ,  c
<
命令的意思为根据`,`分割字段,接下来的参数意思为
- `r1`: 'adc'列右对齐其后加一个空格
- `c1` 第一个','列居中对齐其中加一个空格
- `l0` `def`列左对齐其后无空格,可以看到`def`后面没有空格
- 参数不足,余下分割字段都是用第一个参数`r1`

# VOom 大纲与目录

在代码中添加如下文本,可以对文件进行大纲浏览:

>
// 标题1 声明{{{1

// }}}

// 标题1 实现{{{1
// 标题2-功能1 {{{2


// }}}

// 标题2-功能2 {{{2


// }}}

// }}}

<
输入命令`:VOomToggle`可以看到大纲如下:
>
 README.md [C:\Users\liangsijian\.vim], b6
  |// 标题1 声明
  |// 标题1 实现
  . |// 标题2-功能1
= . |// 标题2-功能2
<
将光标定位到某个标题可以跳转到对应的地方

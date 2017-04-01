# DealOperator
用 Vimscript 写的一个函数，自动对二元运算符(+-*/%...）前后添加空格，并对齐等号。

![Demo](https://raw.githubusercontent.com/cshuaimin/DealOperator/master/DealOperator.gif)

在你的 .vimrc 里面添加
    source DealOperator.vim
就可以使用了 :)

特性：
1. 在输入过程中自动处理，无需按额外快捷键；
2. 只对齐同一块代码中的等号（通过缩进来判断）。

BUGS:
目前还不能区分代码与字符串。


# Backgrounds

These are reference when I try to figure out how vim plugin works.
[Vim history](https://twobithistory.org/2018/08/05/where-vim-came-from.html)
[王垠: 编辑器与IDE](http://www.yinwang.org/blog-cn/2013/04/20/editor-ide)

## Standar direcotries structure of vim
cd /usr/local/share/vim/vim74
https://gist.github.com/nelstrom/1056049/784e252c3de653e204e9e128653010e19fbd493f
http://www.panozzaj.com/blog/2011/09/09/vim-directory-structure/

### plugin directories structure managed by Pathogen/Vundle/vim-plug
https://gist.github.com/romainl/9970697

## Key mapping
https://howchoo.com/g/nzc1ztu4ztd/custom-key-mappings-vim

## Principle behind the Vundle
https://howchoo.com/g/ztmyntqzntm/how-to-install-vim-plugins-without-a-plugin-manager

## Plugin Types
http://jackon.me/posts/principle-of-vim-plugin/

## Conventions
https://www.kancloud.cn/kancloud/learn-vimscript-the-hard-way/49312

## Some usefull help
:help runtimepath
:help autoload


## vim-plug vs. Vundle
https://jordaneldredge.com/blog/why-i-switched-from-vundle-to-plug/

## Construct an IDE with Vim
https://juejin.im/post/5a38c37f6fb9a0450909a151

## llvm+clang vs. GCC
[C/C++: clang 代替 gcc](https://fzheng.me/2016/03/15/clang-gcc/)


## Basic plugin a Vimer should use
https://dougblack.io/words/a-good-vimrc.html

## Vim8 comes with native package manage
https://shapeshed.com/vim-packages/


##YouCompleteMe
### how to generate 'compilation database' with clang
https://clang.llvm.org/docs/JSONCompilationDatabase.html
https://stackoverflow.com/questions/7031126/switching-between-gcc-and-clang-llvm-using-cmake
https://stackoverflow.com/questions/20059670/how-to-use-cmake-export-compile-commands/45781334
https://gitlab.kitware.com/cmake/cmake/issues/16588

### what is Clang
http://clang.llvm.org/docs/Toolchain.html

### how to install Clang
https://blog.kowalczyk.info/article/k/how-to-install-latest-clang-6.0-on-ubuntu-16.04-xenial-wsl.html

### make C-family Semantic Completion works
https://jonasdevlieghere.com/a-better-youcompleteme-config/
https://github.com/Valloric/YouCompleteMe#option-1-use-a-compilation-database
https://github.com/rdnetto/YCM-Generator
https://github.com/Valloric/YouCompleteMe/issues/174

### Known Issues
[Only ID completion available](https://github.com/Valloric/YouCompleteMe/issues/560)
[Only Clang Support?](https://github.com/Valloric/YouCompleteMe/issues/3043)
[Argument Completion](https://github.com/Valloric/YouCompleteMe/pull/1300)


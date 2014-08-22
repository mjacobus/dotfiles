# My .dotfiles

And in your ~/.bash_profile:

Instalation
-------------

```bash
git clone https://github.com/mjacobus/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

Vim - Resources
-----------------
- [Vim Tutor](http://www.openvim.com/tutorial.html)
- [Vim Adventures](http://vim-adventures.com/)
- [Graphical cheat sheet tutorial](http://www.viemu.com/a_vi_vim_graphical_cheat_sheet_tutorial.html)
- [Vim tutorial Videos](http://www.derekwyatt.org/vim/vim-tutorial-videos)
- [Vim Classes](https://github.com/shawncplus/vim-classes)
- [8 essential vim editor navigation fundamentals](http://www.thegeekstuff.com/2009/03/8-essential-vim-editor-navigation-fundamentals/)
- [How I boosted my vim](http://nvie.com/posts/how-i-boosted-my-vim/)
- [Getting started](http://www.sitepoint.com/getting-started-vim/)
- [Effective rails development](http://www.sitepoint.com/effective-rails-development-vim/)
- [vim for php programmers](http://www.slideshare.net/ZendCon/vim-for-php-programmers-presentation)
- [Vim for a php developer](http://blog.lenss.nl/2011/04/vim-for-a-php-developer/)
- [Vim for php programmers](http://www.slideshare.net/andreizm/vim-for-php-programmers-pdf)

To memorize
--------------


#### Normal Mode

- ```gi``` - go to the last edit in insert mode
- ```-``` - goes previous line first char
- ```q:``` - history, for editing (enter executes ```Ctrl-F``` puts in the command bar)
- ```zR``` - opens all folded code
- ```zW``` - closes all folded code
- ```is``` - _inside_ sentence
- ```gT``` - last tab
- ```Ctrl-R w``` - inserts the w register

#### Visual Mode

- ```o``` - switches cursor position between beggining and end of selection


#### Saving session
- ```:mksession filename``` - saves session
- ```:source filename``` - restores session
- ```vim -S filename``` - restores session

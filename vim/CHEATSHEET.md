### Rails.vim
* Rfind <word> <tab>: opens model, controller and others
* gf, when in a word, like path, partial, model name: opens the file
* Runittest opens unit test related to the current file
* Rcontroller  opens controller related to current file
* RSunittest opens related unit test file in a horizontal split
* RVunittest opens related unit test file in a vertical split
* RTunittest opens related unit test file in new tab
* Rake runs test file

### Snip mate


### CTags

CTags helps you jump the file where a method is defined.

First we need to install ctags and run in the project root folder.

```
sudo apt-get install ctags
cd /project
ctags -R --exclude=.git --exclude=log *
```

This will generate a ctag file, that must be ignorede in .gitignore

#### Usage:

When cursor is arround a method

```
Ctrl+]
```

```
:tag <method_name>
:tag /validates_presence_of_.* # accepts a regualar expression
```

### ack

Grep replacement target on programmers.

#### Usage:

ack --ruby expression_that_you_want_to_match

It accepts ~/.ackrc
:set grepprg=ack will change grep functionality to ack

Inside ruby:

:ack --ruby controller
:cn jumps to next match
:cn jumps to previous match

Its good to map to Ctrl+P and Ctrl+n

### Changing content of surrounded by quotes, for exemple.

```bash
# leader keys
ct" (Change T double quote)
ci" (Change Inside double quote)
da" (Delete Arround double quotes)
daw (Delete Arround Word)
```


### Align

Select the text and:

Align by a sigle char
```Align =```

Align by multiple chars
```Align = ,```

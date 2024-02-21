# Chelp 

This plugin provides easy man page lookup in vim split screen and auto C-headers insertion.

# Usage

The plugin has two main functionalities:

`:ChelpShow` allows the user to load the man page of a specified word
in a split screen using vim, and not a man pager. This allows moving using
custom mappings, copying text with `yy`, typing in the buffer and much more.

The word can be specified as parameter to the function or the keyword under the cursor will be used if no parameter is given:
```vim
:ChelpShow wait 
```

The man section can be specified as follows: 
```vim
:2ChelpShow open 
:ChelpShow 2 open 
```

`:ChelpAddHidden` allows the user to insert all the headers
given in the man page of a specified word (function). All headers that are
already added will be ignored. Headers outside of the SYNOPSIS menu in the man
page will also be added. 

Again the word can be specified or expanded from under the cursor:
```vim
:ChelpAddHidden wait
```

Sections can also be included:
```vim
:2ChelpAddHidden open 
:ChelpAddHidden 2 open 
```

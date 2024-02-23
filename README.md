# Chelp Vim Plugin

This plugin provides easy *man page* lookup in *Vim split screen* and automatic *C-headers* insertion.

The plugin was developed to streamline the process of accessing *man pages* for the *Operating Systems course* at *FMI*, making it more efficient and convenient.

## Usage

[demo_keys.webm](https://github.com/TeogopK/chelp.vim/assets/94198193/2a0822c1-24a7-42bb-9014-845cb55d3943)

The plugin has two main functionalities:

### ChelpShow

Allows the user to load the *man page* of a specified word in a *split screen* using Vim, and not a *man pager*. This allows moving using custom mappings, copying text with `yy`, typing in the buffer and much more.

The word can be specified as parameter to the function or the keyword under the cursor will be used if no parameter is given:

```vim
:ChelpShow wait 
```

The *man page [section](https://man7.org/linux/man-pages/man7/man-pages.7.html)* can be specified as follows: 

```vim
:2ChelpShow open 
:ChelpShow 2 open 
```

To speed things up the functions can be associated with key mappings - see [Mappings](#mappings).

### ChelpAddHidden

Allows the user to insert all the headers given in the *man page* of a specified word (function). All headers that have already been added will be ignored.

Again the word can be specified or expanded from under the cursor:

```vim
:ChelpAddHidden wait
```

Sections can also be included:

```vim
:2ChelpAddHidden open 
:ChelpAddHidden 2 open 
```

Note: The function adds all headers listed in a given *man page* even those outside of the minimum required ones, listed in the *SYNOPSIS section*. However, the plugin provides an option to include only the first header found in the *man page* - check [Settings](#settings).

## Installation

You can install the plugin yourself using Vim's packages functionality by cloning the project under `~/.vim/pack/<any-name>/start/`.

For example:

```bash
mkdir -p ~/.vim/pack/_/start
cd ~/.vim/pack/_/start
git clone https://github.com/TeogopK/chelp.vim.git

# To generate documentation tags:
vim -u NONE -c "helptags chelp.vim/doc" -c q
```

This should automatically load the plugin for you when Vim starts.

If you would rather not use *git*, you can download the files as *zip* and unzip them in the relevant directory.

Another way to install the plugin is with a plugin manager:

- [vim-plug](https://github.com/junegunn/vim-plug)
- [Vundle](https://github.com/VundleVim/Vundle.vim)

If you use one, just follow the instructions in its documentation.


## Mappings

Use the following mappings in your `.vimrc` file to avoid typing the function every time you want to use it:

```vim
nmap <some_keys> <Plug>(ChelpShow)
nmap <some_keys> <Plug>(ChelpAddHidden)
```

Recommended mappings are:
```vim
nmap zh <Plug>(ChelpShow) 
nmap zp <Plug>(ChelpAddHidden) 
```

To specify the section of the *man page* when using mappings, position the cursor anywhere on the wanted word (function) and press `<number_of_section><some_keys>`.

With the recommended mappings this is as easy as pressing `2zh`.

### Vimrc tutorial

If you do not already have a `.vimrc` you can create one in your home directory using the following command in your terminal:

```bash
vim ~/.vimrc
```

A crucial addition in the beginning of every `.vimrc` file is the following line. It keeps some essential default settings in Vim that will be otherwise reverted when a custom `.virmc` file is created:

```vim
source $VIMRUNTIME/defaults.vim
```

The `.vimrc` is an extremely powerful tool to customize and configure multiple aspects of your Vim. For example, to enable copying and pasting text in and out of Vim add the following line in your `.vimrc`.

```vim
set clipboard=unnamed,unnamedplus
```

To sum up, an example `.vimrc` file with specified ***Chelp plugin*** mappings and some other Vim features looks like this:

```vim
source $VIMRUNTIME/defaults.vim

nmap zh <Plug>(ChelpShow)
nmap zp <Plug>(ChelpAddHidden)

set clipboard=unnamed,unnamedplus

set number

set splitbelow
set splitright
```

Note: Close and open Vim if the changes have not applied yet or use `:source %` while in the `.vimrc` file.

## Settings

The plugin provides the following user configurable options:

- `g:chelp_first_header_only` 

    Allows the user to paste only the first
    header in the *man page*. Default value is 0, meaning that all headers
    will be pasted. Setting can be changed with:

    ```vim
    :let g:chelp_first_header_only=1
    ```

- `g:chelp_save_cursor`

    Allows the user to save his cursor position
    and return to it after the paste as if nothing has happened, only the needed headers have been included. Default value is 1, meaning that the cursor position will be saved. If set to 0, the cursor position will be in the beginning of the file, after the last inserted header:

    ```vim
    :let g:chelp_save_cursor=0
    ```

The options can be set in the `.vimrc` file with the desired value of 0 or 1, so their effect is not lost when closing and opening Vim again:

```vim
let g:chelp_first_header_only=1
let g:chelp_save_cursor=0
```

## Footnotes

- Go download another useful plugin [The NERD Tree](https://github.com/preservim/nerdtree).

- Check out [***the Vim FMI course***](https://vim-fmi.bg/lectures).

Happy coding! :)

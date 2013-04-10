# vim-pressgang

## Description

The **vim-pressgang** plug-in adds support for [PressGang CCMS](https://github.com/pressgang-ccms), an open source component content management system, to Vim, and provides syntax highlighting for the Content Spec files.

## Installation

### Installing the Plug-in Using Vundle

To install the plug-in by using the [Vundle](https://github.com/gmarik/vundle) plug-in manager, add the following to your **~/.vimrc** file:

    Bundle 'jhradilek/vim-pressgang'

Then run the following command in Vim:

    :BundleInstall

### Installing the Plug-in Using Pathogen

[Pathogen](https://github.com/tpope/vim-pathogen) looks for Vim files in the **~/.vim/bundle/** directory. To make sure that this directory exists, type the following at a shell prompt:

    install -d ~/.vim/bundle/

To install this plug-in, change to the **~/.vim/bundle/** directory and clone this repository in it.

### Installing the Plug-in Manually

Vim looks for its configuration files in the **~/.vim/** directory. To make sure that this directory exists, type the following at a shall prompt:

    mkdir ~/.vim/

To install this plug-in, change to the directory with your local copy of this repository and run the following command:

    cp -R * ~/.vim/

This copies all files and directories to the **~/.vim/** directory.

## Configuration

### Enabling Syntax Highlighting

To enable syntax highlighting in the current session, run the following Vim command:

    :syntax on

To enable syntax highlighting permanently, add the following line to your **~/.vimrc** file:

    syntax on

You can also explicitly enable file type detection by adding the following line to this file:

    filetype on

For more information on how to enable and configure syntax highlighting in Vim, refer to the [Vim Documentation](http://vimdoc.sourceforge.net/htmldoc/syntax.html).

### Configuring File Type Detection

To change the type of the file you are editing in the current buffer to the Content Spec, at any time, run the following Vim command:

    :set filetype=contentspec

To configure Vim to automatically treat files with the **.contentspec** file extension as Content Spec files, add the following line to your **~/.vimrc** file:

    au BufNewFile,BufRead *.contentspec set ft=contentspec

For more information on how to configure file type detection in Vim, refer to the [Vim Documentation](http://vimdoc.sourceforge.net/htmldoc/filetype.html).

## Copyright

Copyright © 2013 Jaromir Hradilek

This program is free software; see the source for copying conditions. It is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

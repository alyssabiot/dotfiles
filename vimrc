"General 
syntax on 			"color syntax
colorscheme pablo
set noerrorbells		"no sound effect 
filetype plugin indent on 	"automatically detect file types
set number 			"display line numbers
set incsearch			"highlight search as typed
set nocompatible 		"disable vi compatibility 
set noswapfile			"disable swapfiles

"Use Vundle to manage plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-markdown'	"highlight markdown syntax
Plugin 'junegunn/fzf'		"fuzzy finder
Plugin 'mileszs/ack.vim'	"enable ack search

"End of plugins list
call vundle#end()      

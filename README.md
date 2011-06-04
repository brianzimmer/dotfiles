
Installation
------------

Clone the repo:

	$ git clone git@github.com:brianzimmer/dotfiles

Make symlinks to actually install

	$ ln -s dotfiles/.vim .vim
	$ ln -s dotfiles/.bashrc .bashrc
	$ ln -s dotfiles/.bash_profile .bash_profile
	$ ln -s dotfiles/.vimrc .vimrc

Vim
---------

* Plugin: SnipMate
	* Edit .vim/snippets/filetype.snippet
	* Then inside vim, enter keyword then tab
	* To do normal auto completion, do ctrl-n

* Plugin: YankRing
	* After a paste, press ctrl-p to cycle through last paste entries
	* Also allows pasting between windows

* Plugin: MRU
	* `,f` shows MRU

* Plugin: Fugitive
	* `,gs` stages
		* Then use "-" to stage it
	* `,gc` commits
	* `,ga` writes
	* `,gl` logs
	* `,gd` diffs

* Plugin: NerdCommenter
	* `,c<space>` toggles
	* `,cs` better comment
	* `,cc` comments selected
	* `,cu` uncomments selected

* Plugin: Scratch
	* `,<tab>` will open a scratch window

* Plugin: Command-t
	* `,t` starts command t

* Plugin: Slime
	* `screen -S sessionname` in another window
	* `Ctrl-c-c` to send to this (need to enter sessionname)
	* By default sends the current paragraph, can use visual mode
	* to send something else
	* `Ctrl-c v` reprompts to reattach to a new session

* Plugin: LargeFile

* Plugin: ACK
	* Need to install ack
	* `,a` to do an ack search
		* t opens in a new tab
		* T opens in a background tab
		* o opoens
		* q closes
		* go previews
	* To learn more
	* :h Ack
	* Be careful if not in the right directory
		* If not, use `,cd` to change
	* Use Ctrl-P to paste path of current directory

* Plugin: Nerdtree
	* ,t opens nerdtree
		* t opens in a new tab
		* o opens file
		* s opens in new vertical
		* p to go to parent
		* r to refresh


* Leader shortcuts

	* `ctrl-n` does autocompletion

	* `,ev` to edit .vimrc

	* `,v `to create a new vertical split

	* `,h` to create a new horizontal split

	* `,,` moves between buffers

	* `Shift-j` to move a page down
	* `Shift-k` to move a page up


	* `,yf` to copy filename to gnome clipboard

	* `,yp` to copy filename+path to gnome clipboard

	* `,1` creates an underline for a comment

	* `,e` opens an edit command with the path of the currently edited file filled in

	* `,t` opens a tab edit command with the path of the currently edited file filled in

	* `ctrl-p` inserts the path of the currently edited file into a command

	* Use tab to look between bracket pairs


	* `,tn` makes a new tab
	* `,te` edits a file in a new tab

	* 0 moves to beginning of line after tabs, not absolute beginning

	* just type xdate to enter the date

	* `]p` will paste with the same level of indent as the line above

	* m <letter> will mark a section
	* \` <letter> (backtick will return)
	* \`. goes to last edited line

	* `,,` changes from insert to command mode (esc)

	* `,/` to clear highlights

	* `ctrl-h` to move to the left tab
	* `ctrl-l` to move to the right tab

	* `,w` writes
	* `,q` quits
	* `,x` writes and quits

	* `,p` toggles paste mode to turn off weird wrapping/commenting

	* `,W` clears whitespacewn

	* In command mode, enter inserts a newline,
	* Shift-enter inserts above

	* `,v` reselects just pasted text

	" `,m` Remove the Windows ^M - when the encodings gets messed up

Optional
--------

To enable git completion, need to install bash with bash-completion enabled.
Then, download http://kernel.org/pub/software/scm/git/git-1.5.4.3.tar.bz2 and move git-1.5.4.3/contrib/completion/git-completion.bash to /opt/local/etc/bash_completion.d/git-completion
Also, need to link to bash-completion inside .bash_profile (change path from what is already there)

Example: 
	$ git<space><tab><tab>

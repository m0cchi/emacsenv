# Emacs Environment

# Installation
```bash
$ ./install.sh
#=> $HOME/.emacsenv
$ echo 'export PATH='$HOME/.emacsenv/bin:$PATH >> .bashrc
```

# Initial Emacs
```bash
$ emacsenv install emacs-25.1
# set build option
# CONFIGURE_OPT='--without-x --without-ns --with-modules' VERSION_NAME='emacs-25.1-with-modules' emacsenv install emacs-25.1
$ emacs global emacs-25.1
$ emacs
#=> running webapp(localhost:5678).
```

## emacsclient
```bash
$ emacsclient /path/to/file
# startup emacs-daemon
$ emacsclient -e '(kill-emacs)'
```

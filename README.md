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
$ emacsenv global emacs-25.1-with-modules
$ emacs -Q .emacsenv/versions/emacs-25.1-with-modules/profiles/.emacs
#=> edit .emacs
```

# Edit Profiles
```bash
$ eval $(emacsenv env 'export ')
$ emacs -Q $EMACS_HOME/profiles/.emacs
```
# Run
## emacsclient
```bash
$ emacsclient /path/to/file
# startup emacs-daemon
$ emacsclient -e '(kill-emacs)'
```

# Shebang
`elexec` is the same as `emacs env exec emacs --script`
```elisp
#!/usr/bin/env elexec
(princ emacs-version)
```

# plugins
* [emacsenv-sudo](https://github.com/m0cchi/emacsenv-sudo)

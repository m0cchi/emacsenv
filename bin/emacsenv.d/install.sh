function finalize() {
    STATUS=$?
    if [ ! "$LOCAL_REPOSITORY" = "" ]; then
        cd $LOCAL_REPOSITORY
        rm -rf ./[a-zA-Z]*
        git reset --hard
        git checkout master
    fi
    exit $STATUS
}

if [ ! -e "$LOCAL_REPOSITORY/.git" ]; then
    echo "install"
    exit
fi

version=$1
shift 1

DEFAULT_CONFIGURE_OPT="--without-x --without-ns"
INSTALL_DIR=$LOCAL_VERSIONS_DIR/$version
EMACS_HOME=$INSTALL_DIR/profiles
CONFIGURE_OPT="--prefix=$INSTALL_DIR "$(or "$CONFIGURE_OPT" "$DEFAULT_CONFIGURE_OPT")
DEFAULT_MAKE_OPT="-j4"
MAKE_OPT=$(or "$MAKE_OPT" "$DEFAULT_MAKE_OPT")

if [ -z "$version" ]; then
    echo "specify"
    exit
fi

cd $LOCAL_REPOSITORY

# checkout version
action "git checkout refs/tags/$version"
check_error

# gen configure
action 'sh autogen.sh'
check_error

action "./configure $CONFIGURE_OPT"
check_error

action "make $MAKE_OPT bootstrap"
check_error

action "make $MAKE_OPT install"
check_error

# set profiles
mkdir $EMACS_HOME
cp $SAMPLE_CODE_DIR/* $EMACS_HOME/

finalize

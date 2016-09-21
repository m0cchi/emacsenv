if [ -e $LOCAL_REPOSITORY/.git ]; then
    cd $LOCAL_REPOSITORY
    git pull origin master
else
    mkdir -p $LOCAL_REPOSITORY
    mkdir $LOCAL_VERSIONS_DIR
    git clone $DEFAULT_EMACS_REPOSITORY $LOCAL_REPOSITORY
fi

cp -rf $LOCAL_EMACSENV_REPOSITORY $EMACSENV_HOME/bin
mkdir $LOG_DIR
cp -rf $LOCAL_EMACSENV_REPOSITORY/../sample $EMACSENV_HOME
mkdir $ENV_DIR

cat <<EOF

export PATH=$EMACSENV_HOME/bin:$PATH
EOF

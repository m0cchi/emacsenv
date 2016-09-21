function or() {
    if [ -z "$1" ]; then
        echo $2;
    else
        echo $1;
    fi
}

function check_error() {
    if [ $? -eq 0 ]; then
        return 0
    else
        if [ ! "$1" = "" ]; then
            echo "error: $1"
        fi
    fi
    if type finalize 1>/dev/null 2>/dev/null; then
        finalize $*
    fi
    return $?
}

function action() {
    echo "$(date '+%H:%M:%S'): $1" >> $LOG_DIR/$COMMAND`date '+%Y%m%d'`.log
    if [ "$1" = "" ]; then
        echo "none action"
        if type finalize 1>/dev/null 2>/dev/null; then
            finalize $*
        fi
        exit 1
    fi
    eval "$1"
    check_error
}

function search_envfile() {
    while [ ! -e "$(pwd)/$EMACSENV_FILE" -a ! "$(pwd)" = "/" ]
    do
        cd ../
    done
    
    ENV_FILE="$(pwd)/$EMACSENV_FILE"
    if [ -e "$ENV_FILE" ]; then
        ENV_FILE="$ENV_FILE"
    else
        ENV_FILE=$ENV_DIR/global
        if [ ! -e "$ENV_FILE" ]; then
            ENV_FILE=""
        fi
    fi
    echo $ENV_FILE
}

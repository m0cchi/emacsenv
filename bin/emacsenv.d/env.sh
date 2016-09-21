ENV_FILE=$(search_envfile)

if [ "$ENV_FILE" = "" ]; then
    exit 1
fi

EMACS_HOME=""
. $ENV_FILE

function show_env() { 
    echo $1=$(eval 'echo $'"$1")
}
EMACS_VERSION=`basename $EMACS_HOME`
HOME=$EMACS_HOME/profiles
show_env 'EMACSENV_HOME'
show_env 'EMACS_VERSION'
show_env 'EMACS_HOME'
show_env 'HOME'

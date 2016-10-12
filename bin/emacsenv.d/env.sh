ENV_FILE=$(search_envfile)

if [ "$ENV_FILE" = "" ]; then
    exit 1
fi

EMACS_HOME=""
. $ENV_FILE

function show_env() { 
    echo "$1$2"='"'$(eval 'echo $'"$2")'"'
}
prefix=$1
shift 1
EMACS_VERSION=`basename $EMACS_HOME`
HOME=$EMACS_HOME/profiles
show_env "$prefix" 'EMACSENV_HOME'
show_env "$prefix" 'EMACS_VERSION'
show_env "$prefix" 'EMACS_HOME'
show_env "$prefix" 'EMACSENV_PLUGINS_DIR'
show_env "$prefix" 'HOME'

ENV_FILE=$(search_envfile)

if [ "$ENV_FILE" = "" ]; then
    exit 1
fi

EMACS_HOME=""
. $ENV_FILE

if [ "$EMACS_HOME" = "" ]; then
    exit 1
fi

target=$1
shift 1

BIN_FILE="$EMACS_HOME/bin/$target"

if [ ! -e "$BIN_FILE" ]; then
    exit 1
fi

HOME=$EMACS_HOME/profiles $BIN_FILE $*

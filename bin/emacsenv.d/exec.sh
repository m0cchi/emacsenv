ENV_FILE=$(search_envfile)

if [ "$ENV_FILE" = "" ]; then
    echo "emacsenv: no environment file found. Run 'emacsenv global <version>' or create a .emacsenvfile" >&2
    exit 1
fi

EMACS_HOME=""
. $ENV_FILE

if [ "$EMACS_HOME" = "" ]; then
    echo "emacsenv: EMACS_HOME is not set in $ENV_FILE" >&2
    exit 1
fi

target=$1
shift 1

BIN_FILE="$EMACS_HOME/bin/$target"

if [ ! -e "$BIN_FILE" ]; then
    echo "emacsenv: binary not found: $BIN_FILE" >&2
    exit 1
fi

PROFILE_DIR=$(or "$PROFILE_DIR" "$EMACS_HOME/profiles")

HOME=$PROFILE_DIR $BIN_FILE $*

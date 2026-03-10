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

import_file=$1
shift 1

cp -rf $import_file $EMACS_HOME/profiles

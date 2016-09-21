ENV_FILE=$(search_envfile)

if [ "$ENV_FILE" = "" ]; then
    exit 1
fi

EMACS_HOME=""
. $ENV_FILE

if [ "$EMACS_HOME" = "" ]; then
    exit 1
fi

import_file=$1
shift 1

cp -rf $import_file $EMACS_HOME/profiles

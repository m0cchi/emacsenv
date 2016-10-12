if [ "$COMMAND" = "" ]; then
    exit 1
fi

if [ -e "$EMACSENV_PLUGINS_DIR/$COMMAND.sh" ]; then
    . "$EMACSENV_PLUGINS_DIR/$COMMAND.sh"
else
    exit 1
fi

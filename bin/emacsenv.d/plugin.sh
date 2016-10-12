if [ "$COMMAND" = "" ]; then
    exit 1
fi

# user's plugin.sh
if [ -e "$EMACSENV_PLUGINS_DIR/plugin.sh" ]; then
    . "$EMACSENV_PLUGINS_DIR/plugin.sh"
    return $?
fi

if [ -e "$EMACSENV_PLUGINS_DIR/$COMMAND.sh" ]; then
    . "$EMACSENV_PLUGINS_DIR/$COMMAND.sh"
else
    exit 1
fi

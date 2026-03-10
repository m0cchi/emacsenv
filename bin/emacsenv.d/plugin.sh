if [ "$COMMAND" = "" ]; then
    echo "emacsenv: no command specified. Run 'emacsenv help' for usage" >&2
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
    echo "emacsenv: unknown command '$COMMAND'. Run 'emacsenv help' for usage" >&2
    exit 1
fi

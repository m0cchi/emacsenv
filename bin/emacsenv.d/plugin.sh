if [ "$COMMAND" = "" ]; then
    exit 1
fi

if [ -e "$PLUGINS_DIR/$COMMAND.sh" ]; then
    . $PLUGINS_DIR/$COMMAND.sh
else
    exit 1
fi

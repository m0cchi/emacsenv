version=$1
shift 1

TARGET_PATH=$LOCAL_VERSIONS_DIR/$version

if [ ! -e "$TARGET_PATH" ]; then
    exit 0
fi

echo "PROFILE_DIR=$TARGET_PATH/profiles EMACS_HOME=$TARGET_PATH" > $GLOBAL_FILE

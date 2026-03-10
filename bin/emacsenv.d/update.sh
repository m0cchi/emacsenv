if [ "$LOCAL_REPOSITORY" = "" ]; then
    echo "emacsenv: LOCAL_REPOSITORY is not set. Run 'emacsenv setup' first" >&2
    exit 1
fi

cd $LOCAL_REPOSITORY
rm -rf ./[a-zA-Z]*
git reset --hard
git checkout master
git pull

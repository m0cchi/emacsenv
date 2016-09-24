if [ "$LOCAL_REPOSITORY" = "" ]; then
    exit 1
fi

cd $LOCAL_REPOSITORY
rm -rf ./[a-zA-Z]*
git reset --hard
git checkout master
git pull

#!bin/bash

bundle exec jekyll build
cd ../eltallerdelhuerto
cp -r ../jasper2-pages/* .

git add .
if [ "$1" != "" ]; then
    git commit -m "$1"
else
    git commit -m "Automatic deploy"
fi
git push origin master
cd ../carrascoacd.github.io

echo "Done!"
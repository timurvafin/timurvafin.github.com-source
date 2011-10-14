#!/usr/bin/sh

cp -R _public.git _site/.git
cd _site
git add .
git commit -m "`date`"
git push -f origin master
#mv .git ../public.git
cd ../
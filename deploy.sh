#!/bin/sh

cp -R _public.git _site/.git
cd _site
git add -A .
git commit -m "`date`"
git push -f origin master
rm -rf ../_public.git
mv .git ../_public.git
cd ../

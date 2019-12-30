#!/bin/bash

echo "This script checks for reference links in newly added documents."

rm -rf ./links-ko.txt
rm -rf ./links-ko-chk.txt

echo "Use the git log command to find new documents added in the last two weeks."

git log --name-only --pretty=oneline --diff-filter=A --since=2.weeks -- content/ko/docs >> links-ko.txt

sed -e '1d' -e 's/content\/ko/(/g' -e 's/.md//g' links-ko.txt >> links-ko.txt.tmp

mv links-ko.txt.tmp links-ko.txt

while read path
do
    grep -n -r "$path" content/ko/docs
done < links-ko.txt >> links-ko-chk.txt

echo "Please check the links-ko-chk.txt file and correct the link."

cat links-ko-chk.txt

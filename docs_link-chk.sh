#!/bin/bash

echo "This script checks for reference links in newly added documents."

rm -rf ./links-ko.txt
rm -rf ./links-ko-chk.txt

echo -e "How many weeks ago would you like to see data?: "
read weeks
echo "The week you enter is $weeks weeks. "

echo "Use the git log command to find new documents added in the last two weeks."

git log --name-only --pretty=oneline --diff-filter=A --since="$weeks".weeks -- content/ko/docs >> links-ko.txt

sed -e '/content/!d' -e 's/content\/ko/(/g' -e 's/.md//g' links-ko.txt >> links-ko.txt.tmp

mv links-ko.txt.tmp links-ko.txt

while read path
do
    grep -n -r "$path" content/ko/docs
done < links-ko.txt >> links-ko-chk.txt

rm -rf ./links-ko.txt

echo "Please check the links-ko-chk.txt file and correct the link."

cat links-ko-chk.txt

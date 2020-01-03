#!/bin/bash

RunScript(){
    SCIRPT_PWD=$(dirname $(realpath $0))
    rm -rf ./links-ko-chk.txt
    cd ..
    cd website
    rm -rf ./links-ko.txt
        
    echo -e "Check branch name: "
    read chkbranch
    echo "Entered branch name: $chkbranch"
    
    echo "Checkout "$chkbranch" branch."
    git checkout "$chkbranch"

    echo -e "How many weeks ago would you like to see data?: "
    read weeks
    echo "The week you enter is $weeks weeks. "

    echo "Use the git log command to find new documents added in the last "$weeks" weeks."

    git log --name-only --pretty=oneline --diff-filter=A --since="$weeks".weeks -- content/ko/docs >> links-ko.txt

    sed -e '/content/!d' -e 's/content\/ko/(/g' -e 's/.md//g' links-ko.txt >> links-ko.txt.tmp

    mv links-ko.txt.tmp links-ko.txt

    while read path
    do
        grep -n -r "$path" content/ko/docs
    done < links-ko.txt >> "$SCIRPT_PWD"/links-ko-chk.txt

    rm -rf ./links-ko.txt

    echo "Please check the links-ko-chk.txt file and correct the link."

    cat "$SCIRPT_PWD"/links-ko-chk.txt
}

echo "This script checks for reference links in newly added documents."

if [ -d "../website" ]; then
    echo "Checked the website folder. Run the script."
    RunScript
else
    echo "Please run the script from the original folder."
fi

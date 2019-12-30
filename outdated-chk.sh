#!/bin/bash

RunScript(){
    cd website
    rm -rf ./outdated-ko.txt
    rm -rf ./outdated-en.txt
    rm -rf ./docs-ko.txt

    echo -e "Previous branch name: "
    read prebranch
    echo "Entered branch name: $prebranch"

    echo -e "Current branch name: "
    read currbranch
    echo "Entered branch name: $currbranch"

    echo "Check for differences between branches with the git diff command."

    git diff --name-only upstream/"$prebranch" upstream/"$currbranch" -- content/en/docs >> outdated-en.txt

    find content/ko/docs >> docs-ko.txt

    sed -e 's/content\/ko/content\/en/g' docs-ko.txt > docs-en.txt.tmp

    mv docs-en.txt.tmp docs-en.txt

    comm -12 outdated-en.txt docs-en.txt >> ../outdated-ko.txt

    rm -rf ./outdated-en.txt
    rm -rf ./docs-ko.txt

    echo "Check the contents of the outdated-ko.txt file."

    cat ../outdated-ko.txt
}

echo "This script is for checking outdated files of Korean team."

if [ -d "website" ]; then
    echo "Checked the website folder. Run the script."
    RunScript
else
    echo "This script must be run outside the website folder."
fi

git checkout master
git merge dev

#!/usr/bin/env zsh
set -e
echo "Enter release version: "
read VERSION

read -p "Releasing $VERSION - are you sure? (y/n)" reply
echo    # (optional) move to a new line
if [ $reply = "y" ]
then
  #commit
  git add -A
  git commit -am "[build] $VERSION"

  # publish
  git push origin master
  git push origin refs/tags/v$VERSION

  # sync dev
  git checkout dev
  git rebase master
  git push origin dev
fi

#!/usr/bin/env sh
set -e
echo "Enter release version: "
read VERSION

read -p "Releasing $VERSION - are you sure? (y/n)" reply
echo    # (optional) move to a new line
if [ $reply = "y" ]
then
  # build
  yarn build:lib
  npm version $VERSION --message "[release] $VERSION"
  npm publish --access=public
fi

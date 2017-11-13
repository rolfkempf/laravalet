#!/bin/bash

#usage from valet park dir: "laravalet my-dirname"
#usage install in current dir: "laravalet ."

#params
#$1 directory must be a string (folder-name) or '.' for current dir

#if no param is set show feedback and exit
if [[ $# -eq 0 ]] ; then
    echo "Please provide a name for a directory or use simply '.' for the current dir."
    exit 1
fi

#set DIR var
if [ $1 == "." ]; then
  DIR=${PWD##*/}
else
  #create directory and go there
  mkdir $1
  cd $1
  DIR=$1
fi

#install laravel with laravel new xxx in subdir 'laravel-tmp'
laravel new laravel-tmp

#move all files from 'laravel-tmp'to parent dir
shopt -s dotglob #this moves hidden files, otherwise .env won´t be moved
mv laravel-tmp/* ./

#delete 'laravel-tmp'
rm -rf laravel-tmp

#create sqlite-database-file
touch database/database.sqlite

#remove all database related lines from .env
sed -i '' '/^DB_/d' ./.env

#edit .env file to use sqlite-database-file (add line to the end)
echo "DB_CONNECTION=sqlite" >> ./.env

#run npm
yarn

#composer
composer require barryvdh/laravel-debugbar --dev
composer require barryvdh/laravel-ide-helper --dev

#valet
valet link ${DIR}

#open 'folder-name' in browser
open "http://${PWD##*/}.localhost"

#open in phpstorm
open .

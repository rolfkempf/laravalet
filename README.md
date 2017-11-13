# Laravalet

Valet already has made setting up a new Laravel install a breeze, so what is Laravalet for? 
My personal use-case is this:
- go to a directory where `valet park` was run before
- run `laravalet my-project` 
- start coding

The script uses the laravel installer to create a new app, changes the databse-config to use sqlite and opens the app in a browser window. Comes in pretty handy if you want to try composer packages or just want to get started quickly.

##How to use

Navigate to your directory that is registered as a "Valet Park" and run the script like this:
- `laravalet my-project` to create a new directory 
- `laravalet .` if you already created the directory.

You need to add laravalet as an alias to your shell, like this (zsh)
`alias laravalet="/path/to/script/laravalet.sh"`

After using the laravel installer, doing some modifications to the .env-file (to use sqlite) 
and running `npm install`  the script opens the folder 'my-project.dev'.

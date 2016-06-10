# Laravalet
Setup a Laravel instance super-quickly in a "parked" directory (using Valet)

I built this script to setup new Laravel applications. It uses the laravel installer as well as Valet. 

##How to use

Navigate to your directory that is registered as a "Valet Park" and run the script like this:
- `laravalet my-project` to create a new directory 
- `laravalet .` if you already created the directory.

You need to add laravalet as an alias to your shell, like this (zsh)
`alias laravalet="/path/to/script/laravalet.sh"`

After using the laravel installer, doing some modifications to the .env-file (to use sqlite) 
and running `npm install`  the script opens the folder 'my-project.dev'.

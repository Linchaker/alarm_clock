#!bin/bash


# main folder/disc with media
path=D:
# name of folder for execute
name="Season"


findAndRunMedia(){
shopt -s globstar
for i in $name*
do
    firstFolder=$i
    cd "$firstFolder"

    # before add mpc player to PATH
    # from bash don't work "fullscreen" flag
    echo "mpc \"$path/$firstFolder/$j\" /fullscreen /playnext" > wake_up.cmd
    ./wake_up.cmd
    #remove after close
    rm wake_up.cmd
    break

done
}

cd $path
findAndRunMedia
#!bin/bash


# main folder/disc with media
mainPath=D:
# path to player
playerPath="C:/Program Files/MPC-HC/mpc.exe"
# name of folder for execute by default
name="Season"

if test "$1" != ""
then
	name=$1
fi

findAndRunMedia(){
shopt -s globstar
for i in $name*
do
    firstFolder=$i
    cd "$firstFolder"

    # before add mpc player to PATH
    # from bash don't work "fullscreen" flag
    echo "\"$playerPath\" \"$mainPath/$firstFolder/$j\" /fullscreen /playnext" > wake_up.cmd
    ./wake_up.cmd
    #remove after close
    rm wake_up.cmd
    break

done
}

cd $mainPath
findAndRunMedia

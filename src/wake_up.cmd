@echo off
title "Computer Alarm Clock"
echo "run..."
SetLocal enabledelayedexpansion

:: main folder/disc with media
set mainPath=d:
:: path to player
set playerPath="C:\Program Files\MPC-HC\mpc.exe"
:: script location
set scriptDir=%~dp0
:: name of folder for execute by default
set name=Season
set maxVolume=100
set setVolume=22

if not "%1" == "" (
  set name="%1"
)

:: run
cd /d %mainPath%
call :volumeSetting
call :findAndRunMedia
:: back to start folder
cd /d %scriptDir%
goto :endfile
:: end


::function
:findAndRunMedia
  for /d %%j in (%name%*) do (
    set firstFolder=%%j
    :: run player
    %playerPath% "%mainPath%/!firstFolder!" /fullscreen /playnext
    goto :eof
  )
goto :eof

::function
:volumeSetting
  set volume=%maxVolume%
  :soundDown
    wscript %scriptDir%volume\down.js
    set /a volume-=2
    if %volume% GTR 0 goto soundDown

  :soundSet
    wscript %scriptDir%volume\up.js
    set /a volume+=2
    if %volume% LSS %setVolume% goto soundSet
goto :eof


:endfile
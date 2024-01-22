#!/bin/bash

mkdir -p ~/.steam/sdk64/
steamcmd +login anonymous +app_update 1007 +quit
cp ~/Steam/steamapps/common/Steamworks\ SDK\ Redist/linux64/steamclient.so ~/.steam/sdk64/

# Download game files using SteamCMD to the specified volume
# The volume needs to be mounted when running the container

# Run SteamCMD to download the game files using app ID - 2394010 ( Palworld server )
steamcmd +force_install_dir /home/game_server +login anonymous +app_update 2394010 validate +quit

cd /home/game_server

./PalServer.sh
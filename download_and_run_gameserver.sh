#!/bin/bash

# Download game files using SteamCMD to the specified volume
# The volume needs to be mounted when running the container

# Run SteamCMD to download the game files using app ID - 2394010 ( Palworld server )
steamcmd +force_install_dir /home/game_server +login anonymous +app_update 2394010 validate +quit

chown steam:steam /home/game_server -Rf
su steam
cd /home/game_server
./PalServer.sh
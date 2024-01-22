From steamcmd/steamcmd

RUN mkdir -p ~/.steam/sdk64/ && steamcmd +login anonymous +app_update 1007 +quit && cp ~/Steam/steamapps/common/Steamworks\ SDK\ Redist/linux64/steamclient.so ~/.steam/sdk64/

# Copy our shell script to docker container.
# This shell script will be used to download gamefiles
# and configure our gameserver.
# Description for this file is given later
COPY download_and_run_gameserver.sh /home/entrypoint.sh

# Set executable permissions for our shell script
RUN chmod +x /home/entrypoint.sh

VOLUME [ "/home/game_server" ]

EXPOSE 8211/udp

# Set our shell script as entrypoint for our container
# So that it gets executed when we RUN the container
ENTRYPOINT [ "/home/entrypoint.sh"]
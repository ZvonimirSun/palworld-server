#!/bin/bash
bash "${STEAMCMDDIR}/steamcmd.sh" +login "${STEAMUSER}" \
                                  +app_update "${STEAMAPPID}" \
                                  +quit

cd "${STEAMAPPDIR}"
./PalServer.sh

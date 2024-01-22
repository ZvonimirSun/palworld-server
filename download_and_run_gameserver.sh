#!/bin/bash
mkdir -p "${STEAMAPPDIR}" || true

bash "${STEAMCMDDIR}/steamcmd.sh" +force_install_dir "${STEAMAPPDIR}" \
                                  +login "${STEAMUSER}" \
                                  +app_update "${STEAMAPPID}" \
                                  +quit

cd "${STEAMAPPDIR}"
./PalServer.sh

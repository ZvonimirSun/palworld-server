FROM cm2network/steamcmd:root as build_stage

ENV STEAMAPPID 2394010
ENV STEAMAPP Palworld
ENV STEAMAPPDIR "${HOMEDIR}/${STEAMAPP}"
COPY download_and_run_gameserver.sh "${HOMEDIR}/entry.sh"

RUN mkdir -p "${STEAMAPPDIR}" \
    && chmod +x "${HOMEDIR}/entry.sh" \
    && chown -R "${USER}:${USER}" "${HOMEDIR}/entry.sh" "${STEAMAPPDIR}"

FROM build_stage AS bullseye-base

# Switch to user
USER ${USER}

WORKDIR ${HOMEDIR}

CMD ["bash", "entry.sh"]

EXPOSE 8211/udp

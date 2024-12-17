FROM python:3.12-slim

WORKDIR /app

ENV PIP_NO_CACHE_DIR=1

RUN pip install --upgrade pip && \
    pip install anki[syncserver]

ARG SYNC_BASE
ARG SYNC_USER1
ARG SYNC_HOST
ARG SYNC_PORT

ENV SYNC_BASE=${SYNC_BASE}
ENV SYNC_USER1=${SYNC_USER1}
ENV SYNC_HOST=${SYNC_HOST}
ENV SYNC_PORT=${SYNC_PORT}

EXPOSE ${SYNC_PORT}/tcp

CMD ["python", "-m", "anki.syncserver"]

FROM alpine as downloader
RUN apk add curl
RUN curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py > get-poetry.py

FROM python:3.7-alpine3.8

ENV PYTHONFAULTHANDLER=1 \
  PYTHONUNBUFFERED=1 \
  PYTHONHASHSEED=random \
  PIP_NO_CACHE_DIR=off \
  PIP_DISABLE_PIP_VERSION_CHECK=on \
  PIP_DEFAULT_TIMEOUT=100 \
  POETRY_VERSION=0.12.17
  # POETRY_HOME=/opt/poetry \

COPY --from=downloader get-poetry.py /opt/get-poetry.py
RUN python /opt/get-poetry.py && mv $HOME/.poetry /opt/poetry
ENTRYPOINT ["/opt/poetry/bin/poetry"]

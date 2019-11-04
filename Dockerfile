ARG IMAGE=python:3.7-slim

FROM $IMAGE
ARG POETRY_VERSION="1.0.0b3"
ADD https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py /opt/get-poetry.py

ENV PYTHONFAULTHANDLER=1 \
  PYTHONUNBUFFERED=1 \
  PYTHONHASHSEED=random \
  PIP_NO_CACHE_DIR=off \
  PIP_DISABLE_PIP_VERSION_CHECK=on \
  PIP_DEFAULT_TIMEOUT=100 \
  POETRY_VERSION=$POETRY_VERSION

RUN pip3 install --no-cache-dir --upgrade pip && python /opt/get-poetry.py && mv $HOME/.poetry /opt/poetry
ENV PATH="/opt/poetry/bin:${PATH}"
ENTRYPOINT ["poetry"]

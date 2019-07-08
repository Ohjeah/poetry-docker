FROM python:3.7-slim
ADD https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py /opt/get-poetry.py

ENV PYTHONFAULTHANDLER=1 \
  PYTHONUNBUFFERED=1 \
  PYTHONHASHSEED=random \
  PIP_NO_CACHE_DIR=off \
  PIP_DISABLE_PIP_VERSION_CHECK=on \
  PIP_DEFAULT_TIMEOUT=100 \
  POETRY_VERSION=0.12.17
  # POETRY_HOME=/opt/poetry \

RUN python /opt/get-poetry.py && mv $HOME/.poetry /opt/poetry
ENV PATH="/opt/poetry/bin:${PATH}"
ENTRYPOINT ["poetry"]

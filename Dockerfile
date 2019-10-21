FROM python:3.7-alpine3.10 as development_build

LABEL maintainer="kanmii"

ENV PTYHONBUFFERED=1 \
  PYTHONFAULTHANDLER=1 \
  PIP_NO_CACHE_DIR=off \
  PIP_DISABLE_PIP_VERSION_CHECK=on

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

WORKDIR /app
COPY ./app /app/

RUN adduser -D user
USER user

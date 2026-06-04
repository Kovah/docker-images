FROM node:lts-trixie-slim AS node

FROM python:slim-trixie

ARG ANSIBLE_VERSION=13.7.0

COPY --from=node /usr/local/ /opt/node/

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        git \
        openssh-client \
        sshpass \
    && ln -sf /opt/node/bin/node /usr/local/bin/node \
    && ln -sf /opt/node/bin/npm /usr/local/bin/npm \
    && ln -sf /opt/node/bin/npx /usr/local/bin/npx \
    && ln -sf /opt/node/bin/corepack /usr/local/bin/corepack \
    && pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir "ansible==${ANSIBLE_VERSION}" \
    && python --version \
    && pip --version \
    && ansible --version \
    && ansible-playbook --version \
    && node --version \
    && npm --version \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /app
WORKDIR /app

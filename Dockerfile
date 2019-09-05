FROM python:3.6

ENV KEBECHET_REPO_URL = 'https://${GITHUB_REPOSITORY}/${GITHUB_REF}' \
    KEBECHET_VERBOSE  = 1 \
    PIPENV_NOSPIN     = 1

COPY LICENSE README.md /
COPY entrypoint.sh /entrypoint.sh

RUN pip install kebechet

ENTRYPOINT [ "/entrypoint.sh" ]
FROM python:3.6

ENV  PIPENV_NOSPIN=1

COPY LICENSE README.md /
COPY entrypoint.sh /entrypoint.sh

RUN pip install kebechet

ENTRYPOINT [ "/entrypoint.sh" ]

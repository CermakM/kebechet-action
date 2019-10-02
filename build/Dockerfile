FROM registry.access.redhat.com/ubi8/python-36

LABEL "com.github.actions.name"="kebechet"
LABEL "com.github.actions.description"="Action to trigger Kebechet repository manager."
LABEL "com.github.actions.icon"="user-check"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="http://github.com/cermakm/kebechet-action"
LABEL "homepage"="http://github.com/cermakm/kebechet-action"
LABEL "maintainer"="Marek Cermak <macermak@redhat.com>"

ENV USER=kebechet \
    PIPENV_NOSPIN=1

COPY LICENSE README.md /
COPY entrypoint.sh /entrypoint.sh

RUN pip install "git+https://github.com/thoth-station/kebechet@${GITHUB_REF##*/}"

USER root
ENTRYPOINT [ "/entrypoint.sh" ]

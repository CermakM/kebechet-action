# kebechet-action

GitHub Action to trigger Kebechet Automation bot for the current repository

Kebechet
--------

    I'm Kebechet, goddess of freshness. I will keep your sources and dependencies fresh and up-to-date.

Kebechet is a SourceOps bot that automates updating dependencies of your project. Currently, it supports managing and updating Python projects based on [pipenv](https://docs.pipenv.org/) files (`Pipfile` and `Pipfile.lock`) or `requirements.txt`/`requirements.in` files (see [pip-tools](https://pypi.org/project/pip-tools/) - Kebechet is a replacement for it)


For more information about Kebchet see the [README](/kebechet/README.rst).

SETUP
=====

1) Add the Kebechet action to your workflow


Notes
=====

To issue an update to Git repository, Kebechet creates branches in the provided repository.
# Atelier B User Guide

This project contains the sources for the user guide of
Atelier B. The guide is in Markdown format.

The shell script `publish.sh` provides a command to produce a PDF version.
It may be used as follows:
```bash
./publishpdf.sh
```

Gitlab CI has a job that automatically publishes the PDF of the user guide.

## Tools required

File `Dockerfile` contains all the Docker commands to fetch the tools that
are needed to publish the PDF on Linux.

## Versioning

The publishing script automatically sets the version number to `XXX` when
the commit is `version/XXX`. Otherwise the version is `Unassigned`.


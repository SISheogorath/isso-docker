#!/bin/sh

if [ "$1" = "--help" ]; then
    echo "
    Usage of $0:
        $0 <PREFIX> <VERSION> <SUFFIX>

    Example:
        $0 isso 0.5.1 alpine
    "
fi

PREFIX=${1:-isso}
VERSION=${2}
[ "${3}" != "" ] && [ "${3}" != "debian" ] && SUFFIX="-${3}"



if [ "$VERSION" != "" ]; then
    docker tag isso:testing "$PREFIX:$(echo ${VERSION} | cut -d. -f1)${SUFFIX}"
    docker tag isso:testing "$PREFIX:$(echo ${VERSION} | cut -d. -f1-2)${SUFFIX}"
    docker tag isso:testing "$PREFIX:$(echo ${VERSION} | cut -d. -f1-3)${SUFFIX}"
    [ "$SUFFIX" = "" ] && docker tag isso:testing "$PREFIX:latest"
else
    echo "No version provided. Skipping tagging..."
fi

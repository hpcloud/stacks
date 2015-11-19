#!/bin/sh
# Prepare the docker image before commiting.
set -ex

mkdir -p /etc/stackato/

# Save image env at /etc/stackato, for it won't be available to ssh clients
env > /etc/stackato/image.env
# Save a JSON version.
python -c "import os,json; print json.dumps(os.environ.copy())" > /etc/stackato/image.env.json


#!/usr/bin/env bash
set -e

# Build for conda from PyPI
source deactivate test

export TAG_DESCRIBE=$(git describe)
export BUILD_VERSION=$(echo $TAG_DESCRIBE | sed 's/-/ /g'  | awk '{print $1}')
export BUILD_NUMBER=0

conda build --python $(CONDA_PY) package/moleculekit/

bash -x ./ci/travis/conda_upload.sh;

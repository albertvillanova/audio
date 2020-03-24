#!/bin/bash
set -ex

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
. "$script_dir/pkg_helpers.bash"

export BUILD_TYPE="conda"
export NO_CUDA_PACKAGE=1
setup_env 0.4.1
export SOURCE_ROOT_DIR="$PWD"
setup_conda_pytorch_constraint
conda build $CONDA_CHANNEL_FLAGS --no-anaconda-upload --python "$PYTHON_VERSION" packaging/torchaudio
